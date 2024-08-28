require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject { User.new(email: 'test@example.com', first_name: 'John', last_name: 'Doe', password: 'Password1!', password_confirmation: 'Password1!') }

    # Presence validations
    it { should validate_presence_of(:first_name).with_message("First Name can't be blank") }
    it { should validate_presence_of(:last_name).with_message("Last Name can't be blank") }

    # Password complexity validations
    it 'is valid with a valid password' do
      subject.password = 'Password1!'
      expect(subject).to be_valid
    end

    it 'is invalid without an uppercase letter in the password' do
      subject.password = 'password1!'
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character')
    end

    it 'is invalid without a lowercase letter in the password' do
      subject.password = 'PASSWORD1!'
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character')
    end

    it 'is invalid without a number in the password' do
      subject.password = 'Password!'
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character')
    end

    it 'is invalid without a special character in the password' do
      subject.password = 'Password1'
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character')
    end

    it 'is invalid with a password shorter than 8 characters' do
      subject.password = 'Pass1!'
      expect(subject).not_to be_valid
      expect(subject.errors[:password]).to include('must include at least 8 characters, including one uppercase letter, one lowercase letter, one number, and one special character')
    end
  end
end
