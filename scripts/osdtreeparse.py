import json, sys

if (len(sys.argv) < 4):
	print False
	sys.exit()

osdtree = json.loads(open(sys.argv[1]).read())

# finding the host

def gethost(tree):
	for n in tree['nodes']:
		if ((n['type'] == "host") and n['name'] == sys.argv[2]):
			return n
	return None

node = gethost(osdtree)
if node is None:
	print False
	sys.exit()


# checking if the osd is a child of the host
for n in osdtree['nodes']:
	if n['id'] in node['children'] and (n['name'] == sys.argv[3]):
		print True
		sys.exit()

print False
