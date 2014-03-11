require 'rspec'
require 'address_book'
require 'phones'

describe Contact do
  before do
    Contact.clear
  end

  it 'initializes a contact with name, phone, email, and address' do
    test_contact = Contact.new('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
    test_contact.should be_an_instance_of Contact
  end

  it "displays all of a contact's info" do
    test_contact = Contact.new('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
    test_contact.display.should eq ['spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city']
  end

  it 'saves the contact info to the address book' do
    test_contact = Contact.create('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
    Contact.all.should eq [test_contact]
  end

  describe '.names?' do
    it 'displays all of the names saved in the address book' do
      test_contact = Contact.create('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
      Contact.names?.should eq ['spiderman']
    end
  end

  describe '.create' do
    it 'makes a new contact instance' do
      test_contact = Contact.create('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
      test_contact.should be_an_instance_of Contact
    end
  end

  describe '.clear' do
    it 'empties out all of the saved contacts' do
      Contact.new('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city').save
      Contact.clear
      Contact.all.should eq []
    end
  end

  describe '.all' do
    it 'is empty at first' do
      Contact.all.should eq []
    end
  end

end

describe Phone do

  it 'initializes a new phone number object' do
    test_phone = Phone.new('555-666-7777')
    test_phone.should be_an_instance_of Phone
  end

  describe '.create' do
    it 'makes a new phone instance' do
      test_phone = Phone.create('555-666-7777')
      test_phone.should be_an_instance_of Phone
    end
  end
end
