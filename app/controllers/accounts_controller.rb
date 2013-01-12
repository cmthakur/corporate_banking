class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def show
  end

  def index
    @accounts = Account.all.to_a
  end
end
