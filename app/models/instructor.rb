class Instructor
    @@all = []
    
    def initialize(name)
        @name = name

        @@all << self
    end

    def tests
        BoatingTest.all.select {|test| test.instructor == self}
    end

    def passed_students
        passed_tests = self.tests.select {|test| test.status == "passed"}
        passed_tests.map {|test| test.student}.uniq
    end
    
    def pass_student(student, test_name)
        pass_or_fail(find_test_or_create(student, test_name), "passed")
    end

    def fail_student(student, test_name)
        pass_or_fail(find_test_or_create(student, test_name), "failed")
    end

    def find_test_or_create(student, test_name)
        found_test = self.tests.find {|test| test.student == student && test.test_name == test_name}
        if found_test
            found_test
        else
            BoatingTest.new(student, test_name, "pending", self)
        end
    end
    
    def pass_or_fail(test, status)
        test.status = status
        test
    end

    def all_students
        self.tests.map{|test| test.student}.uniq
    end
end
