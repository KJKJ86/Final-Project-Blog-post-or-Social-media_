const { test, expect } = require('@playwright/test');

test('ตรวจสอบหน้าแรก', async ({ page }) => {
  await page.goto('http://localhost:3000');
  await expect(page).toHaveTitle('Playwright Test'); // ตรงกับ title ใน HTML
});
test('ตรวจสอบหน้า Features', async ({ page }) => {
  await page.goto('http://localhost:3000/features');
  await expect(page.locator('h1')).toHaveText('Features Page');
});
