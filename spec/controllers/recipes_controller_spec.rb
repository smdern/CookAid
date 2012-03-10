require 'spec_helper'

describe RecipesController do
  describe "#index" do
    it "returns status code 200" do
      get :index
      response.status.should == 200
    end
  end

  describe "#show" do
    before do
        Recipe.stub(:find) { 'foo' }
    end

    it "returns status code 200" do
      get :show, :id => 'foo'
      response.status.should == 200
    end
  end
end
