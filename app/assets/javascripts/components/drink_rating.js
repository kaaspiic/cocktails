//= require ./../application.js

Cocktails.DrinkRating = class DrinkRating {
  constructor($form) {
    this.form = $form
    this.delegateEvents()
  }

  delegateEvents() {
    this.form.find('i.fa').click($.proxy(this.showSaveButton, this))
    this.form.on('ajax:success', $.proxy(this.updateRatings, this))
  }

  showSaveButton() {
    this.form.find("input[type='submit']").removeAttr('hidden')
  }

  updateRatings() {
    $('.drink-ratings').load(`${Routes.drink_path(this.form.attr('data-drink'))} .drink-ratings >`, () => {
      Cocktails.load($('.drink-ratings'))
      componentHandler.upgradeDom()
    })
  }
}
