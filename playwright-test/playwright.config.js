const { defineConfig } = require('@playwright/test');

module.exports = defineConfig({
  testDir: './tests', // โฟลเดอร์ที่เก็บไฟล์ทดสอบ
  webServer: {
    command: 'npm run start', // คำสั่งรันเซิร์ฟเวอร์
    url: 'http://localhost:3000', // URL ที่ต้องการตรวจสอบ
    reuseExistingServer: !process.env.CI, // ใช้เซิร์ฟเวอร์เดิมถ้ามี
  },
  use: {
    headless: true, // รันทดสอบแบบไม่แสดง UI
    trace: 'on-first-retry', // เก็บ Trace เมื่อการทดสอบล้มเหลว
  },
});
