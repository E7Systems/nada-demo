@Blinker.module "Entities", (Entities, App, Backbone, Marionette, $, _ ) ->

  class Entities.NadaModel extends App.Entities.Model
    url: ->
      Routes.nada_model_path(this.id, this.get('options')  )

  class Entities.NadaModelsCollection extends App.Entities.Collection
    model: Entities.NadaModel

    url: ->
      Routes.nada_models_path(this.url_options.options)

  API =
    getNadaModels: (options) ->
      models = new Entities.NadaModelsCollection
      models.url_options = options
      models.fetch
        reset: true
      models

    getNadaModel: (id, options) ->
      model = new Entities.NadaModel
        id: id
        options: options
      model.fetch()
      model

  App.reqres.setHandler "nada:models:entities", (options)->
    API.getNadaModels(options)

  App.reqres.setHandler "nada:model:entity", (id, options) ->
    API.getNadaModel id, options


