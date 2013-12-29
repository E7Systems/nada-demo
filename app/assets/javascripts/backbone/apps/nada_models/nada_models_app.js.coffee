@Blinker.module "NadaModelsApp", (NadaModelsApp, App, Backbone, Marionette, $, _) ->

  class NadaModelsApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_models"    : "listModels"
      "nada_model/:id" : "showModel"

  API =
    listModels: (options) ->
      new NadaModelsApp.List.Controller
        options: options

    showModel: (id, options) ->
      new NadaModelsApp.Show.Controller
        id: id
        options: options

  App.addInitializer ->
    new NadaModelsApp.Router
      controller: API