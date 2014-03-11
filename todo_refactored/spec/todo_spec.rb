require 'rspec'
require 'task'
require 'list'

describe Task do
  before do
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new('wash the cat')
    test_task.should be_an_instance_of Task
  end

  it 'displays the description' do
    test_task = Task.new('bandage wounds from cat bath')
    test_task.description.should eq 'bandage wounds from cat bath'
  end

  describe '.create' do
    it 'makes a new instance of Task' do
      test_task = Task.create('clean the pool')
      test_task.should be_an_instance_of Task
    end

    it 'saves the Task' do
      test_task = Task.create('build a treefort')
      Task.all.should eq [test_task]
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Task.all.should eq []
    end
  end

  describe '.clear' do
    it 'empties out all of the saved tasks' do
      Task.new('leap tall buildings').save
      Task.clear
      Task.all.should eq []
    end
  end

  describe '#save' do
    it 'adds a task to the array of saved tasks' do
      test_task = Task.new('ride a unicorn')
      test_task.save
      Task.all.should eq [test_task]
    end
  end
end

describe List do
  it 'is initialized with a description' do
    test_list = List.new('groceries')
    test_list.should be_an_instance_of List
  end

  it 'displays the description of the list' do
    test_list = List.new('groceries')
    test_list.description.should eq 'groceries'
  end
end
