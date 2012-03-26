require 'spec_helper'

describe UsersController do

  describe "GET 'index'" do
    it "redirects to root_path" do
      get 'index'
      response.should redirect_to root_path
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

end
