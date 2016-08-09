import psycopg2

import sys
# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print 'Argument List:', str(sys.argv)

def get_count(word=None):

    conn = psycopg2.connect(database="tcount",user="postgres", password="pass", host="localhost", port="5432")
    cur = conn.cursor()

    if word == None:
        cur.execute("SELECT * FROM tweetwordcount ORDER BY word")
        cursor_list = list(cur)
    	return cursor_list
    else:
        cur.execute("SELECT * FROM tweetwordcount WHERE word='" + word + "'")
        cursor_list = list(cur)
        #if len (cursor_list) > 0:
        if int(cursor_list[0][1]) > 0 :
            return "Total number of occurences of '" + word + "' : " + str(cursor_list[0][1])
        else:
            return "Total number of occurences of '" + word + "' : 0"        
    conn.commit()
    conn.close()

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print get_count()
    elif len(sys.argv) == 2:
        print get_count(sys.argv[1])
    else:
        print "arguments should be in format 'finalresults.py argword'"

