module OrdersHelper
  def payment_type_options
    options_for_select(Payment.names.map { |o| [I18n.t(".#{o}").capitalize,o]})
  end
end