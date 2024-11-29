const express = require('express');
const path = require('path');
const app = express();

// ให้บริการไฟล์ static
app.use(express.static(path.join(__dirname, 'public')));

// Route สำหรับหน้าแรก
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// Route สำหรับ /features
app.get('/features', (req, res) => {
  res.send('<h1>Features Page</h1><p>This is the features page.</p>');
});

// รันเซิร์ฟเวอร์ที่พอร์ต 3000
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
