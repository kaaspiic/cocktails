//= require ./../application.js

Cocktails.Select2 = class Select2 {
  constructor($select) {
    $select.select2({
      tags: $select.attr('allowcreate'),
      createTag: (params) => {
        var term = $.trim(params.term);

        if (term === '') return null

        return {
          id: term,
          text: term,
          newTag: true
        }
      }
    })
  }
}
