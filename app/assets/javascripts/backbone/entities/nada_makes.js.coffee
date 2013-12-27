@Blinker.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.NadaMake extends App.Entities.Model
    url: ->
      Routes.nada_make_path(this.id, params: { year: 2010})

  class Entities.NadaMakesCollection extends App.Entities.Collection
    model: Entities.NadaMake

    url: ->
      Routes.nada_makes_path()

  API =
    getNadaMakes: ->
      makes = new Entities.NadaMakesCollection
      makes.fetch
        reset: true
      makes

    getNadaMake: (id) ->
      make = new Entities.NadaMake
        id: id
      make.fetch()
      make

  App.reqres.setHandler "nada:makes:entities", ->
    API.getNadaMakes()

  App.reqres.setHandler "nada:make:entity", (id) ->
    API.getNadaMake id


