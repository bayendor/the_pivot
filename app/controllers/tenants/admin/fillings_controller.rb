class Tenants::Admin::FillingsController < Admin::BaseAdminController

  before_action :set_filling, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    @fillings = Filling.order(id: :asc)
  end

  def show
  end

  def new
    @filling = Filling.new
  end

  def edit
  end

  def create
    @filling = Filling.new(filling_params)

    if @filling.save
      redirect_to admin_fillings_path, notice: 'Filling was successfully created.'
    else
      flash.now[:alert] = "The filling was not created. Please try again."
      render :new
    end
  end

  def update
    if @filling.update_attributes(filling_params)
      respond_to do |format|
        format.json { render json: @filling.to_json }
        format.html { redirect_to admin_fillings_path, notice: "You have updated a filling." }
      end
    else
      flash.now[:alert] = "The filling was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    if @filling.line_items.empty?
      @filling.destroy
      redirect_to admin_fillings_path, notice: "The filling was deleted."
    else
      redirect_to admin_fillings_path, notice: "Unauthorized. This Filling is in an existing order."
    end
  end

  private

    def set_filling
      @filling = Filling.find(params[:id])
    end

    def filling_params
      params.require(:filling).permit(:title, :description, :price, :food_group, :image, :retired)
    end

end
