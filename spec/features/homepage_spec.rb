
describe App do

  feature 'birthday input homepage' do
    scenario 'Can run app and check page content' do
      visit('/')
      expect(page).to have_content 'Birthdays are great!'
    end
  end

  feature 'user can enter their name and birthday' do
    scenario 'they enter their DOB and birthday is NOT today' do
      visit_enter_info
      expect(page).to have_content("days until your birthday!")
    end

    scenario 'they enter their DOB and bithday IS today' do
      allow(Date).to receive(:today).and_return Date.new(2018,9,30)
      visit_enter_info
      expect(page).to have_content("Happy birthday Bob!")
    end
  end

end
