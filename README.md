# emailparser

Designed an email parser to handle MIME content type text/plain and text/html.

Running this program in the command line will allow you to parse the raw data of an email which is stored in a txt file. 

The program looks for Date, who the email is from, where it came to, if it was in reply to something, the subject, and the body of the email. 

In order to run this program you need to download it then move on your command line to the file directory. In order to get the program to work
you will need to instantiate a new Email.Parser by putting the name of the file in place of the "FreshLines.Txt" you see in the code. 

When your ready to run it just type ruby fileopen.rb which will output the email data.

