# open a file with binary instructions (ascii for now)
# TODO: this should not be hardcoded
machineCode = open("binary.txt","r")

# make some dictionaries for converting stuffs
opCodeDict = {0:"R-format", 1:"bltz/gbez", 2:"j", 3:"jal", 4:"beq", 5:"bne", 6:"blez", 7:"bgtz", \
              8:"addi", 9:"addiu", 10:"slti", 11:"sltiu", 12:"andi", 13:"ori", 14:"xori", 15:"lui", \
              16:"TLB", 17:"FLPt", \
              \
              32:"lb", 33:"lh", 34:"lwl", 35:"lw", 36:"lbu",37:"lhu",38:"lwr", \
              40:"sb", 41:"sh", 42:"swl", 43:"sw", 46:"swr", \
              48:"ll", 49:"lwc1", \
              56:"sc", 57:"swc1"}
# for when the op-code is "R-format"
functDict
# for files that have 1 instruction per line, binary with 1's and 0's in ascii
for instr in machineCode:
    op = int(instr[0:6],base=2);
    # print(op)
    print(opCodeDict[op])