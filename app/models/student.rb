class Student
    attr_reader :first_name

    @@all = []

    def initialize(first_name)
        @first_name = first_name

        @@all << self
    end

    def add_boating_test(test_name, status, instructor)
        BoatingTest.new(self, test_name, status, instructor)
    end

    def tests
        BoatingTest.all.select {|test| test.student == self}
    end

    def all_instructors
        self.tests.map {|test| test.instructor}.uniq
    end

    def grade_percentage
        (self.tests.count {|test| test.status == "passed"}.to_f / self.tests.length * 100.00).round(2)
    end

    def self.find_student(first_name)
        self.all.find {|student| student.first_name == first_name}
    end

    def self.all
        @@all
    end

end
