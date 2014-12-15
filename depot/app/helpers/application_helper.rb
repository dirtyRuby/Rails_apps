module ApplicationHelper
  def hidden_div_if condition, attributes = {}, &block
    if condition
      attributes['style'] = "display: none"
    end
    content_tag('div', attributes, &block)
  end

  #Task K. playtime #2
  def currency_to_locale number
    if params[:locale] == 'es'
      number = number*1.3
    end
    number_to_currency number
  end
end
