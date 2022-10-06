#!../../../../bin/env ruby
require_relative './person'
require_relative './student'
require_relative './teacher'
require_relative './book'
require_relative './rental'

# rubocop:disable Metrics/ClassLength
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
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

  # rubocop:disable Metrics/MethodLength
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
  # rubocop:enable Metrics/MethodLength

  def ui_create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @books.push(Book.new(title, author))
    puts 'Book created successfully'
  end

  def rental_choice_corrector(choice, array)
    loop do
      return choice - 1 unless choice < 1 || choice > array.length

      # subtract 1 from choice because UI list display numbers start from 1
      print 'Please enter a valid list number: '
      choice = gets.chomp.to_i
    end
  end

  def permissions?(person)
    return false unless person.can_use_services?

    true
  end

  def ui_create_rental
    if @books.empty?
      puts 'No books available'
      return
    end

    puts 'Select a book from the following list by number'
    ui_display_books
    book_choice = gets.chomp.to_i

    book_choice = rental_choice_corrector(book_choice, @books)

    puts 'Select a person from the following list by number (not id)'
    ui_display_people
    person_choice = gets.chomp.to_i

    person_choice = rental_choice_corrector(person_choice, @people)
    unless permissions?(@people[person_choice])
      puts 'Student does not have permission'
      return
    end

    print 'Date: '
    date = gets.chomp

    @rentals.push(Rental.new(date, @people[person_choice], @books[book_choice]))
    puts 'Rental created successfully'
  end

  def ui_display_rentals(id)
    @rentals.each do |rental|
      next unless rental.person.id == id

      puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end

  def ui_rentals_with_id
    puts 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '
    ui_display_rentals(id)
  end

  # rubocop:disable Metrics/MethodLength
  def run
    puts 'Welcome to  School Library App!'
    # rubocop:disable Metrics/BlockLength
    loop do
      puts home_screen_text

      menu_option = gets.chomp

      case menu_option
      when '1'
        ui_display_books

        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '2'
        ui_display_people

        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '3'
        ui_create_person
        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '4'
        ui_create_book

        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '5'
        ui_create_rental

        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '6'
        ui_rentals_with_id

        puts "\n\nPress the Enter key to continue"
        gets.chomp
      when '7'
        puts 'Thank you for using this app!'
        return
      else
        puts 'Please enter a valid list option'
      end
    end
    # rubocop:enable Metrics/BlockLength
  end
  # rubocop:enable Metrics/MethodLength
end

# rubocop:enable Metrics/ClassLength,

def main
  app = App.new
  app.run
end

main
