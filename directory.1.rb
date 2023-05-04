def input_students
    puts "Please enter the name and cohort of each student, separated by a comma."
    puts "To finish, just hit return twice"
    #create an emptry array
    students = []
    loop do
      input = gets.chomp
      break if input.empty?
      
      # Split the input into name and cohort using comma as the delimiter
      name, cohort = input.split(",")
      
      # Convert cohort string to symbol
      cohort = cohort.strip.downcase.to_sym unless cohort.nil?
      
      # If cohort is empty or invalid, set a default value of :unknown
      cohort = :unknown if cohort.nil? || ![:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december].include?(cohort)
      
      # Prompt the user for additional student information
      puts "Please enter the student's hobbies:"
      hobbies = gets.chomp
      
      puts "Please enter the student's country of birth:"
      country_of_birth = gets.chomp
      
      puts "Please enter the student's height in cm:"
      height = gets.chomp
      
      #add the student hash to the array
      students << {
        name: name.strip,
        cohort: cohort,
        hobbies: hobbies.strip,
        country_of_birth: country_of_birth.strip,
        height: height
      }
      puts "Now we have #{students.count} students"
  end
  #return the array of students
  students
end 

def print_header
puts "The students of Villains Academy".center(50)
puts "-------------".center(50)
end

def print(students)
students.each_with_index do |student, index|
  puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  puts "   Hobbies: #{student[:hobbies]}".center(50)
  puts "   Country of Birth: #{student[:country_of_birth]}".center(50)
  puts "   Height: #{student[:height]}cm".center(50)
end
end

def print_footer(students)
puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)