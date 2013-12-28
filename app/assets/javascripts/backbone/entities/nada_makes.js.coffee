@Blinker.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.NadaMake extends App.Entities.Model

    url: ->
      Routes.nada_make_path(this.id, { year: this.get('year') })

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

    getNadaMake: (id, year) ->
      make = new Entities.NadaMake
        id: id
        year: year
      make.fetch()
      make

  App.reqres.setHandler "nada:makes:entities", ->
    API.getNadaMakes()

  App.reqres.setHandler "nada:make:entity", (id, year) ->
    API.getNadaMake id, year


