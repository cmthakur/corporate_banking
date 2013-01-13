class AccountsController < ApplicationController
  def index
    @accounts = Account.all.to_a
  end

  def new
    @account = Account.new
    @profile = Profile.new
  end

  def create
    account_data =  params['account'].except('profile')
    profile_data = params['account']['profile']
    @account = Account.new(account_data)
    Account.transaction do
      @account.save
      @profile = Profile.create(profile_data.merge({:account_id => @account.id}))
      @account.profile = @profile
      @account.save
    end
    respond_to do |format|
      if Account.last == @account
        format.html { redirect_to accounts_path, notice: 'Account created successfully!'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
  end
end
