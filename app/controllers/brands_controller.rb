class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def new
    @brand = Brand.new
  end

  ### FOR SINGLE PHOTO
  # def create
  #   brand = Brand.new brand_params
  #   if params[:file].present?
  #     req = Cloudinary::Uploader.upload params[:file]
  #     brand.image = req["public_id"]
  #     brand.save
  #   end

  #   redirect_to brand_path(brand)
  # end

  ### FOR MULTIPLE PHOTO
  def create
    brand = Brand.new brand_params
    if params[:brand][:images].present?
      params[:brand][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        brand.images << req["public_id"]
      end
      brand.save
    end
    redirect_to brand_path(brand)
  end

  def show
    @brand = Brand.find params[:id]
  end

  def edit
    @brand = Brand.find params[:id]
  end

  ### FOR SINGLE PHOTO
  # def update
  #   brand = Brand.find params[:id]

  #   if params[:file].present?
  #     req = Cloudinary::Uploader.upload params[:file]
  #     brand.image = req["public_id"]
  #   end

  #   brand.update_attributes brand_params
  #   brand.save
  #   redirect_to brand_path(brand)
  # end 

   ### FOR MULTIPLE PHOTO
  def update
    brand = Brand.find params[:id]

    if params[:brand][:images].present?
      params[:brand][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        brand.images << req["public_id"]
      end
    end

    brand.update_attributes brand_params
    brand.save
    redirect_to brand_path(brand)
  end 


  private 
  def brand_params
    params.require(:brand).permit(:name)
  end
end
