class EmailParser
  attr_reader :new_email

#sets a new email instance
    def initialize(new_email)
      @new_email = new_email
    end

#opens file assigned to instance variable and iterates through looking for matches
    def readfile
      File.readlines(@new_email).each do |line|
        if line =~ /Date: /
          puts line
        elsif line =~ /To: / && line !~ /Delivered-To:/
          puts line
      elsif line =~ /From: /
        puts line
      elsif line =~ /Subject: /
        puts line
      else
        end
      end
    end

#opens file assigned to instance variable and iterates through using a count when what I'm searching for it sets
#that iteration value equal to variable so it can be out put later in the code.
    def body
    email = []
    bodyindex = nil
    endbodyindex = nil
    htmlbodyindex = nil
    endhtmlbodyindex = nil

    File.readlines(@new_email).each do |line|
      email << line
    end

    i = 0
    email.each do |line|

      newline = line.split(";", 2)

      if newline.include?("Content-Type: text/plain") && (newline[0].split(//).length == 24)
		      bodyindex = i + 2
      elsif newline.include?("Content-Type: text/html") && (newline[0].split(//).length == 23)
 		      endbodyindex = i -1
      elsif line.include?("<html>")
        	htmlbodyindex = i
      elsif line.include?("</html>")
          endhtmlbodyindex = i
      end
      i+=1
    end
    puts email[bodyindex...endbodyindex].join
    #puts email[htmlbodyindex..endhtmlbodyindex].join
    end
end



##declare a new instance of EmailParser
new_email = EmailParser.new('Your File Name Here')


new_email.readfile
new_email.body
