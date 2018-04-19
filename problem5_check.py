import sys

from pathlib import Path
home = str(Path.home())

score_board = open(home + "/workspace/midterm18/problem_score.csv","a")
excuse_board = open(home + "/workspace/midterm18/problem_excuse.csv","a") 
st = sys.argv[1]
script = open("problem05.txt","r")
if_point = 0
final_point = 0
try:
    answer =  open("answer.txt", 'r')
    yours = open("result.txt",'r')
except IOError:
    data = "0," 
    score_board.write(data)
    score_board.write(str(0))
    score_board.write("\n")
    score_board.close()
    excuse_board.close()
    answer.close()
    yours.close()
    script.close()
    sys.exit()
    
answer_line = answer.readlines()
yours_line = yours.readlines()

if answer_line == yours_line :
    data = "20,"
    score_board.write(data)
else:
    data = "5," 
    excuse_data = "%s,Problem05\n" %st
    score_board.write(data)
    excuse_board.write(excuse_data)
    excuse_board.write("Answer : \n")
    excuse_board.writelines(answer_line)
    excuse_board.write("\n")
    excuse_board.write("Yours : \n")
    excuse_board.writelines(yours_line)
    excuse_board.write("---------------------------------------------------------\n")
    
while True:
    print("checking line...")
    line = script.readline()
    if not line: break
    if "if" in line: if_point += 1
    print("done")

if if_point != 0 : final_point = 0
else : final_point = 10

score_board.write(str(final_point))
score_board.write("\n")

score_board.close()
excuse_board.close()
answer.close()
yours.close()
script.close()