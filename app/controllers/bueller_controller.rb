class BuellerController < ApplicationController
  def index
    @bueller = Student.all
  end
end