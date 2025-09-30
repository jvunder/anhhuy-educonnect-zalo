import React from 'react'
import { Page, Box, Text } from 'zmp-ui'

const LoginPage: React.FC = () => {
  return (
    <Page>
      <Box p={4} className="min-h-screen flex items-center justify-center">
        <div className="text-center">
          <div className="text-4xl mb-4">🔐</div>
          <Text size="xLarge" bold>Đăng nhập</Text>
          <Text className="text-text-secondary mt-2">
            Sẽ được phát triển trong phiên bản tiếp theo
          </Text>
        </div>
      </Box>
    </Page>
  )
}

export default LoginPage