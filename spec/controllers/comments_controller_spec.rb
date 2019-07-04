require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  describe "comments#create action" do
    it "should allow users to create comments on posts" do
      testpost = FactoryBot.create(:post)

      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { post_id: testpost.id, comment: { message: 'test comment' } }

      expect(response).to redirect_to post_path(testpost)
      expect(testpost.comments.length).to eq 1
      expect(testpost.comments.first.message).to eq "test comment"
      expect(testpost.user.firstname).to eq "Guy"
      expect(testpost.user.lastname).to eq "Manderson"
    end

    it "should require a user to be logged in to comment on a post" do
      testpost = FactoryBot.create(:post)
      post :create, params: { post_id: testpost.id, comment: { message: 'test comment' } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should return http status code of not found if the post isn't found" do
      user = FactoryBot.create(:user)
      sign_in user
      post :create, params: { post_id: 'ITSAMEMARIO', comment: { message: 'test comment' } }
      expect(response).to have_http_status :not_found
    end
  end
end
