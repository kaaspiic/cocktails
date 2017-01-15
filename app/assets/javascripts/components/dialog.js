//= require ./../application.js

Cocktails.Dialog = class Dialog {
  constructor($dialog) {
    this.$dialog = $dialog
    this.dialog = document.querySelector('dialog')
    dialogPolyfill.registerDialog(this.dialog)

    this.delegateEvents()
  }

  delegateEvents() {
    this.$dialog.find("[data-action='close']").click($.proxy(this.closeDialog, this))
    this.$dialog.find("[data-action='show']").click($.proxy(this.showDialog, this))
  }

  closeDialog() {
    this.dialog.close()
  }

  showDialog() {
    this.dialog.showModal()
  }
}
