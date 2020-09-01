class Student

    attr_reader :first_name

    @@all = []

    def initialize (first_name)
        @first_name = first_name
        @@all << self
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

    def grade_percentage
        passed_tests = self.tests.count {|test| test.test_status == "passed"}
        passed_tests.to_f / self.tests.count.to_f * 100
    end

    def self.all
        @@all 
    end

    def self.find_student(name)
        self.all.find {|student| student.first_name == name}
    end
end
