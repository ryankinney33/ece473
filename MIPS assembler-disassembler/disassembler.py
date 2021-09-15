# open a file with binary instructions (ascii for now)
# TODO: this should not be hardcoded
machineCode = open("binary.txt","r")

# make some dictionaries for extracting opcodes, register names, and funct's
opCodeDict = {0:"R-format", 1:"bltz/gbez", 2:"j", 3:"jal", 4:"beq", 5:"bne", 6:"blez", 7:"bgtz", \
              8:"addi", 9:"addiu", 10:"slti", 11:"sltiu", 12:"andi", 13:"ori", 14:"xori", 15:"lui", \
              16:"TLB", 17:"FLPt", \
              32:"lb", 33:"lh", 34:"lwl", 35:"lw", 36:"lbu",37:"lhu",38:"lwr", \
              40:"sb", 41:"sh", 42:"swl", 43:"sw", 46:"swr", 47:"cache",\
              48:"ll", 49:"lwc1", 50:"lwc2", 51:"pref", 53:"ldc1", 54:"ldc2",\
              56:"sc", 57:"swc1", 58:"swc2", 61:"sdc1", 62:"sdc2"}

# for when the op-code is "R-format"
functDict = {0:"sll", 2:"srl", 3:"sra", 4:"sllv", 6:"srlv", 7:"srav", \
             8:"jr", 9:"jalr", 10:"movz", 11:"movn", 12:"syscall", 13:"break", 15:"sync",\
             16:"mfhi", 17:"mthi", 18:"mflo", 19:"mtlo",\
             24:"mult", 25:"multu", 26:"div", 27:"divu",\
             32:"add", 33:"addu", 34:"sub", 35:"subu", 36:"and", 37:"or", 38:"xor", 39:"nor",\
             42:"slt", 43:"sltu",\
             48:"tge", 49:"tgeu", 50:"tlt", 51:"tltu", 52:"teg", 54:"tne"}

# holds the assembly instructions
assemblyCode = []

# for files that have 1 instruction per line, binary with 1's and 0's in ascii
line_counter = 0
label_counter = 0
for instr in machineCode:
    # add a line to the list if need be
    if len(assemblyCode) <= line_counter:
        assemblyCode.append("\t")

    # extract the op-code
    op = opCodeDict[int(instr[0:6],base=2)]

    # decode the instruction based on the op-code
    if op == "R-format":
        # r-format, extract registers
        funct = int(instr[-7:],base=2)
        mne = functDict[funct]
        rs = "$"+ str(int(instr[6:11],base=2))
        rt = "$"+ str(int(instr[11:16],base=2))
        rd = "$"+ str(int(instr[16:21],base=2))
        shamt = int(instr[21:26])
        assemblyCode[line_counter]+= mne+" "+rd+", "+rs+", "+rt

    elif op[0]=="j":
        # j-format, extract stuffs
        assemblyCode[line_counter]+= op+" label"

    else:
        # i-format, extract stuffs
        mne = op
        rs = "$"+ str(int(instr[6:11],base=2))
        rt = "$"+ str(int(instr[11:16],base=2))
        offset = int(instr[16:],base=2)
        
        # offset is a 16-bit two's complement number
        if offset > 0x7FFF:
            offset = -((offset ^ 0xFFFF)+1)
        
        if mne[0]=="l":
            # loading instructions have strange format
            assemblyCode[line_counter]+= mne+" "+rt+" "+str(offset)+"("+rs+")"
        elif mne[0]=="b":
            # branch instructions use labels, create or copy the necessary label
            label = "" # dummy variable to hold the label
            # first, add lines before the first line or after the last line if applicable
            label_line = offset+line_counter+1 # the line that requires a label
            
            for i in range(label_line,0): # adds items to the start of the list
                assemblyCode.insert(0,"\t")
                line_counter+=1 # update the line number
            if label_line < 0:
                label_line = 0

            for i in range(line_counter,label_line+1): # adds items to the end of the list
                assemblyCode.append("\t")
 
            # now create/copy the label
            if assemblyCode[label_line][0] != "L": # line does not have a label, add one
                label = "L"+str(label_counter)
                assemblyCode[label_line] = label+":"+assemblyCode[label_line]
                label_counter+=1
            else:
                label = assemblyCode[label_line].partition(":")[0]
            # finally, write the assembly instruction
            assemblyCode[line_counter]+= mne+" "+rt+", "+rs+", "+label
        else:
            assemblyCode[line_counter]+= mne+" "+rt+", "+rs+", "+str(offset)
    line_counter += 1

# print the contents, one member per line
for line in assemblyCode:
    print(line)

machineCode.close()