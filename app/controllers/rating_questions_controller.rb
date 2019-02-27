class RatingQuestionsController < ApplicationController
  before_action :find_question, only: [:show, :update, :destroy]

  def index
    @rating_questions = RatingQuestion.all
  end

  def show
    @rating_question = RatingQuestion.find(params[:id])
    send_response(200, @rating_question)
  end

  def new
    @rating_question = RatingQuestion.new
  end

  def create
    @rating_question = RatingQuestion.new(question_params)
    if @rating_question.save
      send_response(201, serialize_question(@rating_question))
    else
      errors = { 'errors' => @rating_question.errors.messages }
      send_response(422, errors)
    end

  end

  def update
    @rating_question = RatingQuestion.find(params[:id])
    if @rating_question.update(question_params)
      send_response(200, @rating_question)
    else
      errors = { 'errors' => @rating_question.errors.messages }
      send_response(422, errors)
    end
  end

  def destroy
    @rating_question = RatingQuestion.find(params[:id])
    send_response(204, nil) if @rating_question.destroy
  end

  private

  def question_params
    params.require(:rating_question).permit(:title, :tag)
  end

  def send_response(status, body)
    render json: body, status: status
  end

  def serialize_question(question)
    {
      id: question.id.to_s,
      title: question.title,
      tag: question.tag
    }
  end

  def find_question
    @question = RatingQuestion.find(params[:id])
    unless @question
      head 404
      return
    end
  end

end
