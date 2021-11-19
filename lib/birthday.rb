class Birthday
  attr_accessor :name, :date

  def initialize(name, date)
    @name = name
    @date = date
  end

  def display
    "#{@name}: #{@date}"
  end

  def calculate_age
    age = today.year - dob_year
    age -= 1 if today.month < dob_month || (today.month == dob_month && today.day < dob_day)
    age
  end

  def today?
    today.day == dob_day && today.month == dob_month
  end

  def message
    "It's #{@name}'s birthday today! They are #{calculate_age} years old!" if today?
  end

  private

  def today
    Time.now
  end

  def dob_day
    @date.split('/')[0].to_i
  end

  def dob_month
    @date.split('/')[1].to_i
  end

  def dob_year
    @date.split('/')[2].to_i
  end
end
