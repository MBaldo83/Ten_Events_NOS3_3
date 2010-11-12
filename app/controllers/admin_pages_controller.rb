class AdminPagesController < ApplicationController

before_filter :authenticate

  def A_Summary
    @title = "Ten Events Summary"
  end

end
