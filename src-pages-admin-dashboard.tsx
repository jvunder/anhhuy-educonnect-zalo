import React from 'react'
import { Page, Box, Text, Button } from 'zmp-ui'
import { useNavigate } from 'react-router-dom'

const AdminDashboard: React.FC = () => {
  const navigate = useNavigate()

  const adminFeatures = [
    {
      icon: '👥',
      title: 'Quản lý người dùng',
      description: 'Phụ huynh, giảng viên, admin',
      action: 'Quản lý',
      stats: '2,456 người',
      color: 'bg-blue-50'
    },
    {
      icon: '📚',
      title: 'Quản lý khóa học',
      description: 'Duyệt và quản lý nội dung',
      action: 'Xem danh sách',
      stats: '89 khóa học',
      color: 'bg-green-50'
    },
    {
      icon: '📊',
      title: 'Báo cáo & Thống kê',
      description: 'Phân tích dữ liệu hệ thống',
      action: 'Xem báo cáo',
      stats: 'Cập nhật',
      color: 'bg-purple-50'
    },
    {
      icon: '⚙️',
      title: 'Cài đặt hệ thống',
      description: 'Cấu hình và bảo mật',
      action: 'Cài đặt',
      stats: 'Mới nhất',
      color: 'bg-orange-50'
    }
  ]

  return (
    <Page className="bg-background">
      <Box p={4} className="min-h-screen">
        {/* Header */}
        <div className="flex items-center justify-between mb-6">
          <div>
            <Text size="xLarge" bold>
              Khu vực Quản trị
            </Text>
            <Text className="text-text-secondary">
              Điều hành toàn bộ hệ thống 🏢
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

        {/* System Status */}
        <div className="bg-green-50 border border-green-200 rounded-xl p-4 mb-6">
          <div className="flex items-center space-x-3">
            <div className="w-3 h-3 bg-green-500 rounded-full"></div>
            <div>
              <Text bold className="text-green-700">Hệ thống hoạt động bình thường</Text>
              <Text size="small" className="text-green-600">Cập nhật lần cuối: 24/09/2025 11:45</Text>
            </div>
          </div>
        </div>

        {/* Quick Stats Dashboard */}
        <div className="grid grid-cols-2 gap-4 mb-6">
          <div className="bg-white border border-border rounded-xl p-4">
            <div className="flex items-center justify-between mb-2">
              <Text size="small" className="text-text-secondary">Người dùng mới hôm nay</Text>
              <div className="text-lg">👤</div>
            </div>
            <Text size="xLarge" bold className="text-primary">+47</Text>
            <Text size="xSmall" className="text-green-600">↑ 12% so với hôm qua</Text>
          </div>

          <div className="bg-white border border-border rounded-xl p-4">
            <div className="flex items-center justify-between mb-2">
              <Text size="small" className="text-text-secondary">Khóa học hoàn thành</Text>
              <div className="text-lg">🎓</div>
            </div>
            <Text size="xLarge" bold className="text-primary">892</Text>
            <Text size="xSmall" className="text-green-600">↑ 8% tuần này</Text>
          </div>
        </div>

        {/* Admin Features */}
        <div className="space-y-4 mb-6">
          {adminFeatures.map((feature, index) => (
            <div key={index} className={`${feature.color} rounded-xl p-4 course-card`}>
              <div className="flex items-center space-x-4">
                <div className="text-3xl">{feature.icon}</div>
                <div className="flex-1">
                  <div className="flex items-center justify-between mb-1">
                    <Text bold className="text-lg">{feature.title}</Text>
                    <Text size="xSmall" className="text-text-subtle">
                      {feature.stats}
                    </Text>
                  </div>
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

        {/* Emergency Actions */}
        <div className="bg-red-50 border border-red-200 rounded-xl p-4">
          <Text bold className="text-red-700 mb-3">🚨 Thao tác khẩn cấp</Text>
          <div className="grid grid-cols-2 gap-3">
            <Button variant="destructive" size="small">
              Bảo trì hệ thống
            </Button>
            <Button variant="secondary" size="small">
              Sao lưu dữ liệu
            </Button>
          </div>
        </div>
      </Box>
    </Page>
  )
}

export default AdminDashboard