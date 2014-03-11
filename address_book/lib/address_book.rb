class Contact
  @@address_book = []

  def Contact.clear
    @@address_book = []
  end

  def Contact.create(name, phone, email, address)
    new_contact = Contact.new(name, phone, email, address)
    @@address_book << new_contact
    new_contact
  end

  def Contact.all
    @@address_book
  end

  def Contact.names?
    names = []
    @@address_book.each do |contact|
      names << contact.name
    end
    names
  end

  def Contact.info?
    info = []
    @@address_book.each do |contact|
      info << contact.display
    end
    info
  end

  def save
    @@address_book << self
  end

  def initialize(name, phone, email, address)
    @name = name
    @phone = phone
    @email = email
    @address = address
  end

  def display
    [@name, @phone, @email, @address]
  end

  def name
    @name
  end
end
