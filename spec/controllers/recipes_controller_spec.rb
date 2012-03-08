require 'spec_helper'

describe RecipesController do
  describe "#index" do
    it "returns status code 200" do
      get :index
      response.code.should == :ok
    end
  end
end
