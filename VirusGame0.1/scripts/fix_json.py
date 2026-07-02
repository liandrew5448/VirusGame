import re
p = r"c:/VirusGame/VirusGame0.1/rooms/Testroom/Testroom.yy"
with open(p, 'r', encoding='utf-8') as f:
    s = f.read()
# Remove trailing commas before } or ]
s_new = re.sub(r',\s*([}\]])', r'\1', s)
with open(p, 'w', encoding='utf-8') as f:
    f.write(s_new)
print('cleaned')
