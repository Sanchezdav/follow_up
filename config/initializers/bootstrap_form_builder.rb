class BootstrapFormBuilder < ActionView::Helpers::FormBuilder
  def label_default(method, text = nil, options = {}, &block)
    label(method, text, merge_class(options, 'form-label'), &block)
  end

  def text_field(method, options = {})
    super(method, merge_class(options, 'form-control'))
  end

  def number_field(method, options = {})
    super(method, merge_class(options, 'form-control'))
  end

  def email_field(method, options = {})
    super(method, merge_class(options, 'form-control'))
  end

  def password_field(method, options = {})
    super(method, merge_class(options, 'form-control'))
  end

  def text_field_with_label(method, options = {})
    label_default(method) + text_field(method, options) + attribute_errors(@object, method)
  end

  def number_field_with_label(method, options = {})
    label_default(method) + number_field(method, options) + attribute_errors(@object, method)
  end

  def email_field_with_label(method, options = {})
    label_default(method) + email_field(method, options) + attribute_errors(@object, method)
  end

  def password_field_with_label(method, options = {})
    label_default(method) + password_field(method, options) + attribute_errors(@object, method)
  end

  private

  def attribute_errors(resource, method)
    @template.content_tag(:span, class: 'form-text text-danger') do
      return '' unless resource.errors.has_key?(method)

      resource.errors.full_messages_for(method).join(', ')
    end
  end

  def merge_class_attribute_value(options, value)
    new_options = options.clone
    new_options[:class] = [value, new_options[:class]].join(" ")
    new_options
  end

  alias_method :merge_class, :merge_class_attribute_value
end
