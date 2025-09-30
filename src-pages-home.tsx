import React from 'react';
import { Page, Box, Text, Button } from 'zmp-ui';

const HomePage = () => {
  const features = [
    { icon: '🎓', title: 'Học tập hiệu quả', desc: 'Phương pháp khoa học' },
    { icon: '🤖', title: 'AI hỗ trợ', desc: 'Tư vấn thông minh 24/7' },
    { icon: '📱', title: 'Mobile first', desc: 'Học mọi lúc mọi nơi' },
    { icon: '👨‍👩‍👧‍👦', title: 'Cộng đồng', desc: 'Kết nối phụ huynh' }
  ];

  const stats = [
    { number: '12,500+', label: 'Học viên' },
    { number: '150+', label: 'Khóa học' },
    { number: '98%', label: 'Hài lòng' },
    { number: '50k+', label: 'Giờ học' }
  ];

  return (
    <Page className="page-container">
      {/* Modern Header */}
      <div className="modern-header">
        <Text className="title">AnhHuy EduConnect</Text>
        <Text className="subtitle">Nền tảng giáo dục phụ huynh hàng đầu</Text>
      </div>

      {/* Stats Section */}
      <div className="stats-section">
        <div className="stats-grid">
          {stats.map((stat, index) => (
            <div key={index} className="stat-item">
              <Text className="stat-number">{stat.number}</Text>
              <Text className="stat-label">{stat.label}</Text>
            </div>
          ))}
        </div>
      </div>

      {/* Features Grid */}
      <div className="feature-grid">
        {features.map((feature, index) => (
          <div key={index} className="feature-card">
            <Text className="feature-icon">{feature.icon}</Text>
            <Text className="feature-title">{feature.title}</Text>
            <Text className="feature-desc">{feature.desc}</Text>
          </div>
        ))}
      </div>

      {/* Action Button */}
      <Box p={4}>
        <Button className="modern-btn" fullWidth>
          🚀 Khám phá ngay
        </Button>
      </Box>
    </Page>
  );
};

export default HomePage;
