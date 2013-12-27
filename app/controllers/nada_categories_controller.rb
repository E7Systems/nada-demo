class NadaCategoriesController < ApplicationController

  before_filter :load_nada_client

  def index
    makes =  @nada_client.makes
    @nada_make = makes.find { |make| make.id == params[:id].to_i }
    #binding.pry
    @nada_make_categories = @nada_client.categories(@nada_make, params[:year]) if params[:year].present?
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: { nada_make: @nada_make, nada_make_year: @nada_make_year, nada_make_categories: @nada_make_categories } }
    end
  end

  protected

  def load_nada_client
    @nada_client ||= Nada::NadaClient.new(ENV['NADA_USERNAME'],ENV['NADA_PASSWORD'], root_url: ENV['NADA_ROOT_URL'])
  end
end
