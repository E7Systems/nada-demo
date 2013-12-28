@Blinker.module "NadaMakesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->

      make  = App.request "nada:make:entity", options.id, options.year

      App.execute "when:fetched", make, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion make
          @panelRegion make
          @makesRegion make

        @show @layout

    onClose: ->
      console.info "closing controller!"

    titleRegion: (make) ->
      titleView = @getTitleView(make)
      @layout.titleRegion.show titleView

    panelRegion: (make) ->
      panelView = @getPanelView(make)

      @layout.panelRegion.show panelView

    makesRegion: (make)->
      makeView = @getMakeView(make)

      @layout.makesRegion.show makeView


    getLayoutView: ->
      new Show.Layout

    getTitleView: (make) ->
      new Show.Title
        model: make

    getPanelView: (make) ->
      new Show.Panel
        model: make

    getMakeView: (make) ->
      new Show.NadaMake
        model: make




