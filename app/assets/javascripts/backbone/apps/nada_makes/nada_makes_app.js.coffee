@Blinker.module "NadaMakesApp", (NadaMakesApp, App, Backbone, Marionette, $, _) ->

  class NadaMakesApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_makes/:id(/:year)" : "showNadaMake"
      "nada_makes"             : "listNadaMakes"

  API =
    listNadaMakes: ->
      new NadaMakesApp.List.Controller

    showNadaMake: (id) ->
      new NadaMakesApp.Show.Controller
        id: id

#  App.vent.on "nada:make:year:clicked", (e) ->
#    console.log(e.view)
#    Backbone.history.navigate "nada_make/" + id + "/" + year
#    API.showMake(id);


  App.addInitializer ->
    new NadaMakesApp.Router
      controller: API

