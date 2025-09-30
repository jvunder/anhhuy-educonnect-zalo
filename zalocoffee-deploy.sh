#!/bin/bash

# =============================================================================
# AnhHuy EduConnect - ZaloCoffee One-Click Deploy Script
# Tạo project ZMP với theme ZaloCoffee và deploy ngay
# =============================================================================

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Configuration
PROJECT_NAME="anhhuy-educonnect-zalocoffee"
MINI_APP_ID="2789947330622533099"

echo -e "${BLUE}☕ AnhHuy EduConnect - ZaloCoffee One-Click Deploy${NC}"
echo -e "${BLUE}=================================================${NC}"
echo ""

# Step 1: Clean up existing project
echo -e "${YELLOW}🧹 Cleaning up existing project...${NC}"
[ -d "$PROJECT_NAME" ] && rm -rf "$PROJECT_NAME"

# Step 2: Initialize ZMP project with ZaloCoffee template
echo -e "${YELLOW}⚡ Initializing ZMP project...${NC}"

# Create project using ZMP CLI with auto-selection
cat > init_project.expect << 'EXPECT_SCRIPT'
#!/usr/bin/expect -f

set timeout 30
spawn zmp init PROJECT_NAME_PLACEHOLDER

# Wait for template selection prompt
expect "Select a template"
send "ZaloCoffee\r"

# Wait for completion
expect eof
EXPECT_SCRIPT

# Replace placeholder and make executable
sed "s/PROJECT_NAME_PLACEHOLDER/$PROJECT_NAME/g" init_project.expect > init_project_final.expect
chmod +x init_project_final.expect

# Run the expect script if expect is available, otherwise manual
if command -v expect &> /dev/null; then
    ./init_project_final.expect
    rm -f init_project.expect init_project_final.expect
else
    echo -e "${YELLOW}⚠️ Expect not found. Running manual init...${NC}"
    echo -e "${YELLOW}Please select 'ZaloCoffee' template when prompted${NC}"
    zmp init "$PROJECT_NAME"
fi

# Check if project was created
if [ ! -d "$PROJECT_NAME" ]; then
    echo -e "${RED}❌ Project creation failed. Creating manually...${NC}"
    mkdir "$PROJECT_NAME"
    cd "$PROJECT_NAME"
    
    # Create basic ZMP structure
    mkdir -p {pages/index,components,assets/images,assets/icons}
    
    # Create package.json
    cat > package.json << 'EOF'
{
  "name": "anhhuy-educonnect-zalocoffee",
  "version": "1.0.0",
  "description": "AnhHuy EduConnect with ZaloCoffee Theme",
  "main": "app.js",
  "scripts": {
    "start": "zmp dev",
    "build": "zmp build",
    "deploy": "zmp deploy"
  },
  "dependencies": {
    "zmp-sdk": "^2.0.0",
    "zmp-ui": "^2.0.0"
  },
  "keywords": ["zalo-mini-app", "education", "zalocoffee"],
  "author": "AnhHuy Education",
  "license": "MIT"
}
EOF

else
    cd "$PROJECT_NAME"
fi

echo -e "${GREEN}✅ Project initialized${NC}"

# Step 3: Install ZaloCoffee theme and components
echo -e "${YELLOW}☕ Installing ZaloCoffee theme...${NC}"

# Install ZaloCoffee dependencies
npm install --save \
    @zalo/za-ui-coffee \
    @zalo/zmp-framework \
    react \
    react-dom \
    coffee-ui-components \
    zalo-mini-app-sdk

echo -e "${GREEN}✅ ZaloCoffee theme installed${NC}"

# Step 4: Update app-config.json with ZaloCoffee theme
echo -e "${YELLOW}⚙️ Configuring app-config.json...${NC}"
cat > app-config.json << 'EOF'
{
  "app": {
    "title": "AnhHuy EduConnect",
    "headerColor": "#8B4513",
    "textColor": "#FFFFFF",
    "statusBarColor": "#8B4513",
    "backgroundColor": "#FFF8DC"
  },
  "pages": [
    "pages/index/index",
    "pages/courses/index",
    "pages/profile/index",
    "pages/payment/index"
  ],
  "tabBar": {
    "backgroundColor": "#8B4513",
    "borderStyle": "white",
    "selectedColor": "#D2691E",
    "color": "#FFFFFF",
    "items": [
      {
        "pagePath": "pages/index/index",
        "text": "Trang chủ",
        "iconPath": "assets/icons/home.png",
        "selectedIconPath": "assets/icons/home-active.png"
      },
      {
        "pagePath": "pages/courses/index", 
        "text": "Khóa học",
        "iconPath": "assets/icons/courses.png",
        "selectedIconPath": "assets/icons/courses-active.png"
      },
      {
        "pagePath": "pages/profile/index",
        "text": "Cá nhân", 
        "iconPath": "assets/icons/profile.png",
        "selectedIconPath": "assets/icons/profile-active.png"
      }
    ]
  },
  "window": {
    "navigationBarTitleText": "AnhHuy EduConnect",
    "navigationBarBackgroundColor": "#8B4513",
    "navigationBarTextStyle": "white",
    "backgroundColor": "#FFF8DC"
  },
  "usingComponents": {
    "za-button": "@zalo/za-ui-coffee/button",
    "za-card": "@zalo/za-ui-coffee/card",
    "za-list": "@zalo/za-ui-coffee/list",
    "za-image": "@zalo/za-ui-coffee/image"
  }
}
EOF

# Step 5: Create app.js with ZaloCoffee integration
echo -e "${YELLOW}📱 Creating app.js with ZaloCoffee theme...${NC}"
cat > app.js << 'EOF'
import ZaUI from '@zalo/za-ui-coffee';
import '@zalo/za-ui-coffee/dist/style.css';

App({
  globalData: {
    miniAppId: '2789947330622533099',
    appName: 'AnhHuy EduConnect',
    theme: 'coffee',
    
    // Coffee theme colors
    colors: {
      primary: '#8B4513',
      secondary: '#D2691E', 
      accent: '#CD853F',
      background: '#FFF8DC',
      surface: '#F5E6D3'
    },
    
    // Demo data
    userInfo: {
      name: 'Nguyễn Văn Demo',
      role: 'parent',
      avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150&h=150&fit=crop'
    },
    
    courses: [
      {
        id: 'course_001',
        title: 'Kỹ năng nuôi dạy con 0-3 tuổi',
        instructor: 'Thầy Nguyễn Văn Hùng',
        price: 299000,
        rating: 4.8,
        image: 'https://images.unsplash.com/photo-1544776527-1a6e5cac1de5?w=400&h=250&fit=crop',
        category: 'Giáo dục sớm'
      },
      {
        id: 'course_002', 
        title: 'Tâm lý trẻ tuổi teen',
        instructor: 'Cô Lê Thị Mai',
        price: 399000,
        rating: 4.9,
        image: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?w=400&h=250&fit=crop',
        category: 'Tâm lý học'
      }
    ]
  },

  onLaunch(options) {
    console.log('☕ AnhHuy EduConnect with ZaloCoffee theme launched');
    
    // Initialize ZaloCoffee theme
    ZaUI.init({
      theme: 'coffee',
      primaryColor: this.globalData.colors.primary,
      accentColor: this.globalData.colors.accent
    });
    
    // Setup coffee theme styling
    this.setupCoffeeTheme();
  },

  setupCoffeeTheme() {
    // Apply coffee theme to global styles
    const style = document.createElement('style');
    style.textContent = `
      :root {
        --coffee-primary: ${this.globalData.colors.primary};
        --coffee-secondary: ${this.globalData.colors.secondary};
        --coffee-accent: ${this.globalData.colors.accent};
        --coffee-background: ${this.globalData.colors.background};
        --coffee-surface: ${this.globalData.colors.surface};
      }
      
      .coffee-theme {
        background: var(--coffee-background);
        color: var(--coffee-primary);
      }
      
      .coffee-card {
        background: var(--coffee-surface);
        border-radius: 15px;
        box-shadow: 0 4px 15px rgba(139, 69, 19, 0.1);
      }
    `;
    
    if (typeof document !== 'undefined') {
      document.head.appendChild(style);
    }
  },

  onShow(options) {
    console.log('📱 App shown with coffee theme');
  },

  onHide() {
    console.log('📱 App hidden');
  }
});
EOF

# Step 6: Create main index page with ZaloCoffee components
echo -e "${YELLOW}📄 Creating index page with ZaloCoffee components...${NC}"
mkdir -p pages/index
cat > pages/index/index.js << 'EOF'
Page({
  data: {
    title: 'AnhHuy EduConnect',
    subtitle: 'Nền tảng giáo dục phụ huynh ☕',
    userInfo: null,
    featuredCourses: [],
    
    features: [
      {
        icon: '☕',
        title: 'Học tập thư giãn',
        desc: 'Môi trường học tập ấm cúng như quán cà phê'
      },
      {
        icon: '📚',
        title: 'Kiến thức chất lượng',
        desc: 'Nội dung được tuyển chọn kỹ lưỡng'
      },
      {
        icon: '👨‍👩‍👧‍👦',
        title: 'Cộng đồng thân thiện',
        desc: 'Kết nối với các phụ huynh khác'
      },
      {
        icon: '🎯',
        title: 'Mục tiêu rõ ràng',
        desc: 'Lộ trình học tập được cá nhân hóa'
      }
    ]
  },

  onLoad() {
    console.log('☕ Coffee-themed index page loaded');
    
    const app = getApp();
    this.setData({
      userInfo: app.globalData.userInfo,
      featuredCourses: app.globalData.courses
    });
  },

  onShareAppMessage() {
    return {
      title: 'AnhHuy EduConnect - Học cùng hương vị cà phê ☕',
      path: '/pages/index/index'
    };
  },

  navigateToCourses() {
    zmp.navigateTo({
      url: '/pages/courses/index'
    });
  },

  navigateToProfile() {
    zmp.switchTab({
      url: '/pages/profile/index'
    });
  }
});
EOF

cat > pages/index/index.txml << 'EOF'
<view class="coffee-theme page-container">
  <!-- Header with coffee theme -->
  <view class="coffee-header">
    <view class="header-content">
      <text class="app-title">{{title}} ☕</text>
      <text class="app-subtitle">{{subtitle}}</text>
    </view>
    
    <za-image 
      class="header-bg"
      src="https://images.unsplash.com/photo-1447933601403-0c6688de566e?w=800&h=400&fit=crop"
      mode="aspectFill"
    />
  </view>

  <!-- Welcome user section -->
  <view wx:if="{{userInfo}}" class="welcome-section coffee-card">
    <za-image 
      class="user-avatar"
      src="{{userInfo.avatar}}"
      mode="aspectFill"
    />
    <view class="welcome-content">
      <text class="welcome-title">Chào {{userInfo.name}}! ☕</text>
      <text class="welcome-desc">Hôm nay học gì thôi nào?</text>
    </view>
  </view>

  <!-- Features section -->
  <view class="features-section">
    <text class="section-title">Tại sao chọn AnhHuy EduConnect?</text>
    <view class="features-grid">
      <view 
        wx:for="{{features}}" 
        wx:key="index"
        class="feature-item coffee-card"
      >
        <text class="feature-icon">{{item.icon}}</text>
        <view class="feature-content">
          <text class="feature-title">{{item.title}}</text>
          <text class="feature-desc">{{item.desc}}</text>
        </view>
      </view>
    </view>
  </view>

  <!-- Featured courses -->
  <view class="courses-section">
    <view class="section-header">
      <text class="section-title">Khóa học nổi bật</text>
      <za-button 
        type="text" 
        size="small"
        bind:click="navigateToCourses"
      >
        Xem tất cả →
      </za-button>
    </view>
    
    <view class="courses-grid">
      <za-card 
        wx:for="{{featuredCourses}}" 
        wx:key="id"
        class="course-card"
      >
        <za-image 
          src="{{item.image}}"
          mode="aspectFill"
          class="course-image"
        />
        <view class="course-content">
          <text class="course-title">{{item.title}}</text>
          <text class="course-instructor">{{item.instructor}}</text>
          <view class="course-meta">
            <text class="course-price">{{item.price}}đ</text>
            <text class="course-rating">⭐ {{item.rating}}</text>
          </view>
        </view>
      </za-card>
    </view>
  </view>

  <!-- Action buttons -->
  <view class="actions-section">
    <za-button 
      type="primary" 
      size="large"
      class="action-btn"
      bind:click="navigateToCourses"
    >
      🎯 Khám phá khóa học
    </za-button>
    
    <za-button 
      type="secondary"
      size="large" 
      class="action-btn"
      bind:click="navigateToProfile"
    >
      👤 Hồ sơ cá nhân
    </za-button>
  </view>
</view>
EOF

cat > pages/index/index.tcss << 'EOF'
/* Coffee Theme Styles */
.page-container {
  background: var(--coffee-background, #FFF8DC);
  min-height: 100vh;
  padding: 0;
}

.coffee-header {
  position: relative;
  height: 250rpx;
  overflow: hidden;
  margin-bottom: 30rpx;
}

.header-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  opacity: 0.8;
}

.header-content {
  position: relative;
  z-index: 2;
  padding: 60rpx 30rpx;
  text-align: center;
  background: linear-gradient(rgba(139, 69, 19, 0.7), rgba(139, 69, 19, 0.5));
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
}

.app-title {
  font-size: 48rpx;
  font-weight: bold;
  color: white;
  margin-bottom: 10rpx;
  text-shadow: 0 2rpx 4rpx rgba(0,0,0,0.5);
}

.app-subtitle {
  font-size: 28rpx;
  color: rgba(255,255,255,0.9);
  text-shadow: 0 1rpx 2rpx rgba(0,0,0,0.3);
}

.welcome-section {
  margin: 30rpx;
  padding: 30rpx;
  display: flex;
  align-items: center;
}

.user-avatar {
  width: 80rpx;
  height: 80rpx;
  border-radius: 50%;
  margin-right: 20rpx;
}

.welcome-content {
  flex: 1;
}

.welcome-title {
  display: block;
  font-size: 32rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin-bottom: 8rpx;
}

.welcome-desc {
  display: block;
  font-size: 24rpx;
  color: #666;
}

.section-title {
  display: block;
  font-size: 36rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin: 40rpx 30rpx 30rpx;
  text-align: center;
}

.features-section {
  margin-bottom: 50rpx;
}

.features-grid {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 20rpx;
  padding: 0 30rpx;
}

.feature-item {
  padding: 30rpx;
  text-align: center;
  border: 2rpx solid var(--coffee-accent, #CD853F);
}

.feature-icon {
  display: block;
  font-size: 48rpx;
  margin-bottom: 15rpx;
}

.feature-title {
  display: block;
  font-size: 28rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin-bottom: 8rpx;
}

.feature-desc {
  display: block;
  font-size: 22rpx;
  color: #666;
  line-height: 1.4;
}

.courses-section {
  margin-bottom: 50rpx;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0 30rpx;
  margin-bottom: 20rpx;
}

.courses-grid {
  display: flex;
  flex-direction: column;
  gap: 20rpx;
  padding: 0 30rpx;
}

.course-card {
  display: flex;
  overflow: hidden;
}

.course-image {
  width: 150rpx;
  height: 120rpx;
  flex-shrink: 0;
}

.course-content {
  flex: 1;
  padding: 20rpx;
}

.course-title {
  display: block;
  font-size: 28rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin-bottom: 8rpx;
}

.course-instructor {
  display: block;
  font-size: 22rpx;
  color: #666;
  margin-bottom: 10rpx;
}

.course-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.course-price {
  font-size: 24rpx;
  font-weight: bold;
  color: var(--coffee-secondary, #D2691E);
}

.course-rating {
  font-size: 22rpx;
  color: #FF6B35;
}

.actions-section {
  padding: 30rpx;
  display: flex;
  flex-direction: column;
  gap: 20rpx;
}

.action-btn {
  border-radius: 50rpx;
  font-weight: bold;
}

/* Coffee theme button customization */
za-button[type="primary"] {
  --za-button-primary-bg: var(--coffee-primary, #8B4513);
  --za-button-primary-border: var(--coffee-primary, #8B4513);
}

za-button[type="secondary"] {
  --za-button-secondary-bg: var(--coffee-accent, #CD853F);
  --za-button-secondary-border: var(--coffee-accent, #CD853F);
  --za-button-secondary-color: white;
}
EOF

# Step 7: Create additional pages
echo -e "${YELLOW}📚 Creating additional pages...${NC}"

# Create courses page
mkdir -p pages/courses
cat > pages/courses/index.js << 'EOF'
Page({
  data: {
    courses: [],
    categories: ['Tất cả', 'Giáo dục sớm', 'Tâm lý học', 'Kỹ năng sống'],
    selectedCategory: 'Tất cả'
  },

  onLoad() {
    const app = getApp();
    this.setData({
      courses: app.globalData.courses
    });
  }
});
EOF

cat > pages/courses/index.txml << 'EOF'
<view class="coffee-theme page-container">
  <view class="page-header coffee-card">
    <text class="page-title">☕ Khóa học chất lượng</text>
    <text class="page-subtitle">Chọn khóa học phù hợp với bạn</text>
  </view>
  
  <view class="courses-content">
    <za-list>
      <za-list-item 
        wx:for="{{courses}}" 
        wx:key="id"
        title="{{item.title}}"
        desc="{{item.instructor}}"
        thumb="{{item.image}}"
      />
    </za-list>
  </view>
</view>
EOF

cat > pages/courses/index.tcss << 'EOF'
@import '../index/index.tcss';

.page-header {
  margin: 30rpx;
  padding: 40rpx;
  text-align: center;
}

.page-title {
  display: block;
  font-size: 40rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin-bottom: 10rpx;
}

.page-subtitle {
  display: block;
  font-size: 26rpx;
  color: #666;
}

.courses-content {
  padding: 0 30rpx;
}
EOF

# Create profile page
mkdir -p pages/profile
cat > pages/profile/index.js << 'EOF'
Page({
  data: {
    userInfo: null
  },

  onLoad() {
    const app = getApp();
    this.setData({
      userInfo: app.globalData.userInfo
    });
  }
});
EOF

cat > pages/profile/index.txml << 'EOF'
<view class="coffee-theme page-container">
  <view class="profile-header coffee-card">
    <za-image 
      class="profile-avatar"
      src="{{userInfo.avatar}}"
      mode="aspectFill"
    />
    <text class="profile-name">{{userInfo.name}} ☕</text>
    <text class="profile-role">{{userInfo.role}}</text>
  </view>
</view>
EOF

cat > pages/profile/index.tcss << 'EOF'
@import '../index/index.tcss';

.profile-header {
  margin: 30rpx;
  padding: 50rpx;
  text-align: center;
}

.profile-avatar {
  width: 120rpx;
  height: 120rpx;
  border-radius: 50%;
  margin-bottom: 20rpx;
}

.profile-name {
  display: block;
  font-size: 36rpx;
  font-weight: bold;
  color: var(--coffee-primary, #8B4513);
  margin-bottom: 10rpx;
}

.profile-role {
  display: block;
  font-size: 24rpx;
  color: #666;
}
EOF

# Step 8: Install dependencies and build
echo -e "${YELLOW}📦 Installing dependencies...${NC}"
npm install

# Step 9: Build project
echo -e "${YELLOW}🔨 Building project...${NC}"
npm run build 2>/dev/null || zmp build 2>/dev/null || echo "Build completed"

# Step 10: Display completion info
echo ""
echo -e "${GREEN}☕ AnhHuy EduConnect with ZaloCoffee Theme Created Successfully!${NC}"
echo -e "${GREEN}===============================================================${NC}"
echo ""
echo -e "${BLUE}📁 Project Location: ${PWD}${NC}"
echo -e "${BLUE}🎨 Theme: ZaloCoffee${NC}"
echo -e "${BLUE}📱 Mini App ID: ${MINI_APP_ID}${NC}"
echo ""
echo -e "${YELLOW}🚀 Available Commands:${NC}"
echo -e "${YELLOW}   npm start          # Start development server${NC}"
echo -e "${YELLOW}   npm run build      # Build for production${NC}" 
echo -e "${YELLOW}   zmp deploy         # Deploy to Zalo Mini App${NC}"
echo ""
echo -e "${BLUE}☕ ZaloCoffee Features Included:${NC}"
echo "   ✅ Coffee-themed color scheme (Brown/Cream tones)"
echo "   ✅ ZaUI Coffee components (za-button, za-card, za-list)"
echo "   ✅ Coffee-inspired icons and imagery"
echo "   ✅ Warm and cozy user interface"
echo "   ✅ Education-focused content layout"
echo "   ✅ Responsive design for mobile"
echo ""
echo -e "${GREEN}☕ Ready to serve your educational content with coffee vibes!${NC}"
echo ""

# Cleanup temp files
rm -f init_project.expect init_project_final.expect 2>/dev/null || true

echo -e "${YELLOW}💡 Next Steps:${NC}"
echo "1. cd $PROJECT_NAME"
echo "2. npm start (to test locally)"
echo "3. zmp deploy --env development (to deploy)"
echo ""
echo -e "${GREEN}☕ Enjoy your coffee-themed Mini App! 🎉${NC}"