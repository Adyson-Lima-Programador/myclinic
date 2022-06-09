class CustomersController < ApplicationController

  before_action :set_customer, only: %i[show edit update destroy]

  def index
  end

end