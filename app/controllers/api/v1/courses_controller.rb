class Api::V1::CoursesController < ApplicationController
  before_action :set_course, only: %i[ show update destroy ]
  before_action :set_topic, only: %i[ topic ]
  before_action :set_subtopic, only: %i[ subtopic ]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  def topics
    @courses = Course.all
    @topics = @courses.pluck(:topic).uniq

    render json: @topics
  end

  def topic
    @courses = Course.where(topic: @topic)

    render json: @courses
  end

  def subtopics
    @courses = Course.all
    @subtopics = @courses.pluck(:subtopic).uniq

    render json: @subtopics
  end

  def subtopic
    @courses = Course.where(subtopic: @subtopic.humanize.downcase)

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    @course = Course.new(course_params)

    if @course.save
      render json: @course, status: :created
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    def set_topic
      @topic = (params[:title])
    end

    def set_subtopic
      @subtopic = (params[:title])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:title, :topic, :subtopic)
    end
end
