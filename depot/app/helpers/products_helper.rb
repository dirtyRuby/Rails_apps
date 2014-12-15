module ProductsHelper
  def locale_select
    options_for_select(LANGUAGES)
  end
end
