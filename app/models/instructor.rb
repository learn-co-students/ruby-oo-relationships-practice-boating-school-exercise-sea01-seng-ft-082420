class Instructor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def boating_tests
        BoatingTest.all.select do |tests|
            tests.instructor == self
        end
    end

    def all_students
        self.boating_tests.collect do |tests|
            tests.student
        end
    end

    def passed_students
        self.boating_tests.map do |tests|
            tests.test_status == "passed"
            tests.student
        end
    end

    def pass_student(student, test_name)
        student_test = BoatingTest.all.find do |test| 
            test.student == student && test.test_name == test_name
        end
        if student_test
            student_test.test_status = "passed"
        else 
            BoatingTest.new(student,test_name,"passed", self)
        end 
    end

    def fail_student(student, test_name)
        student_test = BoatingTest.all.find do |test| 
            test.student == student && test.test_name == test_name
        end
        if student_test
            student_test.test_status = "failed"
        else 
            BoatingTest.new(student,test_name,"failed", self)
        end 
    end



end
