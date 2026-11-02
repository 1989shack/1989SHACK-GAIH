// GAIH-AI - Mama AI Brain
const express = require('express');
const app = express();
app.use(express.json());

// Your Llama server (Ollama) runs on localhost:11434
app.post('/api/ai/chat', async (req, res) => {
  const userMessage = req.body.message;
  
  // Call your local Llama (no internet needed!)
  const response = await fetch('http://localhost:11434/api/generate', {
    method: 'POST',
    body: JSON.stringify({
      model: 'llama3.2:1b',
      prompt: `You are 1989SHACK Mama AI, Liberian assistant. User: ${userMessage}`,
      stream: false
    })
  });
  
  const data = await response.json();
  res.json({ reply: data.response, powered_by: 'GAIH-AI Monrovia' });
});

app.listen(5000, () => console.log('Mama AI running on port 5000'));