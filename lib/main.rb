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
end
