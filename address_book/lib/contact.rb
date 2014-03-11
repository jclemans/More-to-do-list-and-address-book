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

  def Contact.getnames
    names = []
    @@address_book.each do |contact|
      names << contact.name
    end
    names
  end

  def save
    @@address_book << self
  end

  def initialize(name, phone, email, address)
    @phones_array = []
    @name = name
    @phone = phone
    self.phones(@phone)
    @email = email
    @address = address
  end

  def display_info
    [@name, @phone.display, @email.display, @address.display]
  end

  def name
    @name
  end


  def phones(new_phone)
    @phones_array << new_phone
  end

  def phone_array
    @phones_array
  end

    # @phones = []
    # @phones << this_new_phone
    # contact_instance.phones.each { |phone| puts phone.display }

  def email
    @email
  end

  def address
    @address
  end

end
