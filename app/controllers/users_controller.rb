class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_property

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def index
    @users = @property.users
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user           = User.find_or_initialize_by(user_params)
    @user.password  = SecureRandom.hex(10) unless @user.encrypted_password?

    respond_to do |format|
      if @user.save
        find_or_create_property_user if @property
        format.html { redirect_to property_users_path(@property), notice: "#{@user.name} was successfully invited." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        find_or_create_property_user if @property
        format.html { redirect_to property_users_path(@property), notice: "#{@user.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

 private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def set_property
    property_id = params.key?(:user) ? params[:user][:property_id] : params[:property_id]
    @property =  Property.find(property_id)
  end

  def find_or_create_property_user
    PropertyUser.find_or_create_by(user_id: @user.id, property_id: @property.id)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
