require "rails_helper"

RSpec.describe "DELETE /rating_questions/:id" do
  context "with an existing question" do
    let(:question) do
      RatingQuestion.create!(title: "Hello World")
    end

    it "returns a 204 No Content" do
      delete "/rating_questions/#{question.id}"
      expect(response.status).to eq(204)
      expect(response.body.to_s).to eq('')
    end

    it "actually deletes the question" do
      route = "/rating_questions/#{question.id}"
      delete route
      get route
      expect(response.status).to eq(404)
    end
  end

  context "asking to delete a question that doesn't exist" do
    it "returns a 404 Not Found" do
      delete "/rating_questions/i-will-never-exist"
      expect(response.status).to eq(404)
    end
  end
end
