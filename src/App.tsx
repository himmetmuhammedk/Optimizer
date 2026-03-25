/**
 * @license
 * SPDX-License-Identifier: Apache-2.0
 */

import React, { useState, useEffect } from 'react';
import { LogViewer } from './components/LogViewer';

export default function App() {
  const [logs, setLogs] = useState<{ id: number; message: string; timestamp: string }[]>([]);

  useEffect(() => {
    const interval = setInterval(() => {
      const newLog = {
        id: Date.now(),
        message: `Log entry ${logs.length + 1}`,
        timestamp: new Date().toLocaleTimeString(),
      };
      setLogs((prev) => [...prev, newLog]);
    }, 1000);

    return () => clearInterval(interval);
  }, [logs.length]);

  return (
    <div className="p-8">
      <h1 className="text-2xl font-bold mb-4">Log Viewer</h1>
      <LogViewer logs={logs} />
    </div>
  );
}
