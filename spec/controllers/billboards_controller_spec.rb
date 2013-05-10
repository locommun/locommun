require 'spec_helper'

describe BillboardsController do

   describe "Index and other stub methods" do
  
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    
    it "responds successfully with an HTTP 200 status code" do
      get :description
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "responds successfully with an HTTP 200 status code" do
      get :sources
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :sources
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
  end
  
  describe "Show a billboard" do
  
   before :each do
      @billboard = FactoryGirl.create(:billboard)
    end
    
    it "should be successful" do
        get :show, id: @billboard
        response.should be_success
        controller.instance_variable_get(:@billboard).should == @billboard
    end
  end
end
