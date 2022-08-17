module Api
    module V1
        class MasterUnitsController < ApplicationController

            def index
                @master_units = MasterUnit.all
                render json: @master_units, each_serializer: MasterUnitSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_units
                # }
            end

            def show
                @master_unit = MasterUnit.find(params[:id])
                render json: @master_unit, serializer: MasterUnitSerializer
                # render status: 200, json: {
                #     message: "Success",
                #     data: @master_unit
                # }
            end

            def create
                @master_unit = MasterUnit.new(master_unit_params)
                if @master_unit.save
                    render status: 200, json: {
                        message: "Success",
                        data: @master_unit
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_unit.errors
                    }
                end
            end

            def update
                @master_unit = MasterUnit.find(params[:id])
                if @master_unit.update(master_unit_params)
                    render status: 200, json: {
                        message: "Success",
                        data: @master_unit
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        data: @master_unit.errors
                    }
                end
            end

            def destroy
                @master_unit = MasterUnit.find(params[:id])
                if @master_unit.present?
                    @master_unit.destroy
                    render status: 200, json: {
                        message: "Success",
                        data: @master_unit
                    }
                else
                    render status: 404, json: {
                        message: "Failed",
                        errors: @master_unit.errors
                    }
                end
            end


            private
            def master_unit_params
                params.require(:master_unit).permit(:name, :is_active)
            end

        end
    end
end
