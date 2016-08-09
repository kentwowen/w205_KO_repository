from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt
import psycopg2

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()



    def process(self, tup):
        word = tup.values[0]

        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount
        # Table name: Tweetwordcount
        # you need to create both the database and the table in advance.


        ####### SECTION START - NEW PORTION ADDED #######


        #Sample code snippets for working with psycopg

        #Connecting to a database
        #Note: If the database does not exist, then the following codes will create the database

        try:
            cur = conn.cursor()
            cur.execute("CREATE DATABASE tcount")
            cur.close()
            conn.commit()
            conn.close()
        except:
            print ("Could not create or no need to re-create tcount")

        uWord = word

        conn = psycopg2.connect(database="tcount",user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        try:
            cur.execute("""CREATE TABLE tweetwordcount (word TEXT PRIMARY KEY   NOT NULL, count INT NOT NULL);""")
            conn.commit()
        except:
            print("No need to create table")


        conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
        cur = conn.cursor()

        if uWord in self.counts:
                cur.execute("""UPDATE tweetwordcount SET count=%s WHERE word=%s;""",(self.counts[uWord], uWord))
        else:
                cur.execute("""INSERT INTO tweetwordcount (word,count) VALUES (%s, %s);""" , (uWord,1))

       
        ####### SECTION END - NEW PORTION ADDED ####### 

        # Increment word count and commit
        self.counts[uWord] += 1
        conn.commit()
        self.emit([uWord, self.counts[uWord]])

        # Log the count - just to see the topology running
        self.log('%s: %s' %(uWord, self.counts[uWord]))
