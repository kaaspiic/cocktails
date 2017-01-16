//= require ./../application.js

Cocktails.PreparationSteps = class PreparationSteps {
  constructor($form) {
    this.form = $form
    this.delegateEvents()
  }

  delegateEvents() {
    this.form.find("[data-action='add']").click($.proxy(this.addStep, this))
    this.form.on('click', "[data-action='remove']", $.proxy(this.removeStep, this))
  }

  addStep(e) {
    e.preventDefault()
    this.form.append($(this.template()))
    $(document).scrollTop($(document).height())
  }

  removeStep(e) {
    var preparationStep = $(e.target).closest('div.drink-preparation-step')
    preparationStep.attr('hidden', true)
    preparationStep.find("[name$='[_destroy]']").val(true)
  }

  template() {
    var id = Date.now()

    return(
      "<div class='drink-preparation-step card mb-3'>" +
        "<div class='card-block'>" +
          "<h5><a class='ml-3' data-action='remove' href='#'><i class='fa fa-minus-square mr-2'></i>Dzēst</a></h5>" +
          "<input value='false' name='drink[preparation_steps_attributes][" + id + "][_destroy]' id='drink_preparation_steps_attributes_" + id + "__destroy' type='hidden'>" +
          "<div class='form-group row string required drink_preparation_steps_title'>" +
            "<div class='col-sm-3'>" +
              "<label class='control-label string required' for='drink_preparation_steps_attributes_" + id + "_title'>" + I18n.t('activerecord.attributes.preparation_step.title') + "</label>" +
            "</div>" +
            "<div class='col-sm-9'>" +
              "<input class='form-control string required' name='drink[preparation_steps_attributes][" + id + "][title]' id='drink_preparation_steps_attributes_" + id + "_title' type='text'>" +
            "</div>" +
          "</div>" +
          "<div class='form-group row text required drink_preparation_steps_description'>" +
            "<div class='col-sm-3'>" +
              "<label class='control-label text required' for='drink_preparation_steps_attributes_" + id + "_description'>" + I18n.t('activerecord.attributes.preparation_step.description') + "</label>" +
            "</div>" +
            "<div class='col-sm-9'>" +
              "<textarea class='form-control text required' name='drink[preparation_steps_attributes][" + id + "][description]' id='drink_preparation_steps_attributes_" + id + "_description'></textarea>" +
            "</div>" +
          "</div>" +
          "<div class='form-group row string optional drink_preparation_steps_time_needed'>" +
            "<div class='col-sm-3'>" +
              "<label class='control-label string optional' for='drink_preparation_steps_attributes_" + id + "_time_needed'>" + I18n.t('activerecord.attributes.preparation_step.time_needed') + "</label>" +
            "</div>" +
            "<div class='col-sm-9'>" +
              "<input class='form-control string optional' name='drink[preparation_steps_attributes][" + id + "][time_needed]' id='drink_preparation_steps_attributes_" + id + "_time_needed' type='text'>" +
            "</div>" +
          "</div>" +
        "</div>" +
      "</div>"
    )
  }
}
