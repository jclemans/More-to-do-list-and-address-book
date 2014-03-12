class Phone

  @@phones = []

  def Phone.create(phone_number)
    new_phone = Phone.new(phone_number)
    @@phones << new_phone
    new_phone
  end

  def Phone.all
    @@phones
  end

  def Phone.clear
    @@phones = []
  end

  def initialize(number)
    @phone = number
  end

  def display
    @phone
  end

  def edit(new_phone)
    @phone = new_phone
  end

  def save
    @@phones << self
  end

end
