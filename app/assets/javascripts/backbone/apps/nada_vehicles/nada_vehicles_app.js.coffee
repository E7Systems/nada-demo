@Blinker.module "NadaVehiclesApp", (NadaVehiclesApp, App, Backbone, Marionette, $, _) ->

  class NadaVehiclesApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_vehicle/:id"        : 'showVehicle'

  API =
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