@Blinker.module "NadaModelsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->

      models = App.request "nada:models:entities", options

      App.execute "when:fetched", models, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion models
          @panelRegion models
          @modelsRegion models

        @show @layout

    onClose: ->
      console.info "closing controller!"

    titleRegion: (models) ->
      titleView = @getTitleView(models)

      @layout.titleRegion.show titleView

    panelRegion: (models) ->
      panelView = @getPanelView(models)

      @layout.panelRegion.show panelView

    modelsRegion: (models)->
      modelsView = @getModelsView models

      @layout.modelsRegion.show modelsView


    getLayoutView: ->
      new List.Layout

    getTitleView: (models) ->
      new List.Title
        collection: models

    getPanelView: (models) ->
      new List.Panel
        collection: models

    getModelsView: (models)->
      new List.NadaModels
        collection: models
