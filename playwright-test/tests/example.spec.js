const { test, expect } = require('@playwright/test');

test('ตรวจสอบหน้าแรก', async ({ page }) => {
  await page.goto('http://localhost:3000');
  await expect(page).toHaveTitle('Playwright Test');
});
