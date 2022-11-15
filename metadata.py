import requests
import json
res = requests.get('http://metadata.google.internal/computeMetadata/v1/instance/?recursive=true' , params='Metadata-Flavor: Google')
response = res.text
content = json.dumps(response, indent=4)
with open('metadata.json','w') as f:
    f.write(content)