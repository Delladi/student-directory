def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    #create an emptry array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not empty, repeat this code
    while !name.empty? do
        # prompt for additional information
        puts "Please enter the student's cohort:"
        cohort = gets.chomp.to_sym
        
        puts "Please enter the student's hobbies:"
        hobbies = gets.chomp
        
        puts "Please enter the student's country of birth:"
        country_of_birth = gets.chomp
        
        puts "Please enter the student's height in cm:"
        height = gets.chomp
        
        #add the student hash to the array
        students << {
          name: name,
          cohort: cohort,
          hobbies: hobbies,
          country_of_birth: country_of_birth,
          height: height
        }
        puts "Now we have #{students.count} students"
        #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end 

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    puts "   Hobbies: #{student[:hobbies]}"
    puts "   Country of Birth: #{student[:country_of_birth]}"
    puts "   Height: #{student[:height]}cm"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)