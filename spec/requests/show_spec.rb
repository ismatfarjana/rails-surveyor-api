require "rails_helper"

RSpec.describe "GET /rating_questions/:id" do
  context "when the question exists" do
    let(:question) do
      RatingQuestion.create!(title: "Hello World")
    end

    it "returns a 200 OK" do
      get "/rating_questions/#{question.id}"
      body = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(body.is_a?(Hash)).to eq(true)
    end
  end

  context "asking to get a question that doesn't exist" do
    it "returns a 404 Not Found" do
      get "/rating_questions/i-will-never-exist"
      expect(response.status).to eq(404)
    end
  end
end
