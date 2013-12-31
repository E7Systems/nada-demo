@Blinker.module "NadaVehiclesApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "nada_vehicles/list/list_layout"

    regions:
      titleRegion: "#title-region"
      panelRegion: "#panel-region"
      vehiclesRegion: "#vehicles-region"

  class List.Title extends App.Views.ItemView
    template: "nada_vehicles/list/_title"

  class List.Panel extends App.Views.ItemView
    template: "nada_vehicles/list/_panel"

  class List.NadaVehicle extends App.Views.ItemView
    template: "nada_vehicles/list/_nada_vehicle"
    tagName: "li"
    className: "nada-vehicle"

  class List.Empty extends App.Views.ItemView
    template: "nada_vehicles/list/_empty"
    tagName: "li"

  class List.NadaVehicles extends App.Views.CompositeView
    template: "nada_vehicles/list/_nada_vehicles"
    itemView: List.NadaVehicle
    emptyView: List.Empty
    itemViewContainer: ".vehicle-list"