//= require ./../application.js

Cocktails.Comments = class Comments {
  constructor($form) {
    this.form = $form
    this.delegateEvents()
  }

  delegateEvents() {
    this.form.on('ajax:success', $.proxy(this.processSuccess, this))
    this.form.on('ajax:error', $.proxy(this.renderError, this))

    this.form.closest('div.comment').find("[data-action='edit']").click(this.toggleEdit)
    this.form.closest('div.comment').find("[data-action='delete']").click(this.removeComment)
  }

  toggleEdit(e) {
    e.preventDefault()

    var $form = $(e.target).closest('.comment').find('form')

    $form.attr('hidden') ? $form.removeAttr('hidden') : $form.attr('hidden', true)
  }

  removeComment(e) {
    $(e.target).closest('.comment').remove()
  }

  processSuccess() {
    $('.drink-comments').load(`${Routes.drink_path(this.form.attr('data-drink'))} .drink-comments >`, () => {
      Cocktails.load($('.drink-comments'))
    })
  }

  renderError() {
    this.form.find('textarea').attr('aria-invalid', true)
    if (!this.form.find('div.comment_text .help-block').length)
      this.form.find('div.comment_text .col-sm-9').append(`<span class='help-block'>${I18n.t('errors.messages.blank')}</span>`)
  }
}
