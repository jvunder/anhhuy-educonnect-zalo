#!/bin/bash
set -e

echo "🔄 Converting to ZaUI Menu theme..."

# 1. Cài thư viện ZaUI Menu
npm install @zalo/za-ui-menu --save

# 2. Cập nhật app.js
echo "📱 Updating app.js..."
cat > app.js << 'EOF'
import ZaUIMenu from '@zalo/za-ui-menu';
import '@zalo/za-ui-menu/dist/style.css';

App({
  globalData: {
    miniAppId: '2789947330622533099',
    theme: 'menu',
    colors: {
      primary: '#1877F2',
      accent: '#00C8FF'
    }
  },
  onLaunch() {
    ZaUIMenu.init({
      theme: 'menu',
      primaryColor: this.globalData.colors.primary,
      accentColor: this.globalData.colors.accent
    });
  }
});
EOF

# 3. Thay thế header/navigation trên index page
echo "🔧 Updating pages/index/index.txml..."
cat > pages/index/index.txml << 'EOF'
<view class="page-container">
  <za-menu
    bind:change="onMenuChange"
    items='[
      {"text":"Trang chủ","icon":"home"},
      {"text":"Khóa học","icon":"book"},
      {"text":"Cá nhân","icon":"user"}
    ]'
  />
  <view class="content"><slot/></view>
</view>
EOF

# 4. Tạo handler onMenuChange
echo "🔧 Creating pages/index/index.js..."
cat > pages/index/index.js << 'EOF'
Page({
  onMenuChange(e) {
    const routes = ['index','courses/index','profile/index'];
    zmp.navigateTo({ url: '/pages/' + routes[e.detail.index] });
  }
});
EOF

# 5. Cập nhật style
echo "🎨 Updating pages/index/index.tcss → index.css..."
mv pages/index/index.tcss pages/index/index.css
cat > pages/index/index.css << 'EOF'
.page-container {
  display: flex;
  flex-direction: column;
  min-height: 100vh;
}
za-menu {
  position: fixed;
  bottom: 0;
  width: 100%;
  border-top: 1px solid #e0e0e0;
}
.content {
  flex: 1;
  padding: 20px;
  margin-bottom: 80px;
}
EOF

echo "✅ Conversion to ZaUI Menu complete!"
echo "👉 Chạy tiếp:"
echo "   npm run dev"
echo "   zmp deploy --env development"
