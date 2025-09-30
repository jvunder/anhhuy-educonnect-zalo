import React from 'react'
import { createRoot } from 'react-dom/client'
import { ErrorBoundary } from 'react-error-boundary'
import App from './app'
import './app.scss'

function ErrorFallback({ error }: { error: Error }) {
  return (
    <div className="min-h-screen flex items-center justify-center p-4">
      <div className="text-center">
        <h2 className="text-xl font-bold mb-2">Oops! Something went wrong</h2>
        <p className="text-text-secondary mb-4">{error.message}</p>
        <button
          onClick={() => window.location.reload()}
          className="bg-primary text-primary-foreground px-4 py-2 rounded"
        >
          Refresh Page
        </button>
      </div>
    </div>
  )
}

// Fix: Mount vào 'app' thay vì 'root' cho Zalo Mini App
const container = document.getElementById('app') || document.getElementById('root')
if (!container) throw new Error('App container not found')

const root = createRoot(container)

root.render(
  <React.StrictMode>
    <ErrorBoundary FallbackComponent={ErrorFallback}>
      <App />
    </ErrorBoundary>
  </React.StrictMode>
)