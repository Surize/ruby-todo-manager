# Import the TodoItem class
require_relative 'todo_item'


class TodoList
  # Initializes an empty TodoList 
  def initialize
    @items = []
  end
  # Adds a new TodoItem to the list
  def add_item(item)
    @items << item
  end
  
  # Edits attributes of a TodoItem by index (title, description, due date, status)
  def edit_item(index, new_title: nil, new_description: nil, new_due_date: nil, new_status: nil)
    item = @items[index]
    item.title = new_title if new_title
    item.description = new_description if new_description
    item.due_date = new_due_date if new_due_date
    item.status = new_status if new_status
  end
  
  # Removes a TodoItem from the list by index
  def remove_item(index)
    @items.delete_at(index)
  end

  # Marks a TodoItem as done by index
  def mark_item_done(index)
    if index >= 0 && index < @items.size
      @items[index].mark_as_done
    else
      puts "Ungültiger Index."
    end
  end
  
  # Filters TodoItems by their status (e.g., :open or :done)
  def filter_by_status(status)
    @items.select { |item| item.status == status }
  end
 
  # Filters TodoItems by due date
  def filter_by_due_date(due_date)
    @items.select { |item| item.due_date == due_date }
  end
  
  # Prints all TodoItems in a readable format
  def print_list
    if @items.empty?
      puts "Keine Aufgaben vorhanden."
    else
      @items.each_with_index do |item, index|
        puts "Aufgabe #{index + 1}:"
        puts item
        puts "----------------------"
      end
    end
  end
  
  # Returns the number of TodoItems
  def size
    @items.size
  end
  
  # Provides access to the TodoItems array
  def items
    @items
  end
end
