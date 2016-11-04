require_relative '../Task'
require_relative '../TodoList'
require 'spec_helper'

describe :Task do
	before :each do
		@task = Task.new("Cut the grass tomorrow")
	end

	describe "#completed?" do
		it "By default should returns false" do
			expect(@task.completed?()).to be false
		end
	end

	describe "#complete!" do
		it "Change the status of the task to true" do
			expect(@task.complete!()).to be true
		end
	end

	describe "#make_incomplete!" do
		it "Change the status of the task to false" do
			expect(@task.make_incomplete!()).to be false
		end
	end

	describe "#update_content!" do
		it "Should return the content of the current task" do
			@task.update_content!("")
			expect(@task.content).to eq("")
		end

		it "Should return the date of the current task" do
			expect((@task.update_content!("")).sec).to eq(Time.now.sec)
		end
	end
end

describe :TodoList do
	before :each do
		@todoList = TodoList.new("Miguel")
		@task1 = Task.new("Buy some bananas")
	end

	describe "#add_task" do
		it "Should return the tasks including the last" do
			expect((@todoList.add_task(@task1)).size).to eq(1)

		end
	end

	describe "#delete_task" do
		it "Should return the tasks except the one I switch" do
			@todoList.add_task(@task1)
			expect((@todoList.delete_task(@task1.id)).size).to eq(0)
		end
	end

	describe "#find_task_by_id" do
		it "Should return nil" do
			expect(@todoList.find_task_by_id(@task1.id)).to eq(nil)
		end

		it "Should return the task" do
			@todoList.add_task(@task1)
			expect(@todoList.find_task_by_id(@task1.id)).to eq(@task1)
		end
	end

	describe "#sort_by_created" do
		it "Should return an empty array" do
			expect(@todoList.sort_by_created).to eq([])
		end

		 it "Should return the tasks ordered by date" do
		 	task2 = Task.new("Drink some beers")
		 	@todoList.add_task(task2)
		 	@todoList.add_task(@task1)
		 	expect(@todoList.sort_by_created).to eq([@task1,task2])
		 end
	end
end