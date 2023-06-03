alias startbot="cd ~/documents/aphelia; activate; tmux new-session -d -s aphelia 'python3 bot.py'"
alias stopbot="tmux kill-server"
alias updatebot="cd ~/documents/aphelia; git pull; rm -rf venv; mkvenv; pip install -r requirements.txt"
alias upgradebot="printf 'STOPPING BOT\n\n'; stopbot; printf 'UPDATING BOT\n\n'; updatebot; printf 'STARTING BOT\n\n'; startbot;"