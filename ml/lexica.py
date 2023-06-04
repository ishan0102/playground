# query lexica.art api
import requests
import json

query = "apple pie"
# impleent rate limit handling
r = requests.get(f"https://lexica.art/api/v1/search?q={query}")
out = r.json()
print(json.dumps(out, indent=4))
