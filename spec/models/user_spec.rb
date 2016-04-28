require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:meals) }
  it { is_expected.to have_many(:ingredients) }
  it { is_expected.to have_many(:categories) }

  # Set up users
  let(:user) { User.new(first_name: "First", last_name: "Test",
                        email: "test@example.com", password: "password",
                        password_confirmation: "password")}

  let(:user_no_first_name) { User.new(last_name: "Test", email: "test@example.com",
                                      password: "password",
                                      password_confirmation: "password")}

  let(:user_no_last_name) { User.new(first_name: "Test", email: "test@example.com",
                                     password: "password",
                                     password_confirmation: "password")}

  let(:user_no_email) { User.new(first_name: "First", last_name: "Test",
                                 password: "password",
                                 password_confirmation: "password")}

  describe 'validations' do
    context 'will raise an error' do

      it 'when the first name field is empty' do
        user_no_first_name.save
        expect(user_no_first_name.errors[:first_name]).to include("can't be blank")
      end

      it 'when the last name field is empty' do
        user_no_last_name.save
        expect(user_no_last_name.errors[:last_name]).to include("can't be blank")
      end

      it 'when the email field is empty' do
        user_no_email.save
        expect(user_no_email.errors[:email]).to include("can't be blank")
      end
    end

    it 'saves the User when the fields are not blank' do
      expect{user.save}.to change{User.count}.by(1)
    end
  end
end
