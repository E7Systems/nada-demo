@Blinker.module "NadaMakesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base
    
    initialize:  ->
      makes = App.request "nada:makes:entities"
#      console.log(makes)

      App.execute "when:fetched", makes, =>
        @layout = @getLayoutView()

        @listenTo @layout, "close", @close

        @listenTo @layout, "show", =>
          @titleRegion()
          @panelRegion()
          @makesRegion makes

        @show @layout


    onClose: ->
      console.info "closing controller!"

    titleRegion: ->
      titleView = @getTitleView()
      @layout.titleRegion.show titleView

    panelRegion: ->
      panelView = @getPanelView()

      @layout.panelRegion.show panelView

    makesRegion: (makes)->
      makesView = @getMakesView makes

      makesView.on "itemview:show:nada:make:clicked", (iv, make) ->
        console.log ('nada-make clicked.')
        #          App.vent.trigger "show:nada:make:clicked", make
      @layout.makesRegion.show makesView


    getLayoutView: ->
      new List.Layout

    getTitleView: ->
      new List.Title

    getPanelView: ->
      new List.Panel

    getMakesView: (makes)->
      new List.NadaMakes
        collection: makes
