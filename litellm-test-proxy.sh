#!/bin/bash

# Configuration
PROXY_URL="http://localhost:7000/v1/chat/completions"
MASTER_KEY="sk-iannick-m2-secret"

# 1. Choose the model to test
echo "Which model do you want to test?"
echo "1) coder-junior (Qwen 3.5 9B)"
echo "2) coder-senior (Qwen3-Coder-Next)"
echo "3) qa-specialist (DeepSeek-R1 8B)"
read -p "Enter choice [1-3]: " choice

case $choice in
    1) MODEL="coder-junior" ;;
    2) MODEL="coder-senior" ;;
    3) MODEL="qa-specialist" ;;
    *) echo "Invalid choice"; exit 1 ;;
esac

# 2. Define the test prompt
PROMPT="Write a short Python function to check if a number is prime."

echo "--- Testing $MODEL ---"

# 3. Execute the call
curl -s $PROXY_URL \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $MASTER_KEY" \
  -d "{
    \"model\": \"$MODEL\",
    \"messages\": [
      {\"role\": \"system\", \"content\": \"You are a helpful coding assistant.\"},
      {\"role\": \"user\", \"content\": \"$PROMPT\"}
    ],
    \"stream\": false
  }" | jq '.choices[0].message.content'