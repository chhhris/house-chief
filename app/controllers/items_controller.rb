class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = @property.items
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = @property.items.find_by_id(params[:id])
  end

  # GET /items/new
  def new
    @item = @property.items.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
    @item = @property.items.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @property, notice: "#{@item.name} was successfully created." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @property, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to property_items_url(@property), notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_property
      @property = Property.find(params[:property_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = @property.items.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:name, :notes, :frequency, :last_maintenance_at)
    end
end
