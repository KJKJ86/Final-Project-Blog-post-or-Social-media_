const { test, expect } = require('@playwright/test');

test('ตรวจสอบการทำงานของปุ่ม', async ({ page }) => {
  await page.goto('http://localhost:3000');
  const button = page.locator('text=Explore Features');
  await expect(button).toBeVisible();
  await button.click();
  await expect(page).toHaveURL('http://localhost:3000/features');
});
