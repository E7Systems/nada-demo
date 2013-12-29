@Blinker.module "NadaModelsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { id, options } = options
      model  = App.request "nada:model:entity", id, options

      App.execute "when:fetched", model, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion model
          @panelRegion model
          @modelsRegion model

        @show @layout

    onClose: ->
      console.info "closing controller!"

    titleRegion: (model) ->
      titleView = @getTitleView(model)

      @layout.titleRegion.show titleView

    panelRegion: (model) ->
      panelView = @getPanelView(model)

      @layout.panelRegion.show panelView

    modelsRegion: (model)->
      modelView = @getModelView(model)

      @layout.modelsRegion.show modelView


    getLayoutView: ->
      new Show.Layout

    getTitleView: (model) ->
      new Show.Title
        model: model

    getPanelView: (model) ->
      new Show.Panel
        model: model

    getModelView: (model) ->
      new Show.NadaModel
        model: model
