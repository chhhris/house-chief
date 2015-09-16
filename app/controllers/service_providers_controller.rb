class ServiceProvidersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_service_provider, only: [:show, :edit, :update, :destroy]
  before_action :set_property

  def new
    @service_provider = ServiceProvider.new
  end

  def create
    @service_provider = ServiceProvider.new(service_provider_params)

    respond_to do |format|
      if @service_provider.save
        format.html { redirect_to property_service_provider_path(@property, @service_provider), notice: "#{@service_provider.name} was successfully created." }
        format.json { render :show, status: :created, location: @service_provider }
      else
        format.html { render :new }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @service_providers = @property.service_providers
  end

  def show
  end

  def destroy
    name = @service_provider.name
    @service_provider.destroy
    respond_to do |format|
      format.html { redirect_to property_path(@property), notice: "#{name} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def update
    respond_to do |format|
      if @service_provider.update(service_provider_params)
        format.html { redirect_to property_service_providers_path(@property), notice: "#{@service_provider.name} was successfully updated." }
        format.json { render :show, status: :ok, location: @service_provider }
      else
        format.html { render :edit }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end


private

  def set_service_provider
    @service_provider = ServiceProvider.find(params[:id])
  end

  def service_provider_params
    params.require(:service_provider).permit(:name, :property_id)
  end
end