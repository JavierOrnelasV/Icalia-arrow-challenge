require 'capybara/rails'

RSpec.feature "Arrows", type: :feature do
  context 'create new arrow' do
    let (:creator) {FactoryBot.create(:user)}
    let (:destination) {FactoryBot.create(:user)}

    it "should be succesful if there's a user" do

      login(creator)
      send_arrow(destination.name, 'New Arrow')

      expect(Arrow.last.reason).to eql('New Arrow')
    end

    it "shouldn't be succesful if there isn't a user" do

      login(creator)
      send_arrow('New Arrow')
      
      expect(page).to have_content('Invalid arrow')
    end
  end

  context 'receive an arrow' do
    let (:creator) {FactoryBot.create(:user)}
    let (:destination) {FactoryBot.create(:user)}
    it "should be able to view one single arrow" do

      login(creator)
      send_arrow(destination.name, 'Next Arrow')
      click_on('Sign Out')
      login(destination)
      visit arrows_path
      click_on('See arrow')

      expect(page).to have_content('Next Arrow')
    end
  end

  def login(user)
    visit new_user_session_path
    within('form') do
      fill_in "Email", with: user.email
      fill_in "Password", with: "12345678"
      click_on('Log in')
    end
  end

  def send_arrow(receiver = '', reason)
    visit new_arrow_path
    within('form') do
      fill_in "auto-complete", with: receiver
      fill_in "Reason", with: reason
      click_on('Send arrow')
    end
  end
end
