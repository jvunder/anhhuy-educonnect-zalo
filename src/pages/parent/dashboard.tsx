import React from 'react'
import { Page, Box, Text, Button } from 'zmp-ui'
import { useNavigate } from 'react-router-dom'

const ParentDashboard: React.FC = () => {
  const navigate = useNavigate()

  const features = [
    {
      icon: '📚',
      title: 'Khóa học của tôi',
      description: 'Xem các khóa học đã đăng ký',
      action: 'Xem khóa học'
    },
    {
      icon: '📊',
      title: 'Tiến độ học tập',
      description: 'Theo dõi quá trình học',
      action: 'Xem tiến độ'
    },
    {
      icon: '🤖',
      title: 'AI Tư vấn',
      description: 'Nhận tư vấn từ AI',
      action: 'Bắt đầu chat'
    },
    {
      icon: '📝',
      title: 'Ghi chú',
      description: 'Lưu trữ ghi chú học tập',
      action: 'Xem ghi chú'
    }
  ]

  return (
    <Page className="bg-background">
      <Box p={4} className="min-h-screen">
        {/* Header */}
        <div className="flex items-center justify-between mb-6">
          <div>
            <Text size="xLarge" bold>
              Khu vực Phụ huynh
            </Text>
            <Text className="text-text-secondary">
              Chào mừng bạn trở lại! 👋
            </Text>
          </div>
          <Button
            variant="tertiary"
            size="small"
            onClick={() => navigate('/')}
          >
            ← Trang chủ
          </Button>
        </div>

        {/* Quick Stats */}
        <div className="grid grid-cols-2 gap-4 mb-6">
          <div className="bg-blue-50 rounded-xl p-4 text-center">
            <Text size="xLarge" bold className="text-blue-600">3</Text>
            <Text size="small" className="text-blue-600">Khóa học</Text>
          </div>
          <div className="bg-green-50 rounded-xl p-4 text-center">
            <Text size="xLarge" bold className="text-green-600">75%</Text>
            <Text size="small" className="text-green-600">Hoàn thành</Text>
          </div>
        </div>

        {/* Features */}
        <div className="space-y-4">
          {features.map((feature, index) => (
            <div key={index} className="course-card">
              <div className="flex items-center space-x-4">
                <div className="text-3xl">{feature.icon}</div>
                <div className="flex-1">
                  <Text bold className="text-lg">{feature.title}</Text>
                  <Text size="small" className="text-text-secondary">
                    {feature.description}
                  </Text>
                </div>
                <Button variant="tertiary" size="small">
                  {feature.action}
                </Button>
              </div>
            </div>
          ))}
        </div>

        {/* Coming Soon */}
        <div className="mt-8 text-center p-6 bg-slate-50 rounded-xl">
          <Text bold className="text-primary mb-2">
            🚀 Tính năng sắp có
          </Text>
          <Text size="small" className="text-text-secondary">
            Video học tập, Bài tập tương tác, Cộng đồng phụ huynh
          </Text>
        </div>
      </Box>
    </Page>
  )
}

export default ParentDashboard