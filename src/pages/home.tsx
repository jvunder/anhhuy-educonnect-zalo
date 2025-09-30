import React from 'react'
import { Page, Box, Text, Button } from 'zmp-ui'
import { useNavigate } from 'react-router-dom'

const HomePage: React.FC = () => {
  const navigate = useNavigate()

  const roles = [
    {
      id: 'parent',
      title: 'Phụ huynh',
      description: 'Học kỹ năng nuôi dạy con',
      icon: '👨‍👩‍👧‍👦',
      color: 'bg-blue-50 border-blue-200 hover:border-blue-400',
      path: '/parent'
    },
    {
      id: 'teacher', 
      title: 'Giảng viên',
      description: 'Tạo và quản lý khóa học',
      icon: '👨‍🏫',
      color: 'bg-green-50 border-green-200 hover:border-green-400',
      path: '/teacher'
    },
    {
      id: 'admin',
      title: 'Trung tâm',
      description: 'Quản lý hệ thống',
      icon: '🏢',
      color: 'bg-purple-50 border-purple-200 hover:border-purple-400',
      path: '/admin'
    }
  ]

  return (
    <Page className="bg-background">
      <Box p={4} className="min-h-screen">
        {/* Header */}
        <div className="text-center mb-8">
          <div className="text-6xl mb-4">🎓</div>
          <Text size="xLarge" bold className="text-primary mb-2">
            AnhHuyEduConnect
          </Text>
          <Text className="text-text-secondary">
            Nền tảng học tập kỹ năng nuôi dạy con
          </Text>
        </div>

        {/* Role Selection */}
        <div className="space-y-4 mb-8">
          <Text size="large" bold className="text-center mb-4">
            Chọn vai trò của bạn
          </Text>
          
          {roles.map((role) => (
            <div
              key={role.id}
              className={`role-card ${role.color} cursor-pointer`}
              onClick={() => navigate(role.path)}
            >
              <div className="flex items-center space-x-4">
                <div className="text-3xl">{role.icon}</div>
                <div className="flex-1">
                  <Text bold className="text-lg">{role.title}</Text>
                  <Text size="small" className="text-text-secondary">
                    {role.description}
                  </Text>
                </div>
                <div className="text-primary">
                  →
                </div>
              </div>
            </div>
          ))}
        </div>

        {/* Features Preview */}
        <div className="bg-slate-50 rounded-xl p-6">
          <Text bold className="text-center mb-4">
            🚀 Tính năng nổi bật
          </Text>
          
          <div className="grid grid-cols-2 gap-3">
            <div className="text-center p-3">
              <div className="text-2xl mb-2">🤖</div>
              <Text size="small">AI Tư vấn</Text>
            </div>
            <div className="text-center p-3">
              <div className="text-2xl mb-2">💬</div>
              <Text size="small">Chat 24/7</Text>
            </div>
            <div className="text-center p-3">
              <div className="text-2xl mb-2">📚</div>
              <Text size="small">Khóa học</Text>
            </div>
            <div className="text-center p-3">
              <div className="text-2xl mb-2">📊</div>
              <Text size="small">Báo cáo</Text>
            </div>
          </div>
        </div>

        {/* Footer */}
        <div className="text-center mt-8">
          <Text size="xSmall" className="text-text-subtle">
            v1.0.0 - Zalo Mini App
          </Text>
        </div>
      </Box>
    </Page>
  )
}

export default HomePage