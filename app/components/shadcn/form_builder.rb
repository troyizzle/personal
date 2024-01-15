class Shadcn::FormBuilder < ActionView::Helpers::FormBuilder
  def label(method, options = {})
    error_class = @object.errors[method].any? ? 'error' : ''
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_label(name: "#{object_name}[#{method}]", label: label_for(@object, method), **options)
  end

  def text_field(method, options = {})
    input_field(method, 'text', options)
  end

  def password_field(method, options = {})
    input_field(method, 'password', options)
  end

  def email_field(method, options = {})
    input_field(method, 'email', options)
  end

  def date_field(method, options = {})
    input_field(method, 'date', options)
  end

  def submit(value = nil, options = {})
    @template.render_button(value, **options)
  end

  private

  def input_field(method, type, options = {})
    error_class = @object.errors[method].any? ? 'error' : ''
    options[:class] = @template.tw("#{options[:class]} #{error_class}")
    @template.render_input(
      name: "#{object_name}[#{method}]",
      id: "#{object_name}_#{method}",
      value: @object.send(method),
      type:,
      **options
    )
  end

  def label_for(object, method)
    return method.capitalize if object.nil?

    object.class.human_attribute_name(method)
  end
end
