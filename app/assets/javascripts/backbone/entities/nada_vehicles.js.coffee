@Blinker.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.NadaVehicle extends App.Entities.Model
    url: ->
      Routes.nada_vehicle_path(this.id, this.get('options') )

  class Entities.NadaVehiclesCollection extends App.Entities.Collection
    model: Entities.NadaVehicle

    url: ->
      Routes.nada_vehicles_path(this.url_options.options)

  API =
    getNadaVehicles: (options) ->
      vehicles = new Entities.NadaVehiclesCollection
      vehicles.url_options = options
      vehicles.fetch
        reset: true
      vehicles

    getNadaVehicle: (id, options) ->
      vehicle = new Entities.NadaVehicle
        id: id
        options: options
      vehicle.fetch()
      vehicle

  App.reqres.setHandler "nada:vehicles:entities", (options) ->
    API.getNadaVehicles options

  App.reqres.setHandler "nada:vehicle:entity", (id, options) ->
    API.getNadaVehicle id, options


