number = 10

if number < 10
    puts('number is less than 10')
else
    puts('number is greater than or equal to 10')
end

# Boolean value

is_correct = true
is_correct = false


# array
colors = ['red','green','blue']

colors.each do |color|
    puts(color)
end

# white space arrays
courses = %w(Devops Aws Azure GCP)

courses.each do |course|
    puts(course)
end
