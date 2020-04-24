require 'rails_helper'

RSpec.describe "Tasks", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/tasks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/tasks/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/tasks/update"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /done" do
    it "returns http success" do
      get "/tasks/done"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /task_up" do
    it "returns http success" do
      get "/tasks/task_up"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /task_down" do
    it "returns http success" do
      get "/tasks/task_down"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/tasks/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
