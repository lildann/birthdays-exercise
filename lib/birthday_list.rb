class BirthdayList
  attr_reader :birthdays

  def initialize
    @birthdays = []
  end

  def store_birthday(birthday)
    @birthdays << birthday
  end

  def see_birthdays
    @birthdays.each { |birthday| puts birthday.display }
  end

  def check_birthday
    @birthdays.each { |birthday| puts birthday.message if birthday.today? }
  end
end
