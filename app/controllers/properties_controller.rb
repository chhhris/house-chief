class PropertiesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!, except: [:new, :create, :index]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    @properties = current_user.properties
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    # Rails.cache.fetch(@property.cache_key) do
    @items = @property.items.order('name ASC')
    # end
  end

  # GET /properties/new
  def new
    @property = Property.new
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property         = Property.new(property_params)
    @property.creator = current_user

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    if @property.blank? || @property.id != params[:id]
      @property = Property.find(params[:id])
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:name, :address)
  end

  def authorize_user!
    if @property && current_user.properties.pluck(:id).exclude?(@property.id)
      redirect_to properties_path
    end
  end
end
