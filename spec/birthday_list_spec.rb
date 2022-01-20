require 'birthday_list'
require 'timecop'

describe BirthdayList do
  let(:birthday_list) { BirthdayList.new }
  let(:my_birthday) { double('my fake birthday') }
  let(:your_birthday) { double('your fake birthday') }

  it '#see_birthdays returns each birthday formatted on a line' do
    allow(my_birthday).to receive_messages(display: 'Lilly: 01/03/1989')
    allow(your_birthday).to receive_messages(display: 'Fred: 23/05/1989')
    birthday_list.store_birthday(my_birthday)
    birthday_list.store_birthday(your_birthday)
    expect { birthday_list.see_birthdays }.to output("Lilly: 01/03/1989\nFred: 23/05/1989\n").to_stdout
  end

  it '#check_birthday returns a message if a birthday is today' do
    Timecop.freeze(Time.local(2021, 03, 01))
    allow(my_birthday).to receive_messages(today?: true, message: "It's Lilly's birthday today! They are 32 years old!")
    allow(your_birthday).to receive_messages(today?: false)
    birthday_list.store_birthday(my_birthday)
    birthday_list.store_birthday(your_birthday)
    expect { birthday_list.check_birthday }.to output("It's Lilly's birthday today! They are 32 years old!\n").to_stdout
  end

  it "#check_birthday returns a message if another person's birthday is today" do
    Timecop.freeze(Time.local(2021, 05, 23))
    allow(your_birthday).to receive_messages(today?: true, message: "It's Cat's birthday today! They are 25 years old!")
    birthday_list.store_birthday(your_birthday)
    expect { birthday_list.check_birthday }.to output("It's Cat's birthday today! They are 25 years old!\n").to_stdout
  end

  it '#check_birthday returns nothing if birthday not today' do
    Timecop.freeze(Time.local(2021, 11, 17))
    allow(my_birthday).to receive_messages(today?: false)
    birthday_list.store_birthday(my_birthday)
    expect { birthday_list.check_birthday }.not_to output(my_birthday).to_stdout
  end
end
