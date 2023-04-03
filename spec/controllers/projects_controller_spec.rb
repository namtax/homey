require 'rails_helper'

RSpec.describe ProjectsController do 
  describe '#POST projects#create' do 
    subject     { post :create, params: params }
    let!(:user) { User.create(first_name: 'john', last_name: 'smith', email: "j@googlemail.com", password_digest: '999') }

    context 'valid params' do 
      let(:params) { { project: { name: 'ProjectX' } } }

      it 'creates new project' do 
        expect{ subject }.to change { Project.count }.by(1)
      end

      it 'creates new project' do 
        expect(subject).to redirect_to(projects_path)
      end
    end
  end
end