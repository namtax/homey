require 'rails_helper'

RSpec.describe Comment do 
  subject       { described_class.new(params) }
  let(:params)  { { body: 'new comment', user: user, project: project } }
  let(:user)    { create(:user) }
  let(:project) { create(:project, user:) }

  describe '.create' do
    context 'valid params' do 
      it 'is valid' do 
        expect{ subject.save }.to change{ Comment.count }.by(1)
      end
    end

    context 'user missing' do 
      before do 
        params.delete(:user)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'project missing' do 
      before do 
        params.delete(:user)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'body missing' do 
      before do 
        params.delete(:body)
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end

    context 'body empty' do 
      before do 
        params[:body] = ""
      end

      it 'is invalid' do 
        expect(subject).to_not be_valid
      end
    end
  end
end