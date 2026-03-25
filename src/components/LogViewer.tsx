import React, { useEffect, useRef } from 'react';

interface LogEntry {
  id: number;
  message: string;
  timestamp: string;
}

interface LogViewerProps {
  logs: LogEntry[];
}

export const LogViewer: React.FC<LogViewerProps> = ({ logs }) => {
  const bottomRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, [logs]);

  return (
    <div className="h-96 overflow-y-auto border border-gray-300 rounded p-4 bg-gray-900 text-green-400 font-mono text-sm">
      {logs.map((log) => (
        <div key={log.id} className="mb-1">
          <span className="text-gray-500">[{log.timestamp}]</span> {log.message}
        </div>
      ))}
      <div ref={bottomRef} />
    </div>
  );
};
