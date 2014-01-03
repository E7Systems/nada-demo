class NadaMakesController < ApplicationController
  #respond_to :json

  before_filter :load_nada_client

  def index
    @nada_makes =  @nada_client.makes
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @nada_makes }  #TODO figure out why respond_with DOES NOT work
    end
  end

  def show
    @years = []
    @categories = []
    # TODO wireup Backbone to maintain original makes array so only nada_make_id needed
    makes =  @nada_client.makes
    @nada_make = makes.find { |make| make.id == params[:id].to_i }
    @categories = @nada_client.categories(@nada_make, params[:year]) if params[:year].present?

    if params[:year].present?
      @years = [ params[:year].to_i ]
    elsif @nada_make.present?
      @years = @nada_client.years(@nada_make)
    end

    respond_to do |format|
      format.json { render json: { nada_make: @nada_make, years: @years, categories: @categories } }
    end
  end

  protected

    def load_nada_client
      @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
    end
end
