#!/bin/bash
set -e

echo "🔄 Converting to ZaUI Menu theme using zmp-ui built-in components..."

# 1. Replace coffee imports in app.js
sed -i '' \
  -e "s/import ZaUI from '@zalo\\/za-ui-coffee';/import { Menu } from 'zmp-ui';/" \
  -e "/za-ui-coffee/d" \
  app.js

# 2. Initialize Menu in app.js
cat << 'EOF' > tmp_app.js
import { Menu } from 'zmp-ui';
import 'zmp-ui/dist/style.css';

App({
  globalData: {
    miniAppId: '2789947330622533099',
    theme: 'menu',
    colors: { primary: '#1877F2', accent: '#00C8FF' }
  },
  onLaunch() {
    // ZaUI Menu init no-op; using <Menu> component directly
  }
});
EOF
mv tmp_app.js app.js

# 3. Update pages/index/index.txml to use <Menu>
cat << 'EOF' > pages/index/index.txml
<view class="page-container">
  <Menu 
    :items="[
      { text: 'Trang chủ', icon: 'home', route: '/pages/index/index' },
      { text: 'Khóa học', icon: 'book', route: '/pages/courses/index' },
      { text: 'Cá nhân', icon: 'user', route: '/pages/profile/index' }
    ]"
  />
  <view class="content"><slot/></view>
</view>
EOF

# 4. Create handler in pages/index/index.js
cat << 'EOF' > pages/index/index.js
Page({
  methods: {
    onMenuItemTap(evt) {
      zmp.navigateTo({ url: evt.detail.route });
    }
  }
});
EOF

# 5. Update style (keep previous index.tcss)
mv pages/index/index.tcss pages/index/index.css
cat << 'EOF' > pages/index/index.css
.page-container { display:flex; flex-direction:column; background:#fff; }
.Menu { position:fixed; bottom:0; width:100%; border-top:1px solid #e0e0e0; }
.content { flex:1; padding:20px; margin-bottom:60px; }
EOF

echo "✅ Conversion complete! Run npm run dev or zmp deploy to test."
