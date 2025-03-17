class TodoItem
  # Getter/Setter for attributes: title, description, due date, status
  attr_accessor :title, :description, :due_date, :status
  
  # Constructor to initialize a new ToDo Task with provided details
  def initialize(title, description, due_date, status=:open)
    @title = title
    @description = description
    @due_date = due_date
    @status = status
  end
  
  # Marks the task as completed
  def mark_as_done
    @status = :done
  end
  
  # Returns a readable string representation of the task (used for printing)
  def to_s
    "Titel: #{@title}\nBeschreibung: #{@description}\nFälligkeitsdatum: #{@due_date}\nStatus: #{@status}"
  end
end
