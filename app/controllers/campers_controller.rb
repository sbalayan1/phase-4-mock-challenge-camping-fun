class CampersController < ApplicationController
  before_action :set_camper, only: [:show, :update, :destroy]

  # GET /campers
  def index
    @campers = Camper.all

    render json: @campers
  end

  # GET /campers/1
  def show
    render json: @camper, include: :activities
  end

  # POST /campers
  def create
    # binding.pry
    @camper = Camper.create!(camper_params)
    render json: @camper, status: :created
    # if @camper.save
    #   render json: @camper, status: :created, location: @camper
    # end
  end

  # PATCH/PUT /campers/1
  def update
    @camper.update!(camper_params)
    render json: @camper, status: :accepted
  end

  # DELETE /campers/1
  def destroy
    @camper.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camper
      @camper = Camper.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def camper_params
      params.permit(:name, :age)
    end
end
