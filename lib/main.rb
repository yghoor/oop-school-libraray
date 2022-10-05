#!../../../../bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

class App
  def initialize
    @books = []
    @people = []
  end

  def home_screen_text
    '
Please choose an option by entering a number:
1 - List all books
2 - List all people
3 - Create a person
4 - Create a book
5 - Create a rental
6 - List all rentals for a given person id
7 - Exit'
  end

  def ui_display_books
    @books.each_with_index { |book, i| puts "#{i + 1}) Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def ui_display_people
    @people.each_with_index do |person, i|
      puts "#{i + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def ui_create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '

    person_option = gets.chomp

    loop do
      break if person_option.to_i == 1 || person_option.to_i == 2

      print 'Please enter a valid number (1 or 2): '
      person_option = gets.chomp
    end

    print 'Age: '
    age = gets.chomp.to_i

    print 'Name: '
    name = gets.chomp

    case person_option
    when '1'
      print 'Has parent permission? [Y/N]: '
      permission = gets.chomp

      loop do
        if %w[Y y].include?(permission)
          permission = true
          break
        elsif %w[N n].include?(permission)
          permission = false
          break
        else
          puts 'Please enter a valid character [Y/N]: '
          permission = gets.chomp
        end
      end

      @people.push(Student.new(nil, age, name, permission))
      @people[-1].validate_name
      puts 'Person created successfully'
    when '2'
      print 'Specialization: '
      specialization = gets.chomp

      @people.push(Teacher.new(specialization, age, name))
      @people[-1].validate_name
      puts 'Person created successfully'
    end
  end

  def ui_create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end
end
