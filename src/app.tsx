import React from 'react'
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { App as ZMPApp } from 'zmp-ui'

// Pages
import HomePage from './pages/home'
import LoginPage from './pages/login'
import ParentDashboard from './pages/parent/dashboard'
import TeacherDashboard from './pages/teacher/dashboard'
import AdminDashboard from './pages/admin/dashboard'

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 1000 * 60 * 5, // 5 minutes
      retry: 1,
    },
  },
})

const App: React.FC = () => {
  return (
    <QueryClientProvider client={queryClient}>
      <ZMPApp>
        <Router>
          <div className="app">
            <Routes>
              <Route path="/" element={<HomePage />} />
              <Route path="/login" element={<LoginPage />} />
              <Route path="/parent/*" element={<ParentDashboard />} />
              <Route path="/teacher/*" element={<TeacherDashboard />} />
              <Route path="/admin/*" element={<AdminDashboard />} />
              <Route path="*" element={<HomePage />} />
            </Routes>
          </div>
        </Router>
      </ZMPApp>
    </QueryClientProvider>
  )
}

export default App