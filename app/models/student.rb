class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name
        @@all << self
    end

    def self.all
        @@all
    end

    #creates new boating test
    def add_boating_test(test_name, test_status, instructor)
        BoatingTest.new(self, test_name, test_status, instructor)
    end

    def boating_tests
        BoatingTest.all.select do |tests|
            tests.student == self
        end
    end

    def all_instructors
        self.boating_tests.collect do |tests|
            tests.instructor
        end
    end

    def self.find_student(name)
        self.all.find do |student|
            student.first_name
        end
    end
    
    def grade_percentage
        # pass = 0
        # self.boating_tests.each do |tests|
        #     if tests.test_status == "passed"
        #         pass += 1
        #     end
        # end
        # (pass.to_f / self.boating_tests.count.to_f) * 100

        pass = self.boating_tests.count do |test|
            test.test_status == 'passed'
        end
        pass.to_f/self.boating_tests.length.to_f * 100
    end
end
