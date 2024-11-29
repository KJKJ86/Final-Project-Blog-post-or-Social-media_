const { test, expect } = require('@playwright/test');

test('ตรวจสอบการทำงานของปุ่ม', async ({ page }) => {
  await page.goto('http://localhost:3000');
  const button = page.locator('text=Explore Features'); // ตรวจสอบปุ่มที่มีข้อความนี้
  await expect(button).toBeVisible();
  await button.click();
  await expect(page).toHaveURL('http://localhost:3000/features'); // ตรวจสอบว่าลิงก์ไปยัง /features
});
