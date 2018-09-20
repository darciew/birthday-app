feature 'birthday input homepage' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Birthdays are great! When is yours?'
  end
end
