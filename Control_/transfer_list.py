import sys

print("File processing ...")

fp = open("origin_st_list.txt")
fp2 = open("st_list.txt",'w')

for line in fp:
    token = line.split('!')
    print_line = token[0] + '!' + 'https://github.com/hgu-sit22005/midterm-' + token[1].split('\n')[0] + '.git\n'
    fp2.write(print_line)

print("Done")