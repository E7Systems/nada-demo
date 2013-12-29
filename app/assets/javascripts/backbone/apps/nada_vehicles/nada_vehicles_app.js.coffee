@Blinker.module "NadaVehiclesApp", (NadaVehiclesApp, App, Backbone, Marionette, $, _) ->

  class NadaVehiclesApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_vehicle/:id"        : 'showVehicle'
      "nada_vehicles/get_price" : 'getPrice'

  API =
    showVehicle: (id, options) ->
      new NadaVehiclesApp.Show.Controller
        id: id
        options: options

    getPrice: ->
      NadaVehiclesApp.Show.Controller.getPrice()

  App.vent.on "nada:vehicle:price",  ->
    API.getPrice()

  App.addInitializer ->
    new NadaVehiclesApp.Router
      controller: API