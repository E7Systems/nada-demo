@Blinker.module "NadaModelsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "nada_models/list/list_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      modelsRegion: "#models-region"

  class List.Title extends App.Views.ItemView
    template: "nada_models/list/_title"

  class List.Panel extends App.Views.ItemView
    template: "nada_models/list/_panel"

  class List.NadaModel extends App.Views.ItemView
    template: "nada_models/list/_nada_model"
    tagName: "div"
    className: "nada-model"

  class List.Empty extends App.Views.ItemView
    template: "nada_models/list/_empty"
    tagName: "div"

  class List.NadaModels extends App.Views.CompositeView
    template: "nada_models/list/_nada_models"
    itemView: List.NadaModel
    emptyView: List.Empty
    itemViewContainer: "div"
