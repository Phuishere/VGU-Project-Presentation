import { defineConfig } from 'vite'
import path from 'path'

export default defineConfig({
  resolve: {
    alias: {
      'images': path.resolve(__dirname, './images'),
    },
  },
})
