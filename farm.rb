require_relative 'field'

class Farm

  def initialize(name)
    puts "Welcome to #{name}'s farm"
  end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new field'
    puts '[2] Harvest crops'
    puts '[3] Description of fields'
    puts '[4] Display farm infromation'
    puts '[5] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_field
    when 2 then harvest
    when 3 then description
    when 4 then display_all_fields
    when 5 then exit
    end
  end

  def add_new_field
  print 'corn or wheat field? '
  field_type = gets.chomp

  print 'How many hectares? '
  field_size = gets.chomp.to_i

  field = Field.create(
    field_type: field_type ,
    field_size: field_size
  )
  end

  def harvest

    # Field.where(:field_type => 'wheat').inspect
    # Field.where(:field_type => 'corn').inspect
    @corn_total = 0
    @wheat_total = 0
    Field.find_each do |field|
      case field.field_type
      when 'corn' then @corn_total += field.field_size
      when 'wheat' then @wheat_total += field.field_size
      end
    end
    puts "Corn total is #{@corn_total}"
    puts "What total is #{@wheat_total}"
  end

  def display_all_fields
    puts Field.all.inspect
  end
  def description
    puts "Look at all these beautiful fields.. \n .."
  end

end


new_farm = Farm.new("Ari")

new_farm.main_menu


at_exit do
  ActiveRecord::Base.connection.close
end
