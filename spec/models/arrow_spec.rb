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

      arrow = creator.created_arrows.create!( destination: destination, reason: 'I wanted to create an arrow' )

      saved_arrow = destination.received_arrows.last


      expect(arrow).to eql(saved_arrow)
    end

    it 'deletes the arrows created by a deleted user' do
      creator = User.create!( name: 'Creator to be deleted',
                              email: 'creator_deleted@mail.com',
                              password: '123123',
                              password_confirmation: '123123' )

      destination = User.create!( name: 'Destination',
                                  email: 'destination@mail.com',
                                  password: '123123',
                                  password_confirmation: '123123' )

      arrow = creator.created_arrows.create!( destination: destination, reason: 'I wanted to create an arrow and then delete it' )

      saved_arrow = destination.received_arrows.last
      expect(arrow).to eql(saved_arrow)
      creator.destroy
      saved_arrow = destination.received_arrows.last
      expect(arrow).not_to eql(saved_arrow)
    end

    it 'deletes the arrows received by a deleted user' do
      creator = User.create!( name: 'Creator',
                              email: 'creator@mail.com',
                              password: '123123',
                              password_confirmation: '123123' )

      destination = User.create!( name: 'Destination',
                                  email: 'destination_deleted@mail.com',
                                  password: '123123',
                                  password_confirmation: '123123' )

      arrow = creator.created_arrows.create!( destination: destination, reason: 'I wanted to create an arrow to be deleted' )

      destination.destroy
      expect(arrow).not_to eql(creator.created_arrows.last)
    end
  end
end
