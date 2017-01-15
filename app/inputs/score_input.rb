class ScoreInput < SimpleForm::Inputs::Base
  attr_accessor :output_buffer

  def input(wrapper_options)
    score = options[:value] || object.send(attribute_name)
    translation_scope = I18n.t(options[:translation_scope])

    content_tag :div, data: { component: 'ScoreInput' } do
      ActiveSupport::SafeBuffer.new.tap do |content|
        content << content_tag(:input, '', name: "#{object_name}[#{attribute_name}]", hidden: true, value: score)

        5.times do |i|
          css_class = score.to_i <= i ? 'fa fa-star-o' : 'fa fa-star'
          title     = translation_scope[i + 1]
          content << content_tag(
            :i,
            "<div class='mdl-tooltip' data-mdl-for=#{i}>#{title}</div>".html_safe,
            id: i,
            class: css_class,
            data: { value: i + 1 }
          )
        end
      end
    end
  end
end
