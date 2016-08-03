require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  include Helpers

  let(:user) { create :user }
  let(:business) { create :business }  
  let(:question) { create :question }
  let(:answer) { create :answer}

  describe "POST #create" do
    it "posts answer to question" do

      sign_in user

      u = create :user
      u.save!
      b = create :business, owner_id: u.id
      b.save!
      q = create :question, user_id: u.id, business_id: business.id
      q.save!

      
      expect {
      post :create, params:{ answerer: u, question_id: q.id, answer_text: "test" }
      }.to change(Answer , :count).by(1)
      expect(response).to have_http_status(:ok)
    end
  end

end
