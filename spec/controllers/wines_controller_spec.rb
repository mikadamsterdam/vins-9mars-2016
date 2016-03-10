require 'rails_helper'


RSpec.describe WinesController, type: :controller do

  describe "GET #index" do
    it "gives a wines list in JSON" do
      get :index, format: :json
      end
  end

  describe "get HTTP succes" do
    it "has a 200 status code" do
      get:index
      expect(response.status).to eq(200)
    end
  end

  describe "get no HTTP succes" do
    it "has a 403 status code" do
      get:index
      expect(response.status).not_to eq(403)
    end
  end


end
