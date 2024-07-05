require 'rails_helper'

RSpec.describe "Index", type: :request do
  describe "GET /" do
    it "responds successfully with an HTTP 200 status code" do
      get "/"
      expect(response).to have_http_status(200)
    end

    it "renders the 'Hello world!' text" do
      get "/"
      expect(response.body).to include 'Manage your job applications'
    end
  end
end
