class List

  def initialize(description)
    @tasks = []
    @description = description
  end

  def description
    @description
  end

  def add_task (task_to_add)
    @tasks << task_to_add
  end

  def show_tasks
    @tasks
  end
end
