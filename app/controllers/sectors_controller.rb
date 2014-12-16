class SectorsController < ApplicationController
 
	before_action :require_user
	before_action :set_sector, only: [:show, :edit, :update, :destroy]

	#	GET /sectors
	#	GET /sectors.json
	def index
	 @sectors = Sector.all	
	end

	# GET /sectors/1
	# GET /sectors/1.json	
	def show	
	end

 	def new
		@sector = Sector.new
  end

	def edit
	end

	# POST /sectors
	# POST /sectors.json
  def create
		@sector = Sector.new(sector_params)

		respond_to do |format|
			if @sector.save
				format.html { redirect_to @sector, notice: 'Sector was successfully created.' }
				format.json { render action: 'show', status: :created, location: @sector }
			else
				format.html { render action: 'new' }
				format.json { render json: @sector.errors, status: :unprocessable_entity }
			end
		end
  end

	# PATCH/PUT /sector/1
	# PATCH/PUT /sector/1.json
	def update
		respond_to do |format|
			if @sector.update(sector_params)
				format.html { redirect_to @sector, notice: 'Sector was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }		
				format.json { render json: @sector.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /sector/1
	# DELETE /sector/1.json
	def destroy
		@sector.destroy
		respond_to do |format|
			format.html { redirect_to sectors_url }
			format.json { head :no_content }
		end
	end

	private
	#Use callbacks to share common setup or constraints between actions. 
	def set_sector
		@sector = Sector.find(params[:id])
	end	

	#Never trust parameters from the scary internet, only allow the white list through.
	def sector_params
		params.require(:sector).permit(:name, :description)
	end



end
