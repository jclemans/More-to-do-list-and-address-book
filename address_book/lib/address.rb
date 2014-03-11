class Address

  @@addresses = []

  def Address.create(address)
    new_address = Address.new(address)
    @@addresses << new_address
    new_address
  end

  def Address.all
    @@addresses
  end

  def Address.clear
    @@addresses = []
  end

  def initialize(address)
    @address = address
  end

  def display
    @address
  end

  def save
    @@addresses << self
  end

end
