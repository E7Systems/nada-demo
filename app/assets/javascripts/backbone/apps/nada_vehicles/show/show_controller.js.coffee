@Blinker.module "NadaVehiclesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { id, options } = options
      vehicle  = App.request "nada:vehicle:entity", id, options

      App.execute "when:fetched", vehicle, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion vehicle
          @panelRegion vehicle
          @vehiclesRegion vehicle

        @show @layout

    onClose: ->
      console.info "closing controller!"

    reloadForm: ->
      console.log("Reload form")

    titleRegion: (vehicle) ->
      titleView = @getTitleView(vehicle)

      @layout.titleRegion.show titleView

    panelRegion: (vehicle) ->
      panelView = @getPanelView(vehicle)

      @layout.panelRegion.show panelView


    vehiclesRegion: (vehicle)->
      vehicleView = @getVehicleView(vehicle)

      formView = App.request "form:wrapper", vehicleView,
        footer: false

#      @listenTo vehicleView, "form:submit", (data) ->
#        @layout.vehiclesRegion.show
#        console.log(data)
#        false

      @layout.vehiclesRegion.show formView

    getLayoutView: ->
      new Show.Layout

    getTitleView: (vehicle) ->
      new Show.Title
        model: vehicle

    getPanelView: (vehicle) ->
      new Show.Panel
        model: vehicle

    getVehicleView: (vehicle) ->
      new Show.NadaVehicle
        model: vehicle
