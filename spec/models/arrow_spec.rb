require 'rails_helper'

RSpec.describe Arrow, type: :model do
  describe 'Arrow model' do
    it 'creates an arrow and saves its users' do
      creator = User.create!( name: 'Creator',
                              email: 'example_creator@mail.com',
                              password: '123456',
                              password_confirmation: '123456' )

      destination = User.create!( name: 'Destination',
                                  email: 'example_destination@mail.com',
                                  password: '123456',
                                  password_confirmation: '123456' )

      arrow = creator.arrows.create!( destination_id: destination.id, reason: 'I wanted to create an arrow' )

      saved_arrow = Arrow.find_by(reason: 'I wanted to create an arrow')

      expect(arrow).to eql(saved_arrow)
    end
  end
end
