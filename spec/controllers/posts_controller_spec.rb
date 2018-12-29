require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "posts#update action" do
    it "should allow users to successfully update posts" do
      post = FactoryBot.create(:post, caption: "Initial Value")
      patch :update, params: { id: post.id, post: { caption: 'Changed' } }
      expect(response).to redirect_to root_path
      post.reload
      expect(post.caption).to eq "Changed"
    end

    it "should have http 404 error if the post cannot be found" do
      patch :update, params: { id: 'BABYBUM', post: { caption: 'Changed' } }
      expect(response).to have_http_status(:not_found)
    end

    it "should render the edit form with an http status of unprocessable_entity" do
      post = FactoryBot.create(:post, caption: "Initial Value")
      patch :update, params: { id: post.id, post: { caption: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      post.reload
      expect(post.caption).to eq "Initial Value"
    end
  end

  describe "posts#edit action" do
    it "should successfully show the edit form if the post is found" do
      post = FactoryBot.create(:post)
      get :edit, params: { id: post.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error message if the post is not found" do
      get :edit, params: { id: 'WHATEVS' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "posts#show action" do
    it "should successfully show the page if the post is found" do
      post = FactoryBot.create(:post)
      get :show, params: { id: post.id }
      expect(response).to have_http_status(:success)
    end

    it "should return a 404 error if the post is not found" do
      get :show, params: { id: 'WHATEVER' }
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "posts#index action" do
    it "should successfully show the page" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#new action" do
    it "should require users to be logged in" do
      get :new
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully show the new form" do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "posts#create action" do
    it "should require users to be logged in" do
      post :create, params: { post: { message: "Test" } }
      expect(response).to redirect_to new_user_session_path
    end

    it "should successfully create a new post in our database" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { post: { caption: 'Test' } }
      expect(response).to redirect_to root_path

      post = Post.last
      expect(post.caption).to eq("Test")
      expect(post.user).to eq(user)
    end

    it "should properly deal with validation errors" do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { post: { caption: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(Post.count).to eq Post.count
    end
  end
end
