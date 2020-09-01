require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

spongebob = Student.new("Spongebob")
patrick = Student.new("Patrick")

mr_crabs = Instructor.new("Mr. Crabs")
squidword = Instructor.new("Squidword")

no_crashing = spongebob.add_boating_test("Don't Crash", "passed", mr_crabs)
breezy = spongebob.add_boating_test("Breeze 101", "pending", squidword)
breezy2 = spongebob.add_boating_test("Breeze 101", "pending", squidword)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

