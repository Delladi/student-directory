def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete_suffix("\n")
  # while the name is not empty, repeat this code
  while !name.empty? do
    # Prompt the user for additional student information
    puts "Please enter the student's cohort:"
    cohort = gets.delete_suffix("\n").to_sym

    puts "Please enter the student's hobbies:"
    hobbies = gets.delete_suffix("\n")

    puts "Please enter the student's country of birth:"
    country = gets.delete_suffix("\n")

    puts "Please enter the student's height (in cm):"
    height = gets.delete_suffix("\n").to_i

    # Create a new student hash and add it to the array
    students << {
      name: name,
      cohort: cohort,
      hobbies: hobbies,
      country: country,
      height: height
    }
    if students.count == 1
      puts "Now we have 1 student"
    else
      puts "Now we have #{students.count} students"
    end
    # get another name from the user
    name = gets.delete_suffix("\n")
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  cohorts = students.map { |student| student[:cohort] }.uniq
  cohorts.each do |cohort|
    puts "#{cohort.capitalize} cohort".center(50)
    students.each_with_index do |student, index|
      if student[:cohort] == cohort
        puts "#{index + 1}. #{student[:name]}, #{student[:hobbies]}, #{student[:country]}, #{student[:height]}cm".center(50)
      end
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student".center(50)
  else
    puts "Overall, we have #{students.count} great students".center(50)
  end
end

students = input_students
print_header
print(students)
print_footer(students)