require "rails_helper"

RSpec.describe "Update" do
  describe "PUT /ratingQuestions/:id" do
    
    context "when the question exists" do
      let(:question) do
        RatingQuestion.create!(title: "Hello World", tag: "greetings")
      end

      it "returns a 200 OK" do
        put "/rating_questions/#{question.id}", params: { rating_question: { title: "Hello Mars" } }
        response_json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(response_json.is_a?(Hash)).to eq(true)
        expect(response_json["title"]).to eq("Hello Mars")
        expect(response_json.key?("tag")).to be true
      end
    end

    context "asking to PUT a question that doesn't exist" do
      it "returns a 404 Not Found" do
        put "/rating_questions/i-will-never-exist", params: { rating_question: { title: "Hello World" } }
        expect(response.status).to eq(404)
      end
    end
  end
  describe "PATCH /ratingQuestions/:id" do
    context "when the question exists" do
      let(:question) do
        RatingQuestion.create!(title: "Hello World")
      end
  
      it "returns a 200 OK and returns a question -- with an additional field" do
        patch "/rating_questions/#{question.id}", params: { rating_question: { tag: "greetings" } }
        response_json = JSON.parse(response.body)
        expect(response.status).to eq(200)
        expect(response_json.is_a?(Hash)).to eq(true)
        expect(response_json["title"]).to eq("Hello World")
        expect(response_json["tag"]).to eq("greetings")
      end
    end
  end
end
