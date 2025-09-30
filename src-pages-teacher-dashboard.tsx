import React from 'react'
import { Page, Box, Text, Button } from 'zmp-ui'
import { useNavigate } from 'react-router-dom'

const TeacherDashboard: React.FC = () => {
  const navigate = useNavigate()

  const features = [
    {
      icon: '📚',
      title: 'Quản lý khóa học',
      description: 'Tạo và chỉnh sửa khóa học',
      action: 'Quản lý',
      color: 'bg-blue-50'
    },
    {
      icon: '👥',
      title: 'Học viên',
      description: 'Xem danh sách học viên',
      action: 'Xem danh sách',
      color: 'bg-green-50'
    },
    {
      icon: '📊',
      title: 'Thống kê',
      description: 'Báo cáo tiến độ học tập',
      action: 'Xem báo cáo',
      color: 'bg-purple-50'
    },
    {
      icon: '💬',
      title: 'Tin nhắn',
      description: 'Tương tác với học viên',
      action: 'Xem tin nhắn',
      color: 'bg-yellow-50'
    }
  ]

  return (
    <Page className="bg-background">
      <Box p={4} className="min-h-screen">
        {/* Header */}
        <div className="flex items-center justify-between mb-6">
          <div>
            <Text size="xLarge" bold>
              Khu vực Giảng viên
            </Text>
            <Text className="text-text-secondary">
              Quản lý khóa học và học viên 👨‍🏫
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
        <div className="grid grid-cols-3 gap-3 mb-6">
          <div className="bg-blue-50 rounded-xl p-3 text-center">
            <Text size="large" bold className="text-blue-600">5</Text>
            <Text size="xSmall" className="text-blue-600">Khóa học</Text>
          </div>
          <div className="bg-green-50 rounded-xl p-3 text-center">
            <Text size="large" bold className="text-green-600">128</Text>
            <Text size="xSmall" className="text-green-600">Học viên</Text>
          </div>
          <div className="bg-purple-50 rounded-xl p-3 text-center">
            <Text size="large" bold className="text-purple-600">4.8</Text>
            <Text size="xSmall" className="text-purple-600">Đánh giá</Text>
          </div>
        </div>

        {/* Features */}
        <div className="space-y-4 mb-6">
          {features.map((feature, index) => (
            <div key={index} className={`${feature.color} rounded-xl p-4 course-card`}>
              <div className="flex items-center space-x-4">
                <div className="text-3xl">{feature.icon}</div>
                <div className="flex-1">
                  <Text bold className="text-lg">{feature.title}</Text>
                  <Text size="small" className="text-text-secondary">
                    {feature.description}
                  </Text>
                </div>
                <Button variant="primary" size="small">
                  {feature.action}
                </Button>
              </div>
            </div>
          ))}
        </div>

        {/* Quick Actions */}
        <div className="bg-slate-50 rounded-xl p-4">
          <Text bold className="mb-4">⚡ Thao tác nhanh</Text>
          <div className="grid grid-cols-2 gap-3">
            <Button variant="secondary" className="h-12">
              + Tạo khóa học mới
            </Button>
            <Button variant="secondary" className="h-12">
              📝 Tạo bài giảng
            </Button>
          </div>
        </div>
      </Box>
    </Page>
  )
}

export default TeacherDashboard