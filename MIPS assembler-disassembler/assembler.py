# open the file with assembly code
# TODO: commandline arguments to not have this hard-coded
asm = open("assembly.txt","r")

for line in asm:
    mnemonic = line.split(" ")[0] # get the first word of the assembly line
    
    
asm.close()