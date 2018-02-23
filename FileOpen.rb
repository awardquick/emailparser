class EmailParser
    attr_reader :new_email

    def initialize(new_email)
      @new_email = new_email
    end

    def readfile
      File.readlines(@new_email)
    end

    def date
      readfile.select{|l| l.match /Date: /}
    end

    def to
      readfile.select{|l| l.match /To: /}[1]
    end

    def from
      readfile.select{|l| l.match /From: /}
    end

    def subject
      readfile.select{|l| l.match /Subject:/}
    end

    def body
      readfile gsub(/[^abcdefghijklmnopqrstuvwxyz ]/,'')
    end

end

new_email = EmailParser.new('FreshLines.txt')

puts new_email.date
puts new_email.to
puts new_email.from
puts new_email.subject
puts new_email.body
