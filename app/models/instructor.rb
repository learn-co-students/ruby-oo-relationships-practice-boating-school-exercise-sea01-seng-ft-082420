class Instructor
  attr_accessor :name 
  @@all = []

  def initialize(name)
    @name = name 
    @@all << self 
  end 

  def self.all 
    @@all 
  end 

  def tests 
    BoatingTest.all.select {|test| test.instructor == self}
  end

 

  def pass_student(student, test_name)
    student_test = BoatingTest.all.find {|test| test.student == student && test.test_name == test_name}
    if student_test 
      student_test.test_status = "passed"
    else 
      BoatingTest.new(student, test_name, "passed", self)
     end 
  end 

  def fail_student(student, test_name)
    student_test = BoatingTest.all.find {|test| test.student == student && test.test_name == test_name}
    if student_test 
      student_test.test_status = "failed"
    else 
      BoatingTest.new(student, test_name, "failed", self)
     end 
  end 

  def all_students
    self.tests.map {|test| test.student}.uniq
  end 

end
