@Blinker.module "NadaModelsApp", (NadaModelsApp, App, Backbone, Marionette, $, _) ->

  class NadaModelsApp.Router extends Marionette.AppRouter
    appRoutes:
      "nada_models"    : "listModels"

  API =
    listModels: (options) ->
      new NadaModelsApp.List.Controller
        options: options

  App.addInitializer ->
    new NadaModelsApp.Router
      controller: API