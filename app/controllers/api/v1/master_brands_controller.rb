module Api
    module V1
        class MasterBrandsController < ApplicationController

            def index
                @master_brands = MasterBrand.all

                render json: @master_brands, each_serializer: MasterBrandSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_brands, each_serializer: MasterBrandSerializer
                # }
            end
        
            def create
                @master_brand = MasterBrand.new(master_brand_params)
                if @master_brand.save
                    render status: 200, json: {
                        message: "Success",
                        data: @master_brand
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_brand.errors
                    }
                end
            end

            def show
                @master_brand = MasterBrand.find(params[:id])
                render json: @master_brand, serializer: MasterBrandSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_brand, serializer: MasterBrandSerializer
                # }
            end

            def update
                @master_brand = MasterBrand.find(params[:id])
                if @master_brand.update(master_brand_params)
                    render status: 200, json: {
                        message: "Success",
                        data: @master_brand
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_brand.errors
                    }
                end
            end

            def destroy
                @master_brand = MasterBrand.find(params[:id])
                if @master_brand.present?
                    @master_brand.destroy
                    render status: 200, json: {
                        message: "Success",
                        data: @master_brand
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_brand.errors
                    }
                end

            end
            private
            def master_brand_params
                params.require(:master_brand).permit(:name, :description, :initial, :is_active)
            end

        end
    end
end