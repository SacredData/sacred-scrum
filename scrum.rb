# scrum.rb
require 'time'

class SacredScrum
	def initialize
		puts "Hello! Establishing new report..."
		@time = Time.new
		@report = {:date => "#{@time}"}
	end
	attr_reader :report, :time
	def project
		puts "What project did you work on?"
		@p = gets.chomp
		return @p
	end
	def hours
		unless @p.nil?
			puts "How many hours did you spend on your project, #{@p}?"
			@h = gets.chomp
			return "#{@h}".to_f
		end
	end
	def description
		unless @p.nil? || @h.nil?
			puts "What did you accomplish?"
			@a = gets.chomp
			return @a
		end
	end
end

s = SacredScrum.new

done = false

while done == false
	report = s.report
	report['project'] = s.project
	report['hours'] = s.hours
	report['description'] = s.description
	puts report
	f = File.open("accomplished/#{s.time}", "w") {|file| file.write("#{report}")}
	puts "Report saved."
	puts "Do you want to enter another? (y/n)"
	q = gets.chomp
	if q == "y" || q == "yes"
		next
	elsif q == "n" || q == "no"
		puts "Thanks, goodbye."
		done == true
		exit
	end
end	
