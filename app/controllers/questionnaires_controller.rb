class QuestionnairesController < ApplicationController
  before_filter :verify_credentials_admin, :except => [:new, :show, :create, :destroy]
  before_filter :verify_credentials, :only => [:new, :show, :create, :destroy]
  helper :locations

  # GET /questionnaires
  # GET /questionnaires.json
  def index
    @questionnaires = Questionnaire.search(params[:search], params[:page], 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questionnaires }
    end
  end

  def needs_moderation
    @questionnaires = Questionnaire.flagged.not_moderated.search(params[:search], params[:page], 30)

    respond_to do |format|
      format.html # needs_moderation.html.erb
      format.json { render json: @questionnaires }
    end
  end

  # GET /questionnaires/1
  # GET /questionnaires/1.json
  def show
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/new
  # GET /questionnaires/new.json
  def new
    @questionnaire = Questionnaire.new
    if params.include?(:location_id)
      @questionnaire.location = Location.find(params[:location_id])
    end

    @questionnaire.prep_user_answers

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @questionnaire }
    end
  end

  # GET /questionnaires/1/edit
  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  # POST /questionnaires
  # POST /questionnaires.json
  def create
    @questionnaire = Questionnaire.new :comment => params[:questionnaire][:comment]
    @questionnaire.user = current_user
    @questionnaire.location = Location.find(params[:questionnaire][:location])
    Question.all.each_with_index do |question, index|
      user_answer = UserAnswer.new
      user_answer.question = question
      user_answer.location = @questionnaire.location
      user_answer.questionnaire = @questionnaire
      user_answer.value = params[:questionnaire][:user_answers][index.to_s][:value]
      @questionnaire.user_answers << user_answer
    end

    respond_to do |format|
      if @questionnaire.save
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully created.' }
        format.json { render json: @questionnaire, status: :created, location: @questionnaire }
      else
        format.html { render action: "new" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /questionnaires/1
  # PUT /questionnaires/1.json
  def update
    @questionnaire = Questionnaire.find(params[:id])

    respond_to do |format|
      if @questionnaire.update_attributes(params[:questionnaire])
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questionnaires/1
  # DELETE /questionnaires/1.json
  def destroy
    @questionnaire = Questionnaire.find(params[:id])
    @questionnaire.destroy

    respond_to do |format|
      format.html { redirect_to user_root_path }
      format.json { head :no_content }
    end
  end

  private

  def verify_credentials_admin
    # first check if anyone is even checked in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: t(:Need_to_sign_in)
      return
    end
    unless current_user.role=='admin'
      redirect_to root_path, notice: t(:Need_permissions)
    end
  end

  def verify_credentials
    # first check if anyone is even checked in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: t(:Need_to_sign_in)
      return
    end
  end

end
