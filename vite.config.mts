import react from '@vitejs/plugin-react'
import path from 'path'
import { defineConfig } from 'vite'
import zaloMiniApp from 'zmp-vite-plugin'

export default () => {
  return defineConfig({
    plugins: [react(), zaloMiniApp()],
    resolve: {
      alias: {
        '@': path.resolve(__dirname, 'src'),
      },
    },
    build: {
      rollupOptions: {
        output: {
          entryFileNames: 'assets/index.1.0.0.module.js',
          chunkFileNames: 'assets/[name].1.0.0.module.js',
          assetFileNames: (assetInfo) => {
            if (assetInfo.name && assetInfo.name.endsWith('.css')) {
              return 'assets/index.1.0.0.css'
            }
            return 'assets/[name].1.0.0.[ext]'
          }
        },
      },
    },
  })
}