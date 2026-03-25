package com.atlas.optimizer

import android.content.pm.PackageManager
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.ProgressBar
import android.widget.TextView
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import rikka.shizuku.Shizuku
import java.io.BufferedReader
import java.io.InputStreamReader

class MainActivity : AppCompatActivity() {

    private lateinit var txtLog: TextView
    private lateinit var btnOptimize: Button
    private lateinit var progressBar: ProgressBar

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        txtLog = findViewById(R.id.txtLog)
        btnOptimize = findViewById(R.id.btnOptimize)
        progressBar = findViewById(R.id.progressBar)

        btnOptimize.setOnClickListener {
            if (checkShizukuPermission()) {
                executeOptimizationScript()
            }
        }

        Shizuku.addRequestPermissionResultListener { requestCode, grantResult ->
            if (requestCode == 1001 && grantResult == PackageManager.PERMISSION_GRANTED) {
                executeOptimizationScript()
            }
        }
    }

    private fun checkShizukuPermission(): Boolean {
        if (!Shizuku.pingBinder()) {
            appendLog("Hata: Shizuku calismiyor!")
            Toast.makeText(this, "Shizuku calismiyor!", Toast.LENGTH_SHORT).show()
            return false
        }

        if (Shizuku.checkSelfPermission() == PackageManager.PERMISSION_GRANTED) {
            return true
        } else if (Shizuku.shouldShowRequestPermissionRationale()) {
            appendLog("Hata: Shizuku izni reddedildi.")
            return false
        } else {
            Shizuku.requestPermission(1001)
            return false
        }
    }

    private fun executeOptimizationScript() {
        btnOptimize.isEnabled = false
        progressBar.visibility = View.VISIBLE
        progressBar.progress = 0
        txtLog.text = "Optimizasyon başlatılıyor..."
        
        try {
            // Assets icindeki scripti oku
            val scriptContent = assets.open("optimize.sh").bufferedReader().use { it.readText() }
            
            // Shizuku ile shell uzerinden yurut
            val process = try {
                val method = Shizuku::class.java.getDeclaredMethod("newProcess", Array<String>::class.java, Array<String>::class.java, String::class.java)
                method.isAccessible = true
                method.invoke(null, arrayOf("sh", "-c", scriptContent), null, null) as Process
            } catch (e: Exception) {
                appendLog("Shizuku newProcess hatasi: ${e.message}")
                Runtime.getRuntime().exec(arrayOf("sh", "-c", scriptContent))
            }
            
            Thread {
                val reader = BufferedReader(InputStreamReader(process.inputStream))
                val errorReader = BufferedReader(InputStreamReader(process.errorStream))
                
                var line: String?
                while (reader.readLine().also { line = it } != null) {
                    runOnUiThread { appendLog(line ?: "") }
                }
                while (errorReader.readLine().also { line = it } != null) {
                    runOnUiThread { appendLog("Error: $line") }
                }
                
                val exitCode = process.waitFor()
                runOnUiThread {
                    progressBar.visibility = View.GONE
                    btnOptimize.isEnabled = true
                    appendLog("\n>>> Islem Tamamlandi. Exit Code: $exitCode")
                    Toast.makeText(this, "Optimizasyon Tamamlandi!", Toast.LENGTH_LONG).show()
                }
            }.start()

        } catch (e: Exception) {
            appendLog("Hata: ${e.message}")
        }
    }

    private fun appendLog(text: String) {
        if (text.isBlank() || text.contains("null")) return
        
        runOnUiThread {
            txtLog.append("\n$text")
            
            // Scroll to bottom safely
            val scrollView = txtLog.parent.parent as? android.widget.ScrollView
            scrollView?.post {
                scrollView.fullScroll(android.view.View.FOCUS_DOWN)
            }
        }
    }
}
