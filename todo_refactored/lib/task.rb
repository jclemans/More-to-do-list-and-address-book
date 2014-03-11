class Task
  @@all_tasks = []

  def Task.clear
    @@all_tasks = []
  end

  def Task.create(description)
    new_task = Task.new(description)
    @@all_tasks << new_task
    new_task

  end

  def Task.all
    @@all_tasks
  end

  def save
    @@all_tasks << self
  end

  def initialize(description)
    @description = description
  end

  def description
    @description
  end
end
