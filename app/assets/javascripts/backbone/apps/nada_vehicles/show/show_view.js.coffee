@Blinker.module "NadaVehiclesApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "nada_vehicles/show/show_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      vehiclesRegion: "#vehicles-region"

  class Show.Title extends App.Views.ItemView
    template: "nada_vehicles/show/_title"

  class Show.Panel extends App.Views.ItemView
    template: "nada_vehicles/show/_panel"

  class Show.PriceObject extends App.Views.ItemView
    template: "nada_vehicles/show/_price_object"

  class Show.NadaVehicle extends App.Views.ItemView
    template: "nada_vehicles/show/_nada_vehicle"
    tagName: "div"
    className: "nada-vehicle-details"

    modelEvents:
      "updated":  "render"

    events:
      "click .vehicle-back": ->
        location.reload()

    triggers:
      "form:submit": "nada:price:show"

#    onFormSubmit: (data) ->
#      console.log("OnFormSubmit", data)
#      false


    form:
      buttons:
        primary: "Get Price"
        cancel: false

