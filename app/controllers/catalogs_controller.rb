class CatalogsController < ApplicationController
	before_action :require_user
	before_action :set_catalog, only: [:show, :edit, :update, :destroy]

	# GET /catalogs
	# GET /catalogs.json
	def index
		#render json: @users = User.all
		#@catalogs = current_user.catalogs
		@catalogs = Catalog.all
			#@users = User.all
		 render json: @catalogs
	end

	# GET /sectors/1
	# GET /sectors/1.json
	def show
	end

  def new
		@catalog = current_user.catalogs.new
  end

	def edit
	end
 
  def create
		@catalog = current_user.catalogs.new(catalog_params)
		respond_to do |format|
			if @catalog.save
				format.html { redirect_to @catalog, notice: 'Catalog was successfully created.' }
				format.json { render action: 'show', status: :created, location: @catalog }
			else
				format.html { render action: 'new' }
				format.json { render json: @catalog.errors, status: :unprocessable_enttity }
			end
		end
  end
	
	def update
		respond_to do |format|
			if @catalog.update(catalog_params)
				format.html { redirect_to @catalog, notice: 'Catalog was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @catalog.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@catalog.destroy
		respond_to do |format|
			format.html { redirect_to catalogs_url }
			format.json { head :no_content }
		end
	end

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_catalog
		@catalog = current_user.catalogs.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def catalog_params
		params.require(:catalog).permit(:name, :sector_id, :description, :user_id)
	end





end
