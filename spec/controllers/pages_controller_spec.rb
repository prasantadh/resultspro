require 'spec_helper'

describe PagesController do

  describe "GET 'manage'" do
    it "returns http success" do
      get 'manage'
      response.should be_success
    end
  end

  describe "GET 'administrate'" do
    it "returns http success" do
      get 'administrate'
      response.should be_success
    end
  end

end
