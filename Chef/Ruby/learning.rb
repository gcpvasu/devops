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

technologies = %w(Mobile Trending Geek)

technologies.each do |tech|
    puts(tech)
end


# hash
# it is list of key and values
Residence = {
    'name' => 'Dernierstuff',
    'technologies' => %w(Mobile Trending Geek),
    'address' => {
        'building' => '234, Lakshmi sai nagar',
        'landmark' => 'near Ravindra Bharti School',
        'city' => 'palakol'
    },
}

puts(Residence['name'])
puts(Residence['address']['landmark'])