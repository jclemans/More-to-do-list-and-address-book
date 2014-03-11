class Phone

  @@phones = []

  def Phone.create(number)
    new_phone = Phone.new(number)
    @@phones << new_phone
    new_phone
  end


  def initialize(phone_number)
    @phone_number = phone_number
  end

end
