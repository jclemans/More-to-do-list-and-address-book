require 'rspec'
require 'phones'

describe Phone do
  before do
    Phone.clear
  end

  it 'initializes a new phone number object' do
    test_phone = Phone.new('555-666-7777')
    test_phone.should be_an_instance_of Phone
  end

  describe '.create' do
    it 'makes a new phone instance' do
      test_phone = Phone.create('555-666-7777')
      test_phone.should be_an_instance_of Phone
    end

    it 'makes multiple phone instances' do
      work_phone = Phone.create('503.555.1212')
      home_phone = Phone.create('999.555.1212')
      Phone.all.should eq [work_phone, home_phone]
    end
  end

  describe '.clear' do
    it 'clears the phones array' do
      test_phone = Phone.create('555-666-9874')
      Phone.clear
      Phone.all.should eq []
    end
  end

  describe '.all' do
    it 'is is empty at first' do
      Phone.all.should eq []
    end
  end

end
