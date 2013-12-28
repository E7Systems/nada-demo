@Blinker.module "NadaMakesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "nada_makes/list/list_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      makesRegion: "#makes-region"

  class List.Title extends App.Views.ItemView
    template: "nada_makes/list/_title"

  class List.Panel extends App.Views.ItemView
    template: "nada_makes/list/_panel"

  class List.NadaMake extends App.Views.ItemView
    template: "nada_makes/list/_nada_make"
    tagName: "li"
    className: "nada-make"

    events:
      "click .nada-make": -> @trigger "show:nada:make:clicked", @model
    

  class List.Empty extends App.Views.ItemView
    template: "nada_makes/list/_empty"
    tagName: "li"

  class List.NadaMakes extends App.Views.CompositeView
    template: "nada_makes/list/_nada_makes"
    itemView: List.NadaMake
    emptyView: List.Empty
    itemViewContainer: "ul"
