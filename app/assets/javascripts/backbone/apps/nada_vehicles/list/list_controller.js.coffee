@Blinker.module "NadaVehiclesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->

      vehicles = App.request "nada:vehicles:entities", options

      App.execute "when:fetched", vehicles, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion vehicles
          @panelRegion vehicles
          @vehiclesRegion vehicles

        @show @layout

    onClose: ->
      console.info "closing controller!"

    titleRegion: (vehicles) ->
      titleView = @getTitleView(vehicles)

      @layout.titleRegion.show titleView

    panelRegion: (vehicles) ->
      panelView = @getPanelView(vehicles)

      @layout.panelRegion.show panelView

    vehiclesRegion: (vehicles)->
      vehiclesView = @getVehiclesView vehicles

      @layout.vehiclesRegion.show vehiclesView


    getLayoutView: ->
      new List.Layout

    getTitleView: (vehicles) ->
      new List.Title
        collection: vehicles

    getPanelView: (vehicles) ->
      new List.Panel
        collection: vehicles

    getVehiclesView: (vehicles)->
      new List.NadaVehicles
        collection: vehicles
