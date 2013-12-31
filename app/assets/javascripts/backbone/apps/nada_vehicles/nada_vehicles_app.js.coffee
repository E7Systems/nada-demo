@Blinker.module "NadaVehiclesApp", (NadaVehiclesApp, App, Backbone, Marionette, $, _) ->

  class NadaVehiclesApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_vehicles"        : 'listVehicles'
      "nada_vehicles/:id"     : 'showVehicle'

  API =
    listVehicles: (options) ->
      new NadaVehiclesApp.List.Controller
        options: options

    showVehicle: (id, options) ->
      new NadaVehiclesApp.Show.Controller
        id: id
        options: options

#  App.vent.on "nada:vehicle:updated", (data) ->
#     console.log(data.get("price_object"))
#    App.navigate Routes.nada_vehicle_price_path
#    API.getPrice(data)

  App.addInitializer ->
    new NadaVehiclesApp.Router
      controller: API