const express = require('express');
const path = require('path');
const app = express();

// ให้บริการไฟล์ static เช่น HTML, CSS, JS
app.use(express.static(path.join(__dirname, 'public')));

// Route สำหรับหน้าแรก
app.get('/', (req, res) => {
  res.send('<h1>Playwright Test Server</h1><p>Server is running successfully!</p>');
});

// รันเซิร์ฟเวอร์ที่พอร์ต 3000
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
