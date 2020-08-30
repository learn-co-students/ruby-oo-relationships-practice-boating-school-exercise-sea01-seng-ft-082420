class Student
  attr_accessor :first_name
  @@all = []

  def initialize(first_name)
    @first_name = first_name
    @@all << self
  end 

  def self.all 
    @@all
  end 

  def add_boating_test(test_name, test_status, instructor)
    BoatingTest.new(self, test_name, test_status, instructor)
  end 

  def tests 
    BoatingTest.all.select {|test| test.student == self}
  end

  def all_instructors
    self.tests.map {|test| test.instructor}.uniq
  end 

  def self.find_student(name)
    self.all.find {|person| person.first_name == name}
  end 

  def grade_percentage
    pass = self.tests.count {|test| test.test_status == "passed"}
    pass.to_f/self.tests.length.to_f * 100
  end 

end
