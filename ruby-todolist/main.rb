require_relative 'classes/todo_list'

# Display main menu options
def display_menu
  puts "\n-----------------------"
  puts "ToDo-Listen-Manager"
  puts "1. Aufgabe hinzufügen"
  puts "2. Aufgabe bearbeiten"
  puts "3. Aufgabe löschen"
  puts "4. Aufgabe als erledigt markieren"
  puts "5. Aufgaben filtern"
  puts "6. Alle Aufgaben anzeigen"
  puts "7. Programm beenden"
  puts "-----------------------"
  print "Option wählen: "
end

# Create a new ToDo List
todo_list = TodoList.new

# Main program loop
loop do
  display_menu
  option = gets.chomp

  case option
    
  # Add Task  
  when "1"
    puts "\nNeue Aufgabe hinzufügen:"
    print "Titel: "; title = gets.chomp
    print "Beschreibung: "; description = gets.chomp
    print "Fälligkeitsdatum (YYYY-MM-DD): "; due_date = gets.chomp
    item = TodoItem.new(title, description, due_date)
    todo_list.add_item(item)
    puts "Aufgabe hinzugefügt."
  
  # Edit Task
  when "2"
    puts "\nAufgabe bearbeiten:"
    todo_list.print_list
    print "Nummer der Aufgabe zum Bearbeiten: "; index = gets.chomp.to_i - 1
    if index < 0 || index >= todo_list.size
      puts "Ungültige Nummer."
      next
    end
    print "Neuer Titel (Enter überspringt): "; new_title = gets.chomp
    new_title = nil if new_title.strip.empty?
    print "Neue Beschreibung (Enter überspringt): "; new_description = gets.chomp
    new_description = nil if new_description.strip.empty?
    print "Neues Fälligkeitsdatum (Enter überspringt): "; new_due_date = gets.chomp
    new_due_date = nil if new_due_date.strip.empty?
    todo_list.edit_item(index, new_title: new_title, new_description: new_description, new_due_date: new_due_date)
    puts "Aufgabe bearbeitet."

  # Delete Task  
  when "3"
    puts "\nAufgabe löschen:"
    todo_list.print_list
    print "Nummer der Aufgabe zum Löschen: "; index = gets.chomp.to_i - 1
    if index < 0 || index >= todo_list.size
      puts "Ungültige Nummer."
      next
    end
    todo_list.remove_item(index)
    puts "Aufgabe gelöscht."
  
  # Mark Task as Done  
  when "4"
    puts "\nAufgabe als erledigt markieren:"
    todo_list.print_list
    print "Nummer der Aufgabe zum Erledigen: "; index = gets.chomp.to_i - 1
    todo_list.mark_item_done(index)

  # Filter Tasks  
  when "5"
    puts "\nAufgaben filtern nach Status (open/done): "; status = gets.chomp.to_sym
    filtered = todo_list.filter_by_status(status)
    if filtered.empty?
      puts "Keine Aufgaben gefunden."
    else
      filtered.each_with_index {|item, i| puts "Aufgabe #{i+1}:\n#{item}\n---"}
    end

  # Show All Tasks
  when "6"
    todo_list.print_list
  
  # Exit  
  when "7"
    puts "Programm beendet."
    break

  else
    puts "Ungültige Option. Bitte erneut wählen."
  end
end