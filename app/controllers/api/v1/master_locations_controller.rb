module Api
    module V1
        class MasterLocationsController < ApplicationController

            def index
                @master_locations = MasterLocation.all
                render json: @master_locations, each_serializer: MasterLocationSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_locations
                # }
            end
        
            def show
                @master_location = MasterLocation.find(params[:id])
                render json: @master_location, serializer: MasterLocationSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_location
                # }
            end

            def create
                @master_location = MasterLocation.new(master_location_params)
                if @master_location.save
                    render status: 200, json: {
                        message: "Success",
                        data: @master_location
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        data: @master_location.errors
                    }
                end
            end

            def update
                @master_location = MasterLocation.find(params[:id])
                if @master_location.update(master_location_params)
                    render status: 200, json: {
                        message: "Success",
                        data: @master_location
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        data: @master_location.errors
                    }
                end
            end

            def destroy
                @master_location = MasterLocation.find(params[:id])
                if @master_location.present?
                    @master_location.destroy
                    render status: 200, json: {
                        message: "Success",
                        data: @master_location
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_location.errors
                    }
                end
            end

            private
            def master_location_params
                params.require(:master_location).permit(:name, :is_active)
            end
        end
    end
end