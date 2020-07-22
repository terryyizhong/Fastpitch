import sys

text = "It's said that half of the students don't have breakfast regularly or don't eat anything at all in the morning"
url = "tts.17zuoye.net/tts.php?g=i&h=n&t="+ text +"&r=f"
print(url)
print(len(text))
exit()
with open('error_code_4,_single_sentence_in_paragraph_too_long!_please_add_some_valid_punctuation', 'r') as f:
	for line in f:

		text = line.strip()
		print(len(text))
		url = "tts.17zuoye.net/tts.php?g=i&h=n&t="+ text +"&r=f"
		# print(url)