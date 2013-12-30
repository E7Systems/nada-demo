class NadaModelsController < ApplicationController

  before_filter :load_nada_client
  before_filter :set_params

  def index

    @nada_models = @nada_client.models(@nada_make_id, @year, @category_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json {
                    render json: { nada_models: @nada_models, nada_make_id: @nada_make_id, nada_make_name: @nada_make_name, year: @year,
                                   category_id: @category_id, category_name:  @category_name }
                  }
      #format.json { render json: @nada_models, include: { nada_make_year: @year } }
    end
  end

  def show
    @nada_model_id = params[:id]

    @trims = @nada_client.trims(@year, @nada_model_id)

    respond_to do |format|
      format.json {
                    render json: { trims: @trims, nada_model_id: @nada_model_id, nada_model_name: @nada_model_name, year: @year,
                                   nada_make_name: @nada_make_name, nada_make_id: @nada_make_id, category_id: @category_id, category_name: @category_name }
                  }
    end
  end


  protected

  def set_params
    @nada_make_id = params[:nada_make_id]
    @nada_make_name = params[:nada_make_name]
    @nada_model_name = params[:nada_model_name]
    @year = params[:year]
    @category_id = params[:category_id]
    @category_name = params[:category_name]
  end

  def load_nada_client
    @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
  end
end
