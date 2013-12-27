@Blinker.module "NadaModelsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    listModels: ->
      models = App.request "nada:models:entities"

      App.execute "when:fetched", models, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion()
          @panelRegion()
          @modelsRegion models

        @show @layout


    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: (models) ->
      panelView = @getPanelView()

      @layout.panelRegion.show panelView

    modelsRegion: (models)->
      modelsView = @getModelsView models

      @layout.modelsRegion.show modelsView


    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getModelsView: (models)->
      new List.NadaModels
        collection: models
