import os
 
excludeKey = ['Pod','SBJson','JsonKit']

def filterFun(fileName):
    for key in excludeKey:
        if fileName.find(key) != -1:
            return False
    return True

def mapFun(fileName):
    return '#import "%s"' % os.path.basename(fileName)

fs = []
for root, dirs, files in os.walk("."): 
    for nf in [root+os.sep+f for f in files if f.find('.h')>0]:
        fs.append(nf)
fs = filter(filterFun, fs)
fs = map(mapFun, fs)
print "\n".join(fs)
