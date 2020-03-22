require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'User model' do
    it 'creates a user' do
      user = User.create!(  name: 'User',
                            email: 'example_user@mail.com',
                            password: '123456',
                            password_confirmation: '123456' )

      saved_user = User.find_by(email: 'example_user@mail.com')

      expect(user).to eql(saved_user)
    end

    it 'downcases the user email' do
      user = User.create!(  name: 'User',
                            email: 'UPCASE_EMAIL@EXAMPLE.COM',
                            password: '123456',
                            password_confirmation: '123456' )

      expect(user.email).to eql('UPCASE_EMAIL@EXAMPLE.COM'.downcase)
    end

    it 'fails at creating a user when password is too short' do
      user = User.new(  name: 'User',
                        email: 'too_short@password.com',
                        password: '1234',
                        password_confirmation: '1234' )

      expect(user.save).to eql(false)
    end
  end
end
