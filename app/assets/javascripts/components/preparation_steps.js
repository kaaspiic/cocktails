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

  addStep() {
    this.form.append($(this.template()))
  }

  removeStep(e) {
    var preparationStep = $(e.target).closest('div.drink-preparation-step')
    preparationStep.attr('hidden', true)
    preparationStep.find("[name$='[_destroy]']").val(true)
  }

  template() {
    var id = Date.now()

    return(
      "<div class='drink-preparation-step'>" +
        "<span data-action='remove'>Remove</span>" +
        "<input value='false' name='drink[preparation_steps_attributes][" + id + "][_destroy]' id='drink_preparation_steps_attributes_" + id + "__destroy' type='hidden'>" +
        "<div class='form-group row string required drink_preparation_steps_title'>" +
          "<div class='col-sm-3'>" +
            "<label class='control-label string required' for='drink_preparation_steps_attributes_" + id + "_title'>Title</label>" +
          "</div>" +
          "<div class='col-sm-9'>" +
            "<input class='form-control string required' name='drink[preparation_steps_attributes][" + id + "][title]' id='drink_preparation_steps_attributes_" + id + "_title' type='text'>" +
          "</div>" +
        "</div>" +
        "<div class='form-group row string required drink_preparation_steps_description'>" +
          "<div class='col-sm-3'>" +
            "<label class='control-label string required' for='drink_preparation_steps_attributes_" + id + "_description'>Description</label>" +
          "</div>" +
          "<div class='col-sm-9'>" +
            "<input class='form-control string required' name='drink[preparation_steps_attributes][" + id + "][description]' id='drink_preparation_steps_attributes_" + id + "_description' type='text'>" +
          "</div>" +
        "</div>" +
        "<div class='form-group row string optional drink_preparation_steps_time_needed'>" +
          "<div class='col-sm-3'>" +
            "<label class='control-label string optional' for='drink_preparation_steps_attributes_" + id + "_time_needed'>Time needed</label>" +
          "</div>" +
          "<div class='col-sm-9'>" +
            "<input class='form-control string optional' name='drink[preparation_steps_attributes][" + id + "][time_needed]' id='drink_preparation_steps_attributes_" + id + "_time_needed' type='text'>" +
          "</div>" +
        "</div>" +
      "</div>"
    )
  }
}
