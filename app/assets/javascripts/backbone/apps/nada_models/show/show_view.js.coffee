@Blinker.module "NadaModelsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "nada_models/show/show_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      modelsRegion: "#models-region"

  class Show.Title extends App.Views.ItemView
    template: "nada_models/show/_title"

  class Show.Panel extends App.Views.ItemView
    template: "nada_models/show/_panel"

  class Show.NadaModel extends App.Views.ItemView
    template: "nada_models/show/_nada_model"
    tagName: "div"
    className: "nada-model-details"