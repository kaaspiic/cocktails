// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require material-design-lite
//= require select2
//= require js-routes
//= require i18n
//= require i18n/translations
//= require dialog-polyfill.js
//= require_tree .


Cocktails = {
  load: ($container = $(document)) => {
    $container.find('[data-component]').each((_index, el) => {
      var $el = $(el)
      var className = $el.attr('data-component')

      if (Cocktails[className]) new Cocktails[className]($el)
    })
  }
}

$(document).ready(() => {
  I18n.locale = $('head').attr('locale') || 'lv'
  Cocktails.load()
})
