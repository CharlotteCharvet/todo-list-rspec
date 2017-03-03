require "rspec"

require_relative "list"
require_relative "task"

describe List do
  # Your specs here
  let(:task)  { Task.new("abcd1234") }
  let(:title) { "a giraffe on a tree" }
  let(:tasks) { [task,Task.new("567"),Task.new("985")] }
  let(:list)  { List.new(title, tasks) }

describe "#initialize" do
  it "requires 2 arguments" do
    expect{List.new}.to raise_error(ArgumentError)
  end

  it "should contain at least one title and one array of task" do
    expect(List.new("a giraffe on a tree",["abcd1234"])).to be_a_kind_of(List)
  end
end 



describe "#add_task" do
  it "requires an argument" do
    expect{Task.new}.to raise_error(ArgumentError)
  end

  it "requires a task to be included into tasks" do
    expect{list.add_task(0)}.to change{list.tasks.count}.by(+1) 
  end
end


describe "#complete_task" do

  it "check if the task[index] is valid" do
      expect(list.tasks[0]).to eq task
  end

  it "should return false if tasks is empty " do
      expect(list.tasks[0]).not_to eq(nil)
  end


  it "returns true for completed tasks" do
      expect(task.complete!).to be(true)
  end
end


describe "#delete_task" do
  it "check if the task[index] is valid" do
      expect(list.tasks[0]).to eq task
  end

  it "returns true for deleted tasks" do
      expect{list.delete_task(0)}.to change{list.tasks.count}.by(-1) 
  end
end


describe "#completed_tasks" do
  it "show list of completed tasks from task array" do
          list.tasks[0].complete!
          list.tasks[1].complete!
          expect(list.completed_tasks).to eq([list.tasks[0],list.tasks[1]])
      end
  end

  describe "#incomplete_tasks" do
  it "shows list of incomplete tasks from task_array" do
          list.tasks[0].complete!
          list.tasks[1].complete!
          expect(list.incomplete_tasks).to eq([list.tasks[2]])
      end
  end



end