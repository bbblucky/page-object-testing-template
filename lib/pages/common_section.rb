require 'site_prism'

module Page

  class Header < SitePrism::Section
    attr_accessor :sign_in
    element :sign_in, :xpath, "//a[text()='Sign in']"
  end

end
