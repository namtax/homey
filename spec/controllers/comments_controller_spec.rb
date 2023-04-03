require 'rails_helper'

RSpec.describe CommentsController do 
  describe 'POST #create' do 
    subject       { post :create, params: params }
    let(:project) { create(:project, user: user) }
    let(:user)    { create(:user) }
    let(:params)  { { project_id: project.id, comment: { body: 'New comment' } } }

    it 'creates comment for project' do 
      expect{ subject }.to change { Comment.count }.by(1)
    end

    it 'redirects to show' do 
      expect(subject).to redirect_to(project_path(project))
    end
  end
end