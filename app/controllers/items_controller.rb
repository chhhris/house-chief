class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_property
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_item_attachments, only: [:show, :edit, :update, :destroy]
  before_action :format_attachment_params, only: [:create, :update]
  before_action :format_last_maintenance_at, only: [:create, :update]

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
        process_attachments
        format.html { redirect_to @item, notice: "#{@item.name} was successfully created." }
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
        process_attachments
        format.html { redirect_to @item, notice: "#{@item.name} was successfully updated." }
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
      format.html { redirect_to property_path(@property), notice: "#{@item.name} was successfully deleted." }
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

  def set_item_attachments
    @item_attachments = @item.item_attachments
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    @item_params = params.require(:item).permit(:name, :notes, :frequency, :last_maintenance_at, {attachments: []})
  end

  def format_last_maintenance_at
    return unless params[:item][:last_maintenance_at][:month].present?
    params[:item][:last_maintenance_at] = Time.parse("#{params[:item][:last_maintenance_at][:month]} #{params[:item][:last_maintenance_at][:year]}").to_s
  end

  def format_attachment_params
    load_attachments if params[:item][:attachments].present?
    remove_attachments if params[:remove_attachments].present?
  end

  def load_attachments
    @attachment_params = params[:item].delete(:attachments)
  end

  def remove_attachments
    params[:remove_attachments].each do |attachment_id|
      item_attachment = @item.item_attachments.find(attachment_id.to_i)
      item_attachment.destroy
    end
  end

  def process_attachments
    return unless @attachment_params
    @attachment_params.each { |f| @item.item_attachments.create(file: f) }
  end
end
