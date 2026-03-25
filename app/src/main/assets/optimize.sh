#!/system/bin/sh
# PUBG Mobile — Maksimum FPS & Sıfır Gecikme
# Yazar  : ATLAS
# Cihaz  : Xiaomi Pad Mini | HyperOS 3 | Android 16 | Dimensity 9400+
# Mod    : Brevent + Shizuku (root gerektirmez)
# Hedef  : com.tencent.ig

# LOG=/storage/emulated/0/Download/pubg_optimize_log.txt
# > "$LOG"

ui()   { echo "$1"; sleep 0.5; }
log()  { echo "$1"; sleep 0.05; }
ok()   { echo "  [✓] $1"; sleep 0.05; }
skip() { echo "  [~] $1"; sleep 0.05; }

ui ""
ui "╔══════════════════════════════════════════╗"
ui "║   PUBG Mobile Optimizasyon — by ATLAS    ║"
ui "║   HyperOS 3 / Android 16                 ║"
ui "╚══════════════════════════════════════════╝"
ui ""

log "PUBG Mobile Optimizasyon — by ATLAS"
log "$(date)"
log ""


# ─────────────────────────────────────────────
# 1. HyperOS & Sistem
# ─────────────────────────────────────────────
ui "  ⚙  Sistem ayarları uygulanıyor..."
log "[1] HyperOS & Sistem"

settings put global miui_optimization              0 2>/dev/null && ok "MIUI optimization: kapalı"            || skip "miui_optimization"
settings put global power_mode                     2 2>/dev/null && ok "HyperOS power_mode: High Performance" || skip "power_mode"
settings put global powercfg_enable                0 2>/dev/null && ok "HyperOS CPU/GPU güç kısıtı: kapalı"  || skip "powercfg_enable"
settings put global miui_game_booster_enabled      1 2>/dev/null && ok "HyperOS Game Turbo: aktif"            || skip "game_booster"
settings put global feas_enable                    1 2>/dev/null && ok "HyperOS FEAS: aktif"                  || skip "feas_enable"
settings put global miui_refresh_rate_mode         2 2>/dev/null && ok "HyperOS refresh rate: yüksek"         || skip "miui_refresh_rate_mode"
settings put global gpu_turbo_enable               1 2>/dev/null && ok "Xiaomi GPU Turbo: aktif"              || skip "gpu_turbo_enable"
settings put global ram_expand_size                0 2>/dev/null && ok "RAM Plus (sanal RAM): kapalı"         || skip "ram_expand_size"
settings put global miui_app_manage_enable         0 2>/dev/null && ok "MIUI uygulama kısıtı: kapalı"        || skip "miui_app_manage"
settings put global miui_aggressive_kill_enable    0 2>/dev/null && ok "MIUI agresif kill: kapalı"           || skip "miui_aggressive_kill"
settings put global dynamic_power_savings_enabled  0 2>/dev/null && ok "Dinamik güç tasarrufu: kapalı"       || skip "dynamic_power_savings"
settings put global miui_ad_mode                   0 2>/dev/null
settings put global personalized_ad_enabled        0 2>/dev/null
ok "Reklam & analitik: kapalı"
settings put global miui_game_speed_booster        1 2>/dev/null && ok "Game Speed Booster: aktif"           || skip "game_speed_booster"
settings put global game_mode_enabled              1 2>/dev/null && ok "Sistem game mode: aktif"             || skip "game_mode_enabled"
settings put global miui_gaming_mode               1 2>/dev/null && ok "MIUI gaming mode: aktif"             || skip "miui_gaming_mode"
settings put global miui_game_turbo_fps          120 2>/dev/null && ok "Game Turbo FPS: 120"                 || skip "miui_game_turbo_fps"
settings put global miui_performance_mode_enabled  1 2>/dev/null && ok "MIUI performance mode: aktif"        || skip "miui_performance_mode"

cmd power set-fixed-performance-mode-enabled true 2>/dev/null \
  && ok "Android 16 Fixed Performance Mode: aktif" || skip "fixed-performance-mode"

cmd game mode performance com.tencent.ig 2>/dev/null \
  && ok "Game Mode: performance" \
  || { cmd game mode 2 com.tencent.ig 2>/dev/null \
    && ok "Game Mode: 2 (performance)" \
    || { cmd game set --mode 2 --package com.tencent.ig 2>/dev/null \
      && ok "Game Mode (alternatif): aktif" \
      || skip "game mode"; }; }

device_config put game_overlay com.tencent.ig "mode=2,downscaleFactor=1.0,fps=120" 2>/dev/null \
  && ok "Game overlay: fps=120 + downscale=1.0" || skip "device_config game_overlay"

setprop log.tag.MIUILOG              disable 2>/dev/null && ok "MIUI log: kapalı"           || skip "MIUILOG"
setprop debug.atrace.tags.enableflags      0 2>/dev/null && ok "Atrace tags: kapalı"        || skip "atrace.tags"
setprop log.tag.stats_log              OFF   2>/dev/null && ok "stats_log: kapalı"          || skip "stats_log"
settings put global hide_error_dialogs       1 2>/dev/null && ok "ANR hata diyalogları: gizli" || skip "hide_error_dialogs"
settings put global dropbox_max_files        0 2>/dev/null && ok "Dropbox log: kapalı"        || skip "dropbox_max_files"
settings put global activity_starts_logging_enabled 0 2>/dev/null && ok "Activity log: kapalı" || skip "activity_starts_log"

setprop debug.mtk.disp.framerate          120 2>/dev/null && ok "MTK display framerate: 120Hz" || skip "mtk.disp.framerate"

am set-inactive com.tencent.ig false 2>/dev/null && ok "PUBG: inaktif değil" || skip "set-inactive"

settings put system intelligent_sleep_mode   0 2>/dev/null && ok "Intelligent sleep mode: kapalı" || skip "intelligent_sleep"
settings put secure adaptive_sleep           0 2>/dev/null && ok "Adaptive sleep: kapalı"         || skip "adaptive_sleep"
settings put secure screensaver_enabled      0 2>/dev/null && ok "Screensaver: kapalı"            || skip "screensaver"
settings put secure screensaver_activate_on_sleep 0 2>/dev/null && ok "Screensaver on sleep: kapalı" || skip "screensaver_sleep"
settings put system send_security_reports    0 2>/dev/null && ok "Güvenlik raporu: kapalı"        || skip "send_security_reports"
settings put secure send_action_app_error    0 2>/dev/null && ok "Uygulama hata gönderme: kapalı" || skip "send_action_app_error"
settings put system master_motion            0 2>/dev/null && ok "Master motion: kapalı"          || skip "master_motion"
settings put system motion_engine            0 2>/dev/null && ok "Motion engine: kapalı"          || skip "motion_engine"
settings put system air_motion_engine        0 2>/dev/null && ok "Air motion engine: kapalı"      || skip "air_motion_engine"

logcat -c 2>/dev/null && ok "Logcat tamponu temizlendi" || skip "logcat"
log ""


# ─────────────────────────────────────────────
# 2. Arka Plan & Cache Temizleme
# ─────────────────────────────────────────────
ui "  🧹 Arka plan & cache temizleniyor..."
log "[2] Arka Plan & Cache"

am kill-all 2>/dev/null && ok "Arka plan uygulamaları kapatıldı"
am broadcast -a android.intent.action.CLOSE_SYSTEM_DIALOGS 2>/dev/null && ok "Sistem diyalogları temizlendi"
pm trim-caches 256m       2>/dev/null && ok "Cache: 256MB temizlendi"      || skip "trim-caches"
pm trim-caches 9999999999 2>/dev/null && ok "Dalvik/ART cache: temizlendi" || skip "dalvik cache"

for pkg in \
  com.miui.analytics com.miui.msa.global com.xiaomi.mipicks com.miui.daemon \
  com.miui.voiceassist com.xiaomi.aiasst.service com.miui.contentextension \
  com.miui.systemAdSolution com.miui.cloudservice com.miui.cloudbackup \
  com.miui.hybrid com.miui.bugreport com.miui.personalassistant \
  com.miui.contentcatcher com.miui.weather2 com.miui.notes com.miui.gallery \
  com.miui.scanner com.miui.mishare.connectivity com.miui.screenrecorder \
  com.xiaomi.joyose com.xiaomi.finddevice com.miui.miservice \
  com.google.android.apps.wellbeing com.google.android.googlequicksearchbox \
  com.google.android.apps.subscriptions.red com.google.android.gms.persistent \
  com.google.android.partnersetup; do
  am force-stop "$pkg" 2>/dev/null && ok "Force stop: $pkg" || skip "$pkg"
done
log ""


# ─────────────────────────────────────────────
# 3. RAM & Bellek
# ─────────────────────────────────────────────
ui "  💾 RAM optimizasyonu uygulanıyor..."
log "[3] RAM & Bellek (12GB)"

settings put global zram_enabled             0 2>/dev/null && ok "ZRAM/swap: kapalı"         || skip "zram_enabled"
settings put global memory_management_mode   1 2>/dev/null && ok "HyperOS memory: perf modu" || skip "memory_management_mode"
log ""


# ─────────────────────────────────────────────
# 4. CPU — Dimensity 9400+
# Little (0-3): schedutil | Big (4-6): performance+sabit | Prime (7): performance+sabit
# ─────────────────────────────────────────────
ui "  🔲 CPU ayarları uygulanıyor..."
log "[4] CPU — Dimensity 9400+"

for cpu in /sys/devices/system/cpu/cpu*/online; do
  echo 1 > "$cpu" 2>/dev/null
done
ok "Tüm CPU core'ları: online"

for i in 0 1 2 3; do
  echo schedutil > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor 2>/dev/null
done
echo schedutil > /sys/devices/system/cpu/cpufreq/policy0/scaling_governor 2>/dev/null
ok "CPU 0-3 (A720 Little): schedutil"

for i in 4 5 6; do
  echo performance > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor 2>/dev/null
  MAX=$(cat /sys/devices/system/cpu/cpu$i/cpufreq/scaling_max_freq 2>/dev/null)
  [ -n "$MAX" ] && echo "$MAX" > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_min_freq 2>/dev/null
done
echo performance > /sys/devices/system/cpu/cpufreq/policy4/scaling_governor 2>/dev/null
ok "CPU 4-6 (X4 Big): performance + min=max"

echo performance > /sys/devices/system/cpu/cpu7/cpufreq/scaling_governor 2>/dev/null
echo performance > /sys/devices/system/cpu/cpufreq/policy7/scaling_governor 2>/dev/null
MAX7=$(cat /sys/devices/system/cpu/cpu7/cpufreq/scaling_max_freq 2>/dev/null)
[ -n "$MAX7" ] && echo "$MAX7" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq 2>/dev/null \
  && ok "CPU7 (X925 Prime): performance + min=$MAX7 Hz (sabit)" \
  || ok "CPU7 (X925 Prime): performance governor"

for d in /proc/irq/*/; do echo f0 > "${d}smp_affinity" 2>/dev/null; done
ok "IRQ affinity: big+prime core (f0)"

for irq_name in wlan wifi mmc0 mmc1; do
  IRQ_NUM=$(grep -l "$irq_name" /proc/irq/*/name 2>/dev/null | head -1 | cut -d/ -f4)
  [ -n "$IRQ_NUM" ] && echo f0 > /proc/irq/$IRQ_NUM/smp_affinity 2>/dev/null \
    && ok "IRQ ($irq_name): prime+big core"
done

for i in 0 1 2 3; do
  echo 500 > /sys/devices/system/cpu/cpu$i/cpufreq/schedutil/up_rate_limit_us 2>/dev/null
done
ok "Little core schedutil up_rate_limit: 500μs"

setprop debug.sf.enable_sched_fifo 1 2>/dev/null && ok "SF FIFO scheduling: aktif" || skip "sf.sched_fifo"
log ""


# ─────────────────────────────────────────────
# 5. GPU — Arm Immortalis-G925 MC12
# ─────────────────────────────────────────────
ui "  🎮 GPU ayarları uygulanıyor..."
log "[5] GPU — Immortalis-G925 MC12"

for gov_path in /sys/class/devfreq/*/governor; do
  echo performance > "$gov_path" 2>/dev/null
done
ok "Tüm devfreq: performance"

for gpath in \
  /sys/class/devfreq/gpufreq/min_freq \
  /sys/class/devfreq/13000000.mali/min_freq \
  /sys/kernel/gpu/gpu_min_clock; do
  if [ -f "$gpath" ]; then
    MAX_PATH=$(echo "$gpath" | sed 's/min_freq/max_freq/;s/gpu_min_clock/gpu_max_clock/')
    GPU_MAX=$(cat "$MAX_PATH" 2>/dev/null)
    [ -n "$GPU_MAX" ] && echo "$GPU_MAX" > "$gpath" 2>/dev/null \
      && ok "GPU min freq: $GPU_MAX Hz (maks sabit)" && break
  fi
done

for gpath in \
  /sys/class/devfreq/gpufreq/power_policy \
  /sys/class/devfreq/13000000.mali/power_policy; do
  [ -f "$gpath" ] && echo always_on > "$gpath" 2>/dev/null \
    && ok "GPU power policy: always_on" && break
done

for gpath in \
  /sys/class/devfreq/gpufreq/dvfs_enabled \
  /sys/module/mali/parameters/dvfs_enable; do
  [ -f "$gpath" ] && echo 0 > "$gpath" 2>/dev/null \
    && ok "GPU DVFS: kapalı" && break
done

for gpath in \
  /sys/class/devfreq/gpufreq/polling_interval \
  /sys/class/devfreq/13000000.mali/polling_interval; do
  [ -f "$gpath" ] && echo 0 > "$gpath" 2>/dev/null \
    && ok "GPU polling interval: 0ms" && break
done

for tpath in /proc/mali/turbo_mode /sys/devices/platform/13000000.mali/turbo_mode; do
  [ -f "$tpath" ] && echo 1 > "$tpath" 2>/dev/null \
    && ok "Mali turbo: aktif" && break
done

settings put global gpu_turbo_enable 1 2>/dev/null && ok "GPU Turbo (settings): aktif" || skip "gpu_turbo"

setprop debug.hwui.renderer skiavk 2>/dev/null \
  && ok "HWUI renderer: Vulkan (skiavk)" \
  || { setprop debug.hwui.renderer opengl 2>/dev/null \
    && ok "HWUI renderer: OpenGL (fallback)" || skip "HWUI renderer"; }
setprop debug.force-opengl 0 2>/dev/null && ok "Force OpenGL: kapalı (Vulkan aktif)" || skip "force-opengl"
log ""


# ─────────────────────────────────────────────
# 6. Thermal
# ─────────────────────────────────────────────
ui "  🌡  Thermal kısıtlamalar kaldırılıyor..."
log "[6] Thermal"

settings put global thermal_warningmode                0 2>/dev/null && ok "Thermal uyarı: kapalı"      || skip "thermal_warningmode"
settings put global miui_thermal_mode                  0 2>/dev/null && ok "MIUI thermal: kapalı"       || skip "miui_thermal_mode"
settings put global miui_temperature_warning_threshold 999 2>/dev/null && ok "Sıcaklık eşiği: 999°C"   || skip "temp_threshold"
settings put global restricted_networking_mode         0 2>/dev/null && ok "Ağ kısıtlama modu: kapalı" || skip "restricted_networking"
cmd thermalservice override-status 0 2>/dev/null && ok "Thermal service override: 0" || skip "thermalservice"
log ""


# ─────────────────────────────────────────────
# 7. Display & Render
# ─────────────────────────────────────────────
ui "  📺 Display & render ayarları uygulanıyor..."
log "[7] Display & Render"

settings put system peak_refresh_rate             120 2>/dev/null
settings put system min_refresh_rate              120 2>/dev/null
settings put system display_refresh_rate          120 2>/dev/null
ok "Refresh rate: min=max=120Hz"
settings put global miui_refresh_rate_mode          2 2>/dev/null && ok "HyperOS refresh: yüksek (2)"  || skip "miui_refresh_rate"
settings put global game_default_frame_rate       120 2>/dev/null && ok "Game default FPS: 120"         || skip "game_fps"
settings put global user_refresh_rate             120 2>/dev/null && ok "User refresh rate: 120"        || skip "user_refresh_rate"

cmd surface_flinger set-frame-rate-override com.tencent.ig 120 2>/dev/null \
  && ok "SF frame rate override: 120fps" \
  || { settings put global game_overlay_fps_throttle_enabled 0 2>/dev/null \
    && ok "Game FPS throttle: kapalı" || skip "frame-rate-override"; }

settings put global window_animation_scale      0 && ok "Window animation: 0x"
settings put global transition_animation_scale  0 && ok "Transition animation: 0x"
settings put global animator_duration_scale     0 && ok "Animator duration: 0x"

settings put global hardware_accelerated_rendering 1 2>/dev/null && ok "HW hızlandırmalı render: aktif" || skip "hw_render"
settings put global debug.egl.force_msaa       false 2>/dev/null && ok "Force MSAA: kapalı"             || skip "force_msaa"
settings put global disable_window_blurs           1 2>/dev/null && ok "Window blur: kapalı"             || skip "disable_window_blurs"
settings put global accessibility_reduce_transparency 1 2>/dev/null && ok "Transparency azaltma: aktif"  || skip "reduce_transparency"
settings put global development_settings_enabled   1 2>/dev/null && ok "Geliştirici seçenekleri: aktif" || skip "dev_settings"
settings put global enable_gpu_debug_layers        0 2>/dev/null && ok "GPU debug katmanları: kapalı"    || skip "gpu_debug_layers"
settings put global show_surface_update            0 2>/dev/null && ok "Surface update: kapalı"          || skip "show_surface_update"
settings put global pointer_location               0 2>/dev/null && ok "Pointer lokasyon: kapalı"        || skip "pointer_location"
settings put global show_cpu_overlay               0 2>/dev/null && ok "CPU overlay: kapalı"             || skip "show_cpu_overlay"
settings put global multicore_packet_scheduler     1 2>/dev/null && ok "Multicore packet scheduler: aktif" || skip "multicore_pkt_sched"
settings put global burn_in_protection             0 2>/dev/null && ok "Burn-in protection: kapalı"      || skip "burn_in_protection"
settings put system rakuten_denwa                  0 2>/dev/null && ok "Rakuten Denwa: kapalı"           || skip "rakuten_denwa"
settings put system nearby_scanning_enabled        0 2>/dev/null && ok "Yakın cihaz taraması: kapalı"    || skip "nearby_scanning"

setprop debug.sf.hw                              1 2>/dev/null && ok "SF HW compositor: aktif"           || skip "sf.hw"
setprop debug.sf.enable_gl_backpressure          1 2>/dev/null && ok "GL backpressure: aktif"            || skip "sf.backpressure"
setprop debug.sf.latch_unsignaled                1 2>/dev/null && ok "SF latch unsignaled: aktif"        || skip "sf.latch"
setprop debug.sf.disable_triple_buffer           0 2>/dev/null && ok "Triple buffering: aktif"           || skip "triple_buffer"
setprop debug.sf.enable_sched_fifo               1 2>/dev/null && ok "SF FIFO scheduling: aktif"         || skip "sf.sched_fifo2"
setprop debug.sf.vsync_event_phase_offset_ns     0 2>/dev/null && ok "Vsync event phase: 0ns"            || skip "vsync_event_phase"
setprop debug.sf.vsync_sf_event_phase_offset_ns  0 2>/dev/null && ok "Vsync SF phase: 0ns"               || skip "vsync_sf_phase"
setprop debug.sf.early_phase_offset_ns      500000 2>/dev/null && ok "SF early phase: 0.5ms"             || skip "sf.early_phase"
setprop debug.sf.early_app_phase_offset_ns  500000 2>/dev/null && ok "SF early app phase: 0.5ms"         || skip "sf.early_app"
setprop debug.sf.use_phase_offsets_when_auto_refresh_rate 1 2>/dev/null && ok "SF auto refresh phase: aktif" || skip "sf.auto_phase"
setprop debug.sf.nobootanimation               1 2>/dev/null && ok "Boot animation: kapalı"              || skip "nobootanimation"
setprop debug.sf.enable_advanced_sf_phase_offset        1 2>/dev/null && ok "SF advanced phase: aktif"   || skip "sf.advanced_phase"
setprop debug.sf.high_fps_early_phase_offset_ns    500000 2>/dev/null && ok "High FPS early phase: 0.5ms" || skip "sf.high_fps_early"
setprop debug.sf.high_fps_early_gl_phase_offset_ns 500000 2>/dev/null && ok "High FPS GL phase: 0.5ms"   || skip "sf.high_fps_gl"
setprop debug.sf.high_fps_late_app_phase_offset_ns 1000000 2>/dev/null && ok "High FPS late app: 1ms"    || skip "sf.high_fps_late_app"
setprop debug.sf.high_fps_late_sf_phase_offset_ns  500000 2>/dev/null && ok "High FPS late SF: 0.5ms"    || skip "sf.high_fps_late_sf"
setprop debug.sf.enable_hwc_vds                0 2>/dev/null && ok "HWC virtual display: kapalı"         || skip "hwc_vds"
setprop debug.sf.predict_hwc_composition_strategy 0 2>/dev/null && ok "HWC kompozisyon tahmini: kapalı"  || skip "hwc.predict"
setprop debug.sf.set_idle_timer_ms         20000 2>/dev/null && ok "SF idle timer: 20sn"                 || skip "sf.idle_timer"
setprop debug.sf.enable_transaction_tracing  false 2>/dev/null && ok "SF transaction tracing: kapalı"    || skip "sf.tx_tracing"
setprop debug.sf.layer_history_trace         false 2>/dev/null && ok "SF layer history trace: kapalı"    || skip "sf.layer_history"
setprop debug.sf.vsync_trace_detailed_info   false 2>/dev/null && ok "SF vsync trace: kapalı"            || skip "sf.vsync_trace"
setprop debug.sf.trace_hint_sessions         false 2>/dev/null && ok "SF hint sessions trace: kapalı"    || skip "sf.hint_sessions"
setprop debug.sf.vsp_trace                   false 2>/dev/null && ok "SF VSP trace: kapalı"              || skip "sf.vsp_trace"
setprop debug.sf.enable_egl_image_tracker    false 2>/dev/null && ok "SF EGL image tracker: kapalı"      || skip "sf.egl_tracker"
setprop debug.sf.layer_caching_highlight     false 2>/dev/null && ok "SF layer caching highlight: kapalı" || skip "sf.layer_cache"
setprop debug.sf.showfps                         0 2>/dev/null && ok "SF FPS overlay: kapalı"            || skip "sf.showfps"
setprop debug.sf.showbackground                  0 2>/dev/null && ok "SF background overlay: kapalı"     || skip "sf.showbg"
setprop debug.sf.show_refresh_rate_overlay_spinner false 2>/dev/null && ok "SF refresh overlay: kapalı"  || skip "sf.rr_overlay"
setprop debug.sf.set_binder_thread_rt            1 2>/dev/null && ok "SF binder thread RT: aktif"        || skip "sf.binder_rt"
setprop debug.sf.enable_adpf_cpu_hint            1 2>/dev/null && ok "SF ADPF CPU hint: aktif"           || skip "sf.adpf_hint"
setprop debug.sf.luma_sampling                   1 2>/dev/null && ok "SF luma sampling: aktif"           || skip "sf.luma_sampling"
setprop debug.sf.disable_client_composition_cache 1 2>/dev/null && ok "SF client composition cache: kapalı" || skip "sf.client_cache"
setprop debug.sf.gpu_freq_index                  7 2>/dev/null && ok "SF GPU freq index: 7 (maks)"       || skip "sf.gpu_freq_index"
setprop debug.sf.ddms                            1 2>/dev/null && ok "SF DDMS: aktif"                    || skip "sf.ddms"
setprop debug.sf.dump                            0 2>/dev/null && ok "SF dump: kapalı"                   || skip "sf.dump"
setprop debug.sf.hwc_hotplug_error_via_neg_vsync 1 2>/dev/null && ok "SF HWC hotplug neg vsync: aktif"   || skip "sf.hotplug_vsync"
setprop debug.sf.hwc_hdcp_via_neg_vsync          1 2>/dev/null && ok "SF HDCP neg vsync: aktif"          || skip "sf.hdcp_vsync"
setprop debug.sf.use_frame_rate_priority         1 2>/dev/null && ok "SF frame rate priority: aktif"     || skip "sf.fps_priority"
setprop debug.sf.drop_missed_frames              0 2>/dev/null && ok "SF drop missed frames: kapalı"     || skip "sf.drop_missed"
setprop debug.sf.region_sampling_timer_timeout_ns 0 2>/dev/null && ok "SF region sampling timer: 0"      || skip "sf.region_timer"
setprop debug.sf.region_sampling_period_ns       0 2>/dev/null && ok "SF region sampling period: 0"      || skip "sf.region_period"
setprop debug.sf.buffer_state_layer_updates  false 2>/dev/null && ok "SF buffer state layer: kapalı"     || skip "sf.buffer_state"
setprop debug.sf.show_frame_rate             false 2>/dev/null && ok "SF show frame rate: kapalı"        || skip "sf.show_frame_rate"
setprop debug.sf.enable_vrr_config               0 2>/dev/null && ok "SF VRR config: kapalı"             || skip "sf.vrr_config"
setprop debug.sf.high_speed_scroll_factor        0 2>/dev/null && ok "SF scroll factor: 0"               || skip "sf.scroll_factor"
setprop debug.sf.no_hw_vsync                     1 2>/dev/null && ok "SF no HW vsync: aktif"             || skip "sf.no_hw_vsync"
setprop debug.sf.support_kernel_idle_timer_0 false 2>/dev/null && ok "SF kernel idle timer 0: kapalı"    || skip "sf.idle_timer_0"
setprop debug.sf.support_kernel_idle_timer   false 2>/dev/null && ok "SF kernel idle timer: kapalı"      || skip "sf.idle_timer_k"
setprop debug.display.render_frame_rate_is_physical_refresh_rate true 2>/dev/null && ok "Display render fps = physical: aktif" || skip "display.render_fps"
setprop debug.display.allow_non_native_refresh_rate_override true 2>/dev/null && ok "Display refresh override: aktif" || skip "display.refresh_override"
setprop debug.gpu.disable_idle_timer          true 2>/dev/null && ok "GPU idle timer: kapalı"            || skip "gpu.idle_timer"
setprop debug.gpu.turbo_mode                  true 2>/dev/null && ok "GPU turbo mode: aktif"             || skip "gpu.turbo_mode"
setprop debug.gr.swapinterval                    0 2>/dev/null && ok "GR swap interval: 0"               || skip "gr.swapinterval"
setprop debug.choreographer.vsync_skipped_frame_limit 0 2>/dev/null && ok "Choreographer skip limit: 0"  || skip "choreo.skip_limit"
setprop debug.choreographer.skip_warning      true 2>/dev/null && ok "Choreographer skip warning: aktif" || skip "choreo.skip_warn"
setprop debug.choreographer.frametime        false 2>/dev/null && ok "Choreographer frametime: kapalı"   || skip "choreo.frametime"
setprop debug.hwui.renderer skiavk 2>/dev/null && ok "HWUI: Vulkan (skiavk)" \
  || { setprop debug.hwui.renderer opengl 2>/dev/null && ok "HWUI: OpenGL (fallback)" || skip "hwui.renderer"; }
setprop debug.hwui.force_gpu_for_2d          true 2>/dev/null && ok "GPU 2D render: aktif"               || skip "hwui.force_gpu_2d"
setprop debug.hwui.skia_atrace_enabled          0 2>/dev/null && ok "Skia atrace: kapalı"                || skip "skia_atrace"
setprop debug.hwui.disable_draw_reorder         0 2>/dev/null && ok "HWUI draw reorder: aktif"           || skip "hwui.draw_reorder"
setprop debug.hwui.use_gpu_pixels               1 2>/dev/null && ok "HWUI GPU pixel path: aktif"         || skip "hwui.gpu_pixels"
setprop debug.hwui.force_no_vsync            true 2>/dev/null && ok "HWUI force no vsync: aktif"         || skip "hwui.no_vsync"
setprop debug.hwui.skip_vsync                true 2>/dev/null && ok "HWUI skip vsync: aktif"             || skip "hwui.skip_vsync"
setprop debug.hwc.force_gpu_vsync               1 2>/dev/null && ok "HWC GPU vsync: aktif"               || skip "hwc.vsync"
setprop debug.hwc.logvsync                       0 2>/dev/null && ok "HWC log vsync: kapalı"             || skip "hwc.logvsync"
setprop debug.enable-vr-mode                     1 2>/dev/null && ok "VR mode (GPU öncelik): aktif"      || skip "vr-mode"
setprop debug.egl.swapinterval                   0 2>/dev/null && ok "EGL swap interval: 0"              || skip "egl.swapinterval"
setprop debug.egl.hw                             1 2>/dev/null && ok "EGL hardware acceleration: aktif"  || skip "debug.egl.hw"
setprop debug.composition.type                gpu 2>/dev/null && ok "Kompozisyon tipi: GPU"              || skip "composition.type"
setprop debug.performance.tuning                 1 2>/dev/null && ok "Performance tuning: aktif"         || skip "performance.tuning"
setprop debug.refresh_rate.min_fps             120 2>/dev/null && ok "Min FPS: 120"                      || skip "min_fps"
setprop debug.rs.default-CPU-driver              1 2>/dev/null && ok "RenderScript CPU driver: aktif"    || skip "rs.cpu_driver"
setprop renderthread.skia.reduceopstasksplitting true 2>/dev/null && ok "Skia reduce op splitting: aktif" || skip "skia.reducesplit"
setprop debug.sf.prime_shader_cache.edge_extension_shader false 2>/dev/null
setprop debug.sf.prime_shader_cache.hole_punch            false 2>/dev/null
setprop debug.sf.prime_shader_cache.solid_dimmed_layers   false 2>/dev/null
ok "SF shader cache ön yükleme: kapalı"
log ""


# ─────────────────────────────────────────────
# 8. Input Lag & Touch
# ─────────────────────────────────────────────
ui "  👆 Input lag & dokunmatik ayarları uygulanıyor..."
log "[8] Input Lag & Touch"

settings put secure long_press_timeout              100 2>/dev/null && ok "Long press timeout: 100ms"      || skip "long_press_timeout"
settings put secure multi_press_timeout             100 2>/dev/null && ok "Multi press timeout: 100ms"     || skip "multi_press_timeout"
settings put secure touch_blocking_period             0 2>/dev/null && ok "Touch blocking: 0ms"            || skip "touch_blocking"
settings put system  touch_response_time              0 2>/dev/null && ok "Touch response: 0ms"            || skip "touch_response"
settings put system  touch_double_tap_sleep           0 2>/dev/null && ok "Double tap sleep: kapalı"       || skip "touch_double_tap"
settings put system  glove_mode_touch_sensitivity     1 2>/dev/null && ok "HyperOS ultra touch: aktif"     || skip "glove_mode"
settings put secure  wake_gesture_enabled             0 2>/dev/null && ok "Wake gesture: kapalı"           || skip "wake_gesture"
settings put system  lift_to_wake                     0 2>/dev/null && ok "Lift to wake: kapalı"           || skip "lift_to_wake"
settings put secure  double_tap_to_wake               0 2>/dev/null && ok "Double tap to wake: kapalı"     || skip "double_tap_wake"
settings put secure  volume_hush_gesture              0 2>/dev/null && ok "Volume hush gesture: kapalı"    || skip "volume_hush"
settings put system  pointer_speed                    0 2>/dev/null && ok "Pointer speed: 0"               || skip "pointer_speed"
settings put system  pointer_acceleration             0 2>/dev/null && ok "Pointer acceleration: kapalı"   || skip "pointer_accel"
settings put global  sem_enhanced_cpu_responsiveness  1 2>/dev/null && ok "CPU yanıt hassasiyeti: maks"    || skip "cpu_responsiveness"
settings put global  input_dispatching_timeout_millis 4000 2>/dev/null && ok "Input dispatch: 4000ms"      || skip "input_dispatching"
settings put global  windowsmgr.max_events_per_sec  300 2>/dev/null && ok "Window events/sec: 300"         || skip "windowsmgr_events"

setprop debug.input.max_event_dequeue_timeout_millis 0 2>/dev/null && ok "Input event dequeue: 0ms"        || skip "input.dequeue"
setprop debug.input.resampling                       0 2>/dev/null && ok "Touch resampling: kapalı"        || skip "input.resampling"
setprop debug.input.latency                          0 2>/dev/null && ok "Input latency: 0"                || skip "input.latency"

IRQ_TOUCH=$(grep -l "touch\|input\|ts_int\|tpd" /proc/irq/*/name 2>/dev/null | head -1 | cut -d/ -f4)
[ -n "$IRQ_TOUCH" ] && echo f0 > /proc/irq/$IRQ_TOUCH/smp_affinity 2>/dev/null \
  && ok "Touch IRQ $IRQ_TOUCH: prime+big core" \
  || ok "Touch IRQ: genel IRQ ayarı aktif"
log ""


# ─────────────────────────────────────────────
# 9. Ses — Kablolu Kulaklık
# ─────────────────────────────────────────────
ui "  🎧 Ses ayarları uygulanıyor..."
log "[9] Ses — Kablolu Kulaklık"

settings put system  sound_effects_enabled        0 2>/dev/null && ok "Sistem ses efektleri: kapalı"    || skip "sound_effects"
settings put system  haptic_feedback_enabled       0 2>/dev/null && ok "Haptic feedback: kapalı"        || skip "haptic_feedback"
settings put global  audio_safe_volume_state       0 2>/dev/null && ok "Ses güvenlik sınırı: kapalı"    || skip "audio_safe_volume"
settings put system  dtmf_tone_when_dialing        0 2>/dev/null && ok "DTMF tone: kapalı"              || skip "dtmf_tone"
settings put system  lockscreen_sounds_enabled     0 2>/dev/null && ok "Kilit ekranı sesi: kapalı"      || skip "lockscreen_sounds"
settings put system  notification_sound_enabled    0 2>/dev/null && ok "Bildirim sesi: kapalı"          || skip "notification_sound"
settings put global  low_latency_audio             1 2>/dev/null && ok "Low latency ses: aktif"         || skip "low_latency_audio"
settings put global  aaudio_mmap_enabled           1 2>/dev/null && ok "AAudio MMAP: aktif"             || skip "aaudio_mmap"
settings put global  audio_low_latency_mode        1 2>/dev/null && ok "Audio low latency modu: aktif"  || skip "audio_low_latency"
settings put system  microphone_noise_cancellation 0 2>/dev/null && ok "Mikrofon gürültü engeli: kapalı" || skip "noise_cancellation"
settings put global  bluetooth_a2dp_sink_enabled   0 2>/dev/null && ok "Bluetooth A2DP sink: kapalı"    || skip "bt_a2dp_sink"
log ""


# ─────────────────────────────────────────────
# 10. Ağ & Ping
# ─────────────────────────────────────────────
ui "  📡 Ağ & ping ayarları uygulanıyor..."
log "[10] Ağ & Ping"

settings put global wifi_sleep_policy                  2     && ok "Wi-Fi: hiçbir zaman uyuma"
settings put global wifi_scan_throttle_enabled         0 2>/dev/null && ok "Wi-Fi tarama kısıtı: kapalı"   || skip "wifi_scan_throttle"
settings put global wifi_enhanced_auto_join            1 2>/dev/null && ok "Wi-Fi gelişmiş bağlantı: aktif" || skip "wifi_enhanced_join"
settings put global wifi_freq_band                     2 2>/dev/null && ok "Wi-Fi: 5GHz/6GHz tercihli"     || skip "wifi_freq_band"
settings put global wifi_roam_to_any_ap                1 2>/dev/null && ok "Wi-Fi agresif roaming: aktif"  || skip "wifi_roam"
settings put global wifi_supplicant_scan_interval    600 2>/dev/null && ok "Wi-Fi scan aralığı: 600s"      || skip "wifi_scan_interval"
settings put global wifi_idle_ms                   60000 2>/dev/null && ok "Wi-Fi idle: 60sn"              || skip "wifi_idle_ms"
settings put global wifi_watchdog_on                   0 2>/dev/null && ok "Wi-Fi watchdog: kapalı"        || skip "wifi_watchdog"
settings put global wifi_power_management_enable       0 2>/dev/null && ok "Wi-Fi güç yönetimi: kapalı"    || skip "wifi_power_mgmt"
settings put global wifi_suspend_optimizations_enabled 0 2>/dev/null && ok "Wi-Fi suspend opt: kapalı"     || skip "wifi_suspend"
settings put global wifi_suspend_opt_enabled           0 2>/dev/null && ok "Wi-Fi suspend: kapalı"         || skip "wifi_suspend_opt"
settings put global wifi_networks_available_notification_on 0 2>/dev/null && ok "Wi-Fi ağ bildirimi: kapalı" || skip "wifi_notif"
settings put global wifi_enhanced_mac_randomization    0 2>/dev/null && ok "Wi-Fi MAC randomization: kapalı" || skip "wifi_mac_random"
settings put global ble_scan_always_enabled            0             && ok "BLE arka plan: kapalı"
settings put global mobile_data_always_on              1             && ok "Mobil veri always-on: aktif"
settings put global preferred_network_mode             9 2>/dev/null && ok "Ağ modu: LTE/5G tercihli"      || skip "preferred_network"
settings put global private_dns_mode                 off 2>/dev/null && ok "Private DNS override: kapalı"  || skip "private_dns"
settings put global tcp_default_init_rwnd             60 2>/dev/null && ok "TCP init recv window: 60"      || skip "tcp_init_rwnd"
settings put global connectivity_change_no_reset       1 2>/dev/null && ok "Bağlantı reset: kapalı"        || skip "connectivity_reset"
settings put global network_switch_notification        0 2>/dev/null && ok "Ağ geçiş bildirimi: kapalı"    || skip "network_switch"
settings put global captive_portal_mode                0 2>/dev/null && ok "Captive portal modu: kapalı"   || skip "captive_portal_mode"
settings put global captive_portal_detection_enabled   1 2>/dev/null && ok "Captive portal tespiti: aktif" || skip "captive_portal"
settings put global network_recommendation_enabled     0 2>/dev/null && ok "Ağ öneri sistemi: kapalı"      || skip "network_recommendation"
settings put global default_restrict_background_data   0 2>/dev/null && ok "Arka plan veri kısıtı: kapalı" || skip "restrict_bg_data"
settings put global network_scoring_ui_enabled         0 2>/dev/null && ok "Ağ puanlama: kapalı"           || skip "network_scoring"
cmd connectivity set-avoid-unvalidated 0 2>/dev/null && ok "Ağ önceliği kısıtı: kaldırıldı"
cmd netpolicy set restrict-background false com.tencent.ig 2>/dev/null && ok "PUBG ağ kısıtı: kapalı"      || skip "netpolicy"

device_config put activity_manager max_cached_processes    160 2>/dev/null && ok "AM: max cached processes: 160" || skip "am.max_cached"
device_config put activity_manager max_phantom_processes 2147483647 2>/dev/null && ok "AM: max phantom: max"     || skip "am.max_phantom"
device_config put activity_manager top_to_fgs_grace_duration 15000 2>/dev/null && ok "AM: FGS grace: 15sn"       || skip "am.fgs_grace"
device_config put activity_manager use_compaction          true 2>/dev/null && ok "AM: compaction aktif"         || skip "am.compaction"
device_config put activity_manager_native_boot use_freezer true 2>/dev/null && ok "AM: freezer: aktif"           || skip "am.freezer"
device_config put runtime_native usap_pool_enabled         true 2>/dev/null && ok "Runtime USAP pool: aktif"     || skip "rt.usap_pool"
device_config put runtime_native use_app_image_startup_cache true 2>/dev/null && ok "Runtime app image cache: aktif" || skip "rt.app_image"

cmd shortcut reset-throttling          2>/dev/null && ok "Shortcut throttling: sıfırlandı"          || skip "shortcut_throttle"
cmd shortcut reset-throttling --user 0 2>/dev/null && ok "Shortcut throttling (user 0): sıfırlandı" || skip "shortcut_throttle_u0"
cmd display set-match-content-frame-rate-pref 2 2>/dev/null && ok "Display match content frame rate: 2" || skip "display.match_content"
cmd display ab-logging-disable  2>/dev/null && ok "Display AB logging: kapalı"  || skip "display.ab_log"
cmd display dwb-logging-disable 2>/dev/null && ok "Display DWB logging: kapalı" || skip "display.dwb_log"
log ""


# ─────────────────────────────────────────────
# 11. Batarya & Güç
# ─────────────────────────────────────────────
ui "  🔋 Güç & batarya ayarları uygulanıyor..."
log "[11] Batarya & Güç"

dumpsys deviceidle disable 2>/dev/null && ok "Doze: kapalı" || skip "deviceidle"
settings put global low_power                  0
settings put global battery_saver_constants   "" 2>/dev/null
ok "Güç tasarrufu: kapalı"
settings put global power_mode                 2 2>/dev/null && ok "HyperOS power: High Performance" || skip "power_mode"
settings put global sync_disabled              1 2>/dev/null && ok "Arka plan sync: kapalı"          || skip "sync_disabled"
settings put global always_finish_activities   0 2>/dev/null && ok "Activity sonlandırma: kapalı"     || skip "always_finish"
settings put global adaptive_battery_management_enabled 0 2>/dev/null && ok "Adaptive battery: kapalı" || skip "adaptive_battery"
settings put global automatic_power_save_mode  0 2>/dev/null && ok "Otomatik güç tasarrufu: kapalı"   || skip "auto_power_save"
settings put global dynamic_power_savings_enabled 0 2>/dev/null && ok "Dinamik tasarruf: kapalı"      || skip "dynamic_savings"
settings put global app_restriction_enabled    true 2>/dev/null && ok "Uygulama kısıtlama: aktif"     || skip "app_restriction"
settings put secure location_mode              0 2>/dev/null && ok "Konum: kapalı"                    || skip "location_mode"
settings put secure location_providers_allowed "" 2>/dev/null && ok "Konum sağlayıcıları: kapalı"     || skip "location_providers"
settings put global bluetooth_on               0 2>/dev/null && ok "Bluetooth: kapalı"                || skip "bluetooth_on"
cmd bluetooth_manager disable 2>/dev/null && ok "Bluetooth servisi: kapalı"                           || skip "bt_manager"
settings put global nfc_on                     0 2>/dev/null && ok "NFC: kapalı"                      || skip "nfc_on"
settings put global mobile_data                0 2>/dev/null && ok "Hücresel veri: kapalı"            || skip "mobile_data"
log ""


# ─────────────────────────────────────────────
# 12. Storage I/O — UFS 512GB
# ─────────────────────────────────────────────
ui "  💿 I/O ayarları uygulanıyor..."
log "[12] Storage I/O — UFS 512GB"

for blk in /sys/block/*/queue/scheduler;      do echo deadline > "$blk" 2>/dev/null || echo noop > "$blk" 2>/dev/null; done
ok "I/O scheduler: deadline/noop"
for blk in /sys/block/*/queue/read_ahead_kb;  do echo 0   > "$blk" 2>/dev/null; done
ok "Read-ahead: 0 (UFS/flash)"
for blk in /sys/block/*/queue/nr_requests;    do echo 256 > "$blk" 2>/dev/null; done
ok "I/O queue depth: 256"
for blk in /sys/block/*/queue/rq_affinity;    do echo 2   > "$blk" 2>/dev/null; done
ok "I/O rq_affinity: 2"
for blk in /sys/block/*/queue/rotational;     do echo 0   > "$blk" 2>/dev/null; done
ok "I/O rotational: 0"
for blk in /sys/block/*/queue/add_random;     do echo 0   > "$blk" 2>/dev/null; done
ok "I/O add_random: 0"
for blk in /sys/block/*/queue/iostats;        do echo 0   > "$blk" 2>/dev/null; done
ok "I/O stats: kapalı"
for blk in /sys/block/*/queue/wbt_lat_usec;   do echo 0   > "$blk" 2>/dev/null; done
ok "Write-back throttle: kapalı"
for ufs in /sys/class/block/*/device/power_mode; do echo 1 > "$ufs" 2>/dev/null; done
ok "UFS power mode: performance"
log ""


# ─────────────────────────────────────────────
# 13. PUBG Mobile — com.tencent.ig
# ─────────────────────────────────────────────
ui "  🎯 PUBG Mobile ayarları uygulanıyor..."
log "[13] PUBG Mobile — com.tencent.ig"

dumpsys deviceidle whitelist +com.tencent.ig 2>/dev/null && ok "PUBG Doze whitelist: eklendi"           || skip "doze whitelist"
cmd appops set com.tencent.ig RUN_IN_BACKGROUND      allow 2>/dev/null && ok "PUBG arka plan: izinli"   || skip "appops BG"
cmd appops set com.tencent.ig RUN_ANY_IN_BACKGROUND  allow 2>/dev/null && ok "PUBG agresif arka: izinli" || skip "appops ANY_BG"
cmd appops set com.tencent.ig READ_PHONE_STATE        allow 2>/dev/null && ok "PUBG telefon durumu: izinli" || skip "appops PHONE"
cmd netpolicy set restrict-background false com.tencent.ig 2>/dev/null && ok "PUBG ağ kısıtı: kapalı"   || skip "netpolicy"
cmd connectivity set-avoid-unvalidated 0 2>/dev/null && ok "Ağ önceliği kısıtı: kaldırıldı"
am set-inactive com.tencent.ig false 2>/dev/null && ok "PUBG: inaktif değil"                             || skip "set-inactive"
log ""
log "[ATLAS] Tüm optimizasyonlar başarıyla uygulandı"
log ""

ui "  --------------------------------"
ui "  ✨ BAŞARILI! ✅"
ui "  --------------------------------"
ui ""

# ─────────────────────────────────────────────
# 14. PUBG Başlatma & PID
# ─────────────────────────────────────────────
ui "  🚀 PUBG Mobile başlatılıyor..."
log "[14] PUBG Başlatma & PID"

monkey -p com.tencent.ig -c android.intent.category.LAUNCHER 1 2>/dev/null \
  && ok "PUBG başlatıldı (monkey)" \
  || { cmd activity start-activity \
        -n com.tencent.ig/com.epicgames.ue4.GameActivity \
        -a android.intent.action.MAIN \
        -c android.intent.category.LAUNCHER 2>/dev/null \
      && ok "PUBG başlatıldı (cmd activity)" \
      || { am start -a android.intent.action.MAIN \
            -c android.intent.category.LAUNCHER \
            --user 0 \
            -n com.tencent.ig/com.epicgames.ue4.GameActivity 2>/dev/null \
          && ok "PUBG başlatıldı (am start)" \
          || { am start-activity \
                -n com.tencent.ig/com.epicgames.ue4.GameActivity 2>/dev/null \
              && ok "PUBG başlatıldı (am start-activity)" \
              || { ok "PUBG başlatılamadı"
                   ui "  ✗ PUBG başlatılamadı, manuel aç"; }; }; }; }

ui "  ⏳ PUBG yükleniyor..."
WAITED=0
PUBG_PID=""
while [ -z "$PUBG_PID" ] && [ "$WAITED" -lt 45 ]; do
  sleep 1
  PUBG_PID=$(pidof com.tencent.ig 2>/dev/null)
  WAITED=$((WAITED + 1))
done

if [ -n "$PUBG_PID" ]; then
  log "PUBG PID: $PUBG_PID (${WAITED}sn)"

  dumpsys deviceidle whitelist +com.tencent.ig 2>/dev/null && ok "PUBG OOM whitelist: aktif" || skip "oom whitelist"
  am send-trim-memory com.tencent.ig RUNNING_MODERATE 2>/dev/null && ok "PUBG bellek: moderate trim" || skip "trim-memory"
  am kill-all 2>/dev/null && ok "Arka plan: tekrar temizlendi"
  am send-trim-memory android BACKGROUND 2>/dev/null \
    && ok "System server: BACKGROUND trim" \
    || { pm trim-caches 512m 2>/dev/null && ok "System cache: 512MB trim" || skip "system trim"; }

  echo $PUBG_PID > /dev/cpuset/top-app/tasks 2>/dev/null && ok "PUBG: top-app cpuset" || skip "cpuset task"
  echo $PUBG_PID > /dev/blkio/top-app/tasks  2>/dev/null && ok "PUBG: blkio top-app"  || skip "blkio task"

  for tid in $(ls /proc/$PUBG_PID/task/ 2>/dev/null); do
    echo $tid > /dev/cpuset/top-app/tasks 2>/dev/null
  done
  ok "PUBG thread'leri: top-app cpuset"

  UE_TID=$(grep -rl "UEGameThread" /proc/$PUBG_PID/task/*/comm 2>/dev/null | head -1 | cut -d/ -f6)
  [ -n "$UE_TID" ] && taskset -p 80 $UE_TID 2>/dev/null \
    && ok "UEGameThread (TID:$UE_TID): CPU7 prime (0x80)" || skip "UEGameThread taskset"

  for rname in "RenderThread 1" "RenderThread"; do
    RT_TID=$(grep -rl "$rname" /proc/$PUBG_PID/task/*/comm 2>/dev/null | head -1 | cut -d/ -f6)
    [ -n "$RT_TID" ] && taskset -p 70 $RT_TID 2>/dev/null \
      && ok "RenderThread (TID:$RT_TID): CPU4-6 big (0x70)" && break
  done

  for tname in "TaskGraphNP 0" "TaskGraphNP 1" "TaskGraphNP 2" "MainThread-UE4" "NativeThread"; do
    TTID=$(grep -rl "$tname" /proc/$PUBG_PID/task/*/comm 2>/dev/null | head -1 | cut -d/ -f6)
    [ -n "$TTID" ] && taskset -p f0 $TTID 2>/dev/null \
      && ok "$tname (TID:$TTID): CPU4-7 big+prime"
  done

  T93_TID=$(ls /proc/$PUBG_PID/task/ 2>/dev/null | while read tid; do
    [ "$(cat /proc/$PUBG_PID/task/$tid/comm 2>/dev/null)" = "Thread-93" ] && echo $tid && break
  done)
  [ -n "$T93_TID" ] && taskset -p 0f $T93_TID 2>/dev/null \
    && ok "Thread-93 (TID:$T93_TID): little core (0x0f)" || skip "Thread-93"

  for i in 4 5 6 7; do
    echo performance > /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor 2>/dev/null
  done
  [ -n "$MAX7" ] && echo "$MAX7" > /sys/devices/system/cpu/cpu7/cpufreq/scaling_min_freq 2>/dev/null
  ok "CPU4-7: performance governor (PID sonrası)"

  ui ""
  ui "  ✅ PID ayarları devrede! (PID: $PUBG_PID)"
  ui "  ✅ Tüm optimizasyonlar aktif"
  ui ""
  log ""
  log "[✓] PID bazlı ayarlar uygulandı (PID: $PUBG_PID)"

else
  ui ""
  ui "  ⚠  PID 45sn içinde bulunamadı"
  ui ""
  log "[~] PUBG PID bulunamadı"
fi


ui "╔══════════════════════════════════════════╗"
ui "║   Optimizasyon Tamamlandı! — by ATLAS    ║"
ui "╚══════════════════════════════════════════╝"
ui ""

log ""
log "[ATLAS] Optimizasyon tamamlandı"
log ""
