class Email

  @@email_addresses = []

  def Email.create(email_address)
    new_email_address = Email.new(email_address)
    @@email_addresses << new_email_address
    new_email_address
  end

  def Email.all
    @@email_addresses
  end

  def Email.clear
    @@email_addresses = []
  end

  def initialize(email_address)
    @email_address = email_address
  end

  def display
    @email_address
  end

  def save
    @@email_addresses << self
  end

end
