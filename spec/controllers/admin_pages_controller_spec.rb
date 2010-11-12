require 'spec_helper'

describe AdminPagesController do

  describe "GET 'A_Summary'" do
    it "should be successful" do
      get 'A_Summary'
      response.should be_success
    end
  end

  describe "GET 'A_Edinburgh'" do
    it "should be successful" do
      get 'A_Edinburgh'
      response.should be_success
    end
  end

  describe "GET 'A_Glasgow'" do
    it "should be successful" do
      get 'A_Glasgow'
      response.should be_success
    end
  end

  describe "GET 'A_London'" do
    it "should be successful" do
      get 'A_London'
      response.should be_success
    end
  end

end
