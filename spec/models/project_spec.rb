require 'rails_helper'

RSpec.describe Project do 
  subject      { described_class.new(params) }
  let(:params) { { name: 'ProjectX', user_id: user.id } }
  let(:user)   { User.create(first_name: 'John', last_name: 'Smith', email: 'j@googlemail.com', password_digest: '99xass')}

  describe '.create' do
    context 'valid params' do 
      it 'is valid' do 
        expect{ subject.save }.to change{ Project.count }.by(1)
      end
    end

    context 'name missing' do 
      before do 
        params.delete(:name)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end
  end

  describe 'status' do 
    context 'default' do 
      it 'is in progress' do 
        expect(subject).to be_in_progress
      end
    end

    context 'completed' do 
      it 'is completed' do 
        subject.completed!
        expect(subject).to be_completed
      end
    end
  end
end