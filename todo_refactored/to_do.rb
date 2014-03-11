require './lib/task'
require './lib/list'

@lists = []
@current_list

def list_menu
  puts "Press 'C' to create a new list, 'V' to view all your lists."
  puts "'D' to delete a list. 'S' to select a list to edit. Press 'X' to exit."

  main_choice = gets.upcase.chomp
  if main_choice == 'C'
    add_list
  elsif main_choice == 'V'
    view_lists
  elsif main_choice == 'D'
    remove_lists
  elsif main_choice == 'S'
    edit_list
  elsif main_choice == 'X'
    puts "Exiting To-Do manager. See you later!"
  else
    puts "Invalid entry, please try again."
    list_menu
  end
end

def add_list
  puts "Enter a new list description:"
  user_description = gets.chomp
  @lists << List.new(user_description)
  puts "Current location: #{user_description} list.\n"
  list_menu
end

def view_lists
  puts "Created lists:"
  @lists.each_with_index do |list, index|
    puts "#{index+1}" + ". #{list.description}"
  end
  puts "\n"
  list_menu
end

def edit_list
  puts "Enter the number of the list you want to edit:"
  edit_choice = gets.chomp.to_i
  @current_list = @lists[edit_choice-1]
  task_menu
end

def remove_lists
  puts "Enter the number for the list you want to remove:"
  remove_choice = gets.chomp.to_i
  @lists.delete_at(remove_choice-1)
  puts "List #{remove_choice} removed."
  list_menu
end

# TASKS

def task_menu
  puts "Press 'A' to add a new task, 'L' to list tasks or 'R' to remove a task."
  puts "Press 'X' to return to the list menu."

  main_choice = gets.upcase.chomp
  if main_choice == 'A'
    add_task
  elsif main_choice == 'L'
    list_tasks
  elsif main_choice == 'R'
    remove_tasks
  elsif main_choice == 'X'
    list_menu
  else
    puts "Invalid entry, please try again."
    task_menu
  end
end

def add_task
  puts "Enter your new task description:"
  user_description = gets.chomp
  task_to_add = Task.new(user_description)
  @current_list.add_task(task_to_add)
  puts "Task added.\n"
  task_menu
end

def list_tasks
  puts "Here are your #{@current_list.description} tasks:"
  @current_list.show_tasks.each_with_index do |task, index|
    puts "#{index+1}" + ". #{task.description}"
  end
  puts "\n"
  task_menu
end

def remove_tasks
  puts "Enter the number for the task to remove:"
  remove_choice = gets.chomp.to_i
  @current_list.show_tasks.delete_at(remove_choice-1)
  puts "Task #{remove_choice} removed."
  task_menu
end

list_menu
