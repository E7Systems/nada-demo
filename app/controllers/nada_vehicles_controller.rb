class NadaVehiclesController < ApplicationController

  before_filter :load_nada_client
  before_filter :set_params

  def show
    @vehicle_id = params[:id].to_i

    @options = @nada_client.options(@vehicle_id)

    respond_to do |format|
      format.json {
        render json: { vehicle_options: @options, vehicle_id: @vehicle_id, vehicle_name: @vehicle_name, nada_model_name: @nada_model_name, year: @year,
                       nada_make_name: @nada_make_name, nada_make_id: @nada_make_id, category_id: @category_id, category_name: @category_name }
      }
    end
  end

  def update
    @options = params[:vehicle_options].map{ |k, v| Nada::Models::Option.new(code:  k.to_i)  if v == true }.compact
    @mileage = params[:mileage]
    @price_object = @nada_client.used_price(@vehicle_id, @options, @mileage)

    respond_to do |format|
      format.json { render json: { price_object: @price_object, vehicle_options: @options, vehicle_id: @vehicle_id } }
    end
  end


  protected

  def set_params
    @nada_make_id = params[:nada_make_id]
    @nada_make_name = params[:nada_make_name]
    @year = params[:year]
    @category_id = params[:category_id]
    @category_name = params[:category_name]
    @nada_model_name = params[:nada_model_name]
    @vehicle_id = params[:vehicle_id]
    @vehicle_name = params[:vehicle_name]
  end

  def load_nada_client
    @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
  end

end
