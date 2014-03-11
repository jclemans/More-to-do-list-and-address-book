require 'rspec'
require 'contact'

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

  describe '.getnames' do
    it 'displays all of the names saved in the address book' do
      test_contact = Contact.create('spiderman', '555-234-1111', 'spidey@webcrawler.com', 'gotham city')
      Contact.getnames.should eq ['spiderman']
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



# work_phone = Phone.create('503.555.1212', 'work')
# home_phone = Phone.create('999.555.1212', 'home')
# test_email
# test_address
