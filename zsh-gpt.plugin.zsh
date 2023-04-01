#!/bin/zsh

g() {
  if [[ ! $+commands[curl] ]]; then echo "Curl must be installed."; return 1; fi
  if [[ ! $+commands[jq] ]]; then echo "Jq must be installed."; return 1; fi
  if [[ ! -v OPENAI_API_KEY ]]; then echo "Must set OPENAI_API_KEY to your API key"; return 1; fi

  curl https://api.openai.com/v1/chat/completions -s \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $OPENAI_API_KEY" \
    -d '{
    "model": "gpt-3.5-turbo",
    "messages": [{"role": "user", "content": "'"$*"'"}]
  }' | jq -r '.choices[0].message.content'
}
