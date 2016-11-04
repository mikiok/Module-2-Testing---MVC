class Task
    attr_reader :content, :id, :created_at
    @@current_id = 1
    def initialize(content, completed = false)
        @content = content
        @completed = completed
        @created_at = Time.now
        @updated_at = nil
        @id = @@current_id
        @@current_id += 1
    end

    def completed?
    	@completed
    end

    def complete!
    	@completed = true
    end

    def make_incomplete!
    	@completed = false
    end

    def update_content!(content)
    	@content = content
    	@updated_at = Time.now
    end
end

task = Task.new("Buy the milk")
puts task.id

task2 = Task.new("Wash the car")
puts task2.id
