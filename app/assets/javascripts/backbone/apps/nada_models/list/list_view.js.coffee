@Blinker.module "NadaModelsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "nada_models/list/list_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      newRegion: "#new-region"
      modelsRegion: "#models-region"

  class List.Title extends App.Views.ItemView
    template: "nada_models/list/_title"

  class List.Panel extends App.Views.ItemView
    template: "nada_models/list/_panel"

  class List.NadaMake extends App.Views.ItemView
    template: "nada_models/list/_nada_make"
    tagName: "li"
    className: "nada-make"

  class List.Empty extends App.Views.ItemView
    template: "nada_models/list/_empty"
    tagName: "li"

  class List.NadaMakes extends App.Views.CompositeView
    template: "nada_models/list/_nada_models"
    itemView: List.NadaMake
    emptyView: List.Empty
    itemViewContainer: "ul"
