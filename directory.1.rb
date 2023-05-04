def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  # create an empty array
  students = []

  loop do
    # get the name of the student
    puts "Name:"
    name = gets.chomp

    # break the loop if the name is empty
    break if name.empty?

    # get the cohort of the student
    puts "Cohort:"
    cohort = gets.chomp.to_sym

    # set a default cohort if none provided
    cohort = :unknown if cohort.empty?

    # prompt the user for additional student information
    puts "Please enter the student's hobbies:"
    hobbies = gets.chomp

    puts "Please enter the student's country of birth:"
    country = gets.chomp

    puts "Please enter the student's height (in cm):"
    height = gets.chomp.to_i

    # create a new student hash and add it to the array
    students << {
      name: name.strip,
      cohort: cohort,
      hobbies: hobbies.strip,
      country: country.strip,
      height: height
    }

    puts "Now we have #{students.count} students"
  end

  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_students(students)
  # get a list of all existing cohorts
  cohorts = students.map { |student| student[:cohort] }.uniq

  cohorts.each do |cohort|
    puts "#{cohort.to_s.capitalize} cohort:".center(50)

    students.each_with_index do |student, index|
      # print only the students from the current cohort
      if student[:cohort] == cohort
        puts "#{index + 1}. #{student[:name]} (#{student[:height]}cm) - "\
             "#{student[:hobbies]} - #{student[:country]}".center(50)
      end
    end
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

# call the input_students, print_header, print_students, and print_footer methods
students = input_students
print_header
print_students(students)
print_footer(students)