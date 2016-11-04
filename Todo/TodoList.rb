require_relative "Task"

class TodoList
    attr_reader :tasks
    def initialize user
    	@user = user
        @tasks = []
    end

    def add_task(task)
    	@tasks.push(task)
    end

    def delete_task(taskToDelete)
    	@tasks.delete_if {|task| task.id == taskToDelete}
    end

    def find_task_by_id(taskToFind)
    	@tasks.find {|task| task.id == taskToFind}
    end

    def sort_by_created
    	@tasks.sort_by {|task| task.created_at}
    end
end