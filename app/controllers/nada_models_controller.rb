class NadaModelsController < ApplicationController

  before_filter :load_nada_client

  def index
    @nada_make_id = params[:make_id]
    @nada_make_name = params[:make_name]
    @year = params[:year]
    @category_id = params[:category_id]
    @category_name = params[:category_name]
    #binding.pry()
    @nada_models = @nada_client.models(@nada_make_id, @year, @category_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { nada_models: @nada_models, nada_make_id: @nada_make_id, nada_make_name: @nada_make_name, nada_make_year: @year, category_id: @category_id, category_name:  @category_name } }
      #format.json { render json: @nada_models, include: { nada_make_year: @year } }
    end
  end

  def show
    @nada_make = []
    @nada_make_year = ''
    @nada_make_category =

    respond_to do |format|
      format.json { render json: { nada_make: @nada_make, nada_make_year: @nada_make_year, nada_make_category: @nada_make_category } }
    end
  end

  protected

  def load_nada_client
    @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
  end
end
