class AdvertisementsController < ApplicationController
	
	before_action :require_user
	before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
 

	# GET /advertisements
	# GET / advertisements.json
	def index
		@users = User.all
		
		#render json: @users = User.all

	 @advertisements = Advertisement.all

	 render json: @advertisements
	end

	# GET /advertisemets/1
	# GET /advertisements/1.json
	def show
	end
 
	def new
		@advertisement = Advertisement.new
  end

	# GET /advertisements/1/edit
	def edit
	end
	
	# POST /advertisements
	# POST advertisements.json
  def create
		@advertisement = Advertisement.new(advertisement_params)
		respond_to do |format|
			if @advertisement.save
				format.html { redirect_to @advertisement, notice: 'Advertisement was successfully created.' }
				format.json { render action: 'show', status: :created, location: @advertisement }
			else
				format.html { render action: 'new' }
				format.json { render json: @advertisement.errors, status: :unprocessable_entity }
			end
		end
  end


	# PATCH/PUT /advertisement/1
	# PATCH/PUT /advertisement/1.json
  def update
		respond_to do |format|
			if @advertisement.update(advertisement_params)
				format.html { redirect_to @advertisement, notice: 'Advertisement was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @advertisement.errors, status: :unprocessable_entity }
			end
		end
  end

	# DELETE /advertisement/1
	# DELETE /advertisemet/1.json
	def destroy
		@advertisement.destroy
		respond_to do |format|
			format.html { redirect_to advertisements_url }
			format.json { head :no_content }
		end
	end

	private
	#Use callbacks to share common setup or constraints between actions.
	def set_advertisement
		@advertisement = Advertisement.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def advertisement_params
		params.require(:advertisement).permit(:title, :notes)
	end




end
