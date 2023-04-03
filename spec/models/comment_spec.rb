require 'rails_helper'

RSpec.describe Comment do 
  subject       { described_class.new(params) }
  let(:params)  { { body: 'new comment', user: user, project: project } }
  let(:user)    { User.create(first_name: 'john', last_name: 'smith', email: "johns@googlemail.com", password_digest: '12396x') }
  let(:project) { Project.create(name: 'ProjectX', user_id: user.id) }

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
  end
end