require 'birthday_list'
require 'birthday'
require 'timecop'

describe 'Birthdays feature test' do
  let(:harry_birthday) { Birthday.new('Harry Potter', '01/03/1987') }
  let(:hermione_birthday) { Birthday.new('Hermione Granger', '12/12/1988') }
  let(:ron_birthday) { Birthday.new('Ron Weasley', '04/04/1987') }
  let(:birthday_list) { BirthdayList.new }

  it '#see_birthdays should work as a program' do 
    birthday_list.store_birthday(harry_birthday)
    birthday_list.store_birthday(hermione_birthday)
    birthday_list.store_birthday(ron_birthday)
    expect { birthday_list.see_birthdays }.to output("Harry Potter: 01/03/1987\nHermione Granger: 12/12/1988\nRon Weasley: 04/04/1987\n").to_stdout
  end

  it '#check_birthdays should work as a program' do
    Timecop.freeze(Time.local(2021, 3, 1))
    birthday_list.store_birthday(harry_birthday)
    birthday_list.store_birthday(hermione_birthday)
    birthday_list.store_birthday(ron_birthday)
    expect { birthday_list.check_birthday }.to output("It's Harry Potter's birthday today! They are 34 years old!\n").to_stdout 
  end
end



