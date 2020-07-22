import json

with open('error_code_01,_reach_max_decoder_steps', 'r') as f:
    lines = f.readlines()

textset = set()
fw = open('error_code_01,_reach_max_decoder_steps-filter', 'w')


for l in lines:
    text = l.strip()
    if text not in textset and len(text) < 150:

        fw.write(text + '\n')
        textset.add(text)
