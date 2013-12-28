@Blinker.module "NadaMakesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "nada_makes/show/show_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      makesRegion: "#makes-region"

  class Show.Title extends App.Views.ItemView
    template: "nada_makes/show/_title"

  class Show.Panel extends App.Views.ItemView
    template: "nada_makes/show/_panel"

  class Show.NadaMake extends App.Views.ItemView
    template: "nada_makes/show/_nada_make"
    tagName: "div"
    className: "nada-make-details"

#    events:
#      "click .nada-make-year": -> 'addChild'
#    triggers:
#      "click" : "nada:make:year:clicked"

