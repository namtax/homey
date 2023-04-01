require "rails_helper"

RSpec.describe User do 
  describe '.create' do
    subject { described_class.new(params) }
    let(:params) do 
      { 
        first_name: 'john', 
        last_name: 'smith', 
        email: 'jsmith@googlemail.com', 
        password_digest: '1239999xxx'
      }
    end

    context 'valid params' do 
      it 'is valid' do 
        expect{ subject.save }.to change{ User.count }.by(1)
      end
    end

    context 'first name missing' do 
      before do 
        params.delete(:first_name)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'last name missing' do 
      before do 
        params.delete(:last_name)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'email missing' do 
      before do 
        params.delete(:email)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'password missing' do 
      before do 
        params.delete(:password_digest)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end
  end
end