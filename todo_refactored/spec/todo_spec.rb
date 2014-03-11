require 'rspec'
require 'task'
require 'list'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new('wash the cat')
    test_task.should be_an_instance_of Task
  end

  it 'displays the description' do
    test_task = Task.new('bandage wounds from cat bath')
    test_task.description.should eq 'bandage wounds from cat bath'
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
