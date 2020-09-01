class Instructor

    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def all_tests 
        BoatingTest.all.select {|test| test.instructor == self}
    end

    def passed_students
        self.all_tests.select {|test| test.test_status == "passed"}.map {|test| test.student}.uniq
    end

    def pass_student(student, test_name)
        target_test = BoatingTest.all.find {|test| test.student == student && test.test_name == test_name}
        if target_test
            target_test.test_status = "passed"
        else
            BoatingTest.new(student, test_name, "passed", self)
        end
    end

    def fail_student(student, test_name)
        target_test = BoatingTest.all.find {|test| test.student == student && test.test_name == test_name}
        if target_test
            target_test.test_status = "failed"
        else
            BoatingTest.new(student, test_name, "failed", self)
        end
    end

    def self.all
        @@all
    end

    def all_students
        self.all_tests.map {|test| test.student}.uniq
    end
    
end
