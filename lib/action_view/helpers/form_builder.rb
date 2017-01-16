ActionView::Helpers::FormBuilder.class_eval do
  def submit_button(action)
    form = if action == 'new'
             "new_#{object.class.model_name.singular}"
           else
            "edit_#{object.class.model_name.singular}_#{object.id}"
          end

    button(:button, I18n.t('save'), class: 'btn btn-outline-primary', form: form)
  end
end
