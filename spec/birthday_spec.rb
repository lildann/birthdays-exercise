require 'birthday'
require 'timecop'

describe Birthday do 
  Timecop.freeze(Time.local(2022, 1, 20))
  
  it "#display returns the person's name and birthday" do
    my_birthday = Birthday.new('Lilly', '01/03/1989')
    expect(my_birthday.display).to eq('Lilly: 01/03/1989')
  end

  it "#calculate_age returns the person's age" do
    my_birthday = Birthday.new('Lilly', '01/03/1989')
    expect(my_birthday.calculate_age).to eq(32)
  end

  it "#calculate_age calculates another person's age" do
    their_birthday = Birthday.new('Fred', '18/12/1989')
    expect(their_birthday.calculate_age).to eq(31)
  end

  it "#calculate_age calculates yet another person's age" do
    their_birthday = Birthday.new('Frankie', '18/06/2020')
    expect(their_birthday.calculate_age).to eq(1)
  end
end
