@Blinker.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.NadaVehicle extends App.Entities.Model
    url: ->
      Routes.nada_vehicle_path(this.id, this.get('options') )

  API =
    getNadaVehicle: (id, options) ->
      vehicle = new Entities.NadaVehicle
        id: id
        options: options
      vehicle.fetch()
      vehicle

  App.reqres.setHandler "nada:vehicle:entity", (id, options) ->
    API.getNadaVehicle id, options


