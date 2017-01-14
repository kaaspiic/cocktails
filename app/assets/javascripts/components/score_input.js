//= require ./../application.js

Cocktails.ScoreInput = class ScoreInput {
  constructor($scoreInput) {
    this.scoreInput = $scoreInput
    this.delegateEvents()
  }

  delegateEvents() {
    this.scoreInput.find('i').on('click', $.proxy(this.setScore, this))
    this.scoreInput.find('i').on('mouseenter', $.proxy(this.setHoverClass, this))
    this.scoreInput.find('i').on('mouseleave', $.proxy(this.resetScore, this))
  }

  setHoverClass(e) {
    this.setClasses(this.scoreInput.find('i.fa').index($(e.target)) + 1)
  }

  resetScore(e) {
    this.setClasses(this.scoreInput.find('input').val())
  }

  setScore(e) {
    var score = $(e.target).attr('data-value')

    this.scoreInput.find('input').val(score)
    this.setClasses(score)
  }

  setClasses(index) {
    this.scoreInput.find('i.fa').each((i, el) => {
      if (index <= i) {
        $(el).addClass('fa-star-o').removeClass('fa-star')
      } else {
        $(el).addClass('fa-star').removeClass('fa-star-o')
      }
    })
  }
}
