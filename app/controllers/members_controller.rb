class MembersController < ApplicationController
  before_filter :verify_credentials_admin, :except => [:show, :edit, :update]
  before_filter :verify_credentials, :only => [:show, :edit, :update]

  def index
    @users = User.search(params[:search], params[:page], 30)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /members/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create

  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to member_path(@user), notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy

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
    # admins always win
    if current_user.role=='admin'
      return
    end
    # check ids are right
    unless current_user.id==params[:id].to_i
      redirect_to root_path, notice: t(:Need_permissions)
    end
  end

end
