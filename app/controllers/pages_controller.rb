class PagesController < ApplicationController
  skip_authorization_check
  def home
  end

  def about
  @title = "About Us"
  end

  def contact
  @title = "Contact Us"
  end

  def privacy
  @title = "Privacy Policy"
  end
end
