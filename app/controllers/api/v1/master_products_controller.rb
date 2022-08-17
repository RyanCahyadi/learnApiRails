module Api
    module V1
        class MasterProductsController < ApplicationController

            def index
                @master_products = MasterProduct.all
                render json: @master_products, each_serializer: MasterProductSerializer
                # if @master_products.present?    
                #     render status: 200, json: {
                #         message: "Success",
                #         data: @master_products
                #     }
                # else
                #     render status: 404, json: {
                #         message: "No data not found"
                #     }
                # end
            end

            def show
                @master_product = MasterProduct.find(params[:id])
                render status: 200, json: {
                    message: "Success",
                    data: @master_product
                } 
            end
        
        end
    end
end