class NadaModelsController < ApplicationController
  respond_to :json

  before_filter :load_nada_client
  before_filter :set_params

  def index

    @nada_models = @nada_client.models(@make_id, @year, @category_id)
    output_objs = @nada_models.map { |m| m.attributes.merge({ year: @year }) }
    respond_with output_objs

  end

  def show
    @model_id = params[:id]

    @vehicles = @nada_client.trims(@year, @model_id)
    output_objs = @vehicles.map{|m| m.attributes.merge({ category_id: @category_id, category_name: @category_name })}
    respond_with output_objs

  end


  protected

  def set_params
    @make_id = params[:make_id]
    @make_name = params[:make_name]
    @year = params[:year]
    @category_id = params[:category_id]
    @category_name = params[:category_name]
  end

  def load_nada_client
    @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
  end
end
