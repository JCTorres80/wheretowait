class FlaggedWordsController < ApplicationController
  before_filter :verify_credentials
  # GET /flagged_words
  # GET /flagged_words.json
  def index
    @flagged_words = FlaggedWord.search(params[:search], params[:page], 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @flagged_words }
    end
  end

  # GET /flagged_words/1
  # GET /flagged_words/1.json
  def show
    @flagged_word = FlaggedWord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @flagged_word }
    end
  end

  # GET /flagged_words/new
  # GET /flagged_words/new.json
  def new
    @flagged_word = FlaggedWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @flagged_word }
    end
  end

  # GET /flagged_words/1/edit
  def edit
    @flagged_word = FlaggedWord.find(params[:id])
  end

  # POST /flagged_words
  # POST /flagged_words.json
  def create
    @flagged_word = FlaggedWord.new(params[:flagged_word])

    respond_to do |format|
      if @flagged_word.save
        format.html { redirect_to @flagged_word, notice: 'Flagged word was successfully created.' }
        format.json { render json: @flagged_word, status: :created, location: @flagged_word }
      else
        format.html { render action: "new" }
        format.json { render json: @flagged_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /flagged_words/1
  # PUT /flagged_words/1.json
  def update
    @flagged_word = FlaggedWord.find(params[:id])

    respond_to do |format|
      if @flagged_word.update_attributes(params[:flagged_word])
        format.html { redirect_to @flagged_word, notice: 'Flagged word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @flagged_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flagged_words/1
  # DELETE /flagged_words/1.json
  def destroy
    @flagged_word = FlaggedWord.find(params[:id])
    @flagged_word.destroy

    respond_to do |format|
      format.html { redirect_to flagged_words_url }
      format.json { head :no_content }
    end
  end

  private

  def verify_credentials
    # first check if anyone is even checked in
    unless user_signed_in?
      redirect_to new_user_session_path, notice: t(:Need_to_sign_in)
      return
    end
    unless current_user.role=='admin'
      redirect_to root_path, notice: t(:Need_permissions)
    end
  end

end
