opts = ""
while opts=="":
	user_input = input("Input an upper case letter, or type 'quit' to quit: ")
	if user_input=="quit": exit()
	opts = ''.join((c for c in user_input if c in "ABCDEF"))
for c in set(user_input)-set("ABCDEF"):
	print(f"Option {c} invalid. Ignoring")
file = open("C:/MCNP6/FACILITIES/REED/Crit Loading Exp/problem.txt",'r')
universes = {'A':"5504",'B':"5505",'C':"5506",'D':"5507",'E':"5508",'F':"5509"}
universes_found = {c:0 for c in opts}
for row in file:
	entries = row.split(' ')
	k = 1
	for c in opts:
		if entries[0][:4]==universes[c]:
			universes_found[c]+=1
			while entries[k]=='': k+=1
			entries[k]="102"
			k+=1
			while entries[k]=='': k+=1
			entries[k]="-1.00"
	print(' '.join(entries),file=open(f"C:/MCNP6/FACILITIES/REED/Crit Loading Exp/problem-{opts}.txt",'a'),end='')
for c in universes_found:
	if universes_found[c]==0:
		print(f"Option {c} doesn't exist")
