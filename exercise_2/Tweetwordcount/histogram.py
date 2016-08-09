import psycopg2

import sys
# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print 'Argument List:', str(sys.argv)

def hist_words(min_len,max_len):

    conn = psycopg2.connect(database="tcount",user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()

    cur.execute("SELECT * FROM tweetwordcount WHERE COUNT >= " + str(min_len) + " and COUNT <= " + str(max_len) + "ORDER BY COUNT DESC")
    cursor_list = list(cur)
    return cursor_list

    conn.commit()
    conn.close()

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print "you need to enter an argument. enter two numbers after 'histogram.py' with a comma and  no space in between, like 'histogram.py 5,8'"
    elif len(sys.argv) == 2:
        temp_list = sys.argv[1].split(',')
        min_len = temp_list[0]
        max_len = temp_list[1]
        print hist_words(min_len, max_len)
    else:
        print "you need to enter in the following format: enter two numbers after 'histogram.py' with a comma and no space in between, like 'histogram.py 5,8'"


