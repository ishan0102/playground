alias startbot="tmux new-session -d -s apheleia 'cd ~/documents/apheleia && . venv/bin/activate && python3 src/bot.py'"
alias stopbot="tmux kill-server"