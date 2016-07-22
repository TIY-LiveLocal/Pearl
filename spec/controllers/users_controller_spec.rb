require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user, password: "password") }

  it "can sign up for an account" do
    u = attributes_for(:user)

    expect {
      post :sign_up, {**(u)}
    }.
      to change { User.count }.by 1

    expect(response.code).to eq("200")

  end

  it "can sign in to an account" do
    u = user

    post :sign_in, {username: u.username, password: "password"}
    expect(response.code).to eq("200")
  end

  it "renders show view" do
    u = user
    sign_in u

    get :show, id: u.id
    expect(response.code).to eq("200")
  end

end
