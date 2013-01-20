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
      @account.balance = Balance.create(:account_id => @account.id)
      @account.save!
    end
    respond_to do |format|
      if Account.last == @account
        format.html { redirect_to accounts_path, notice: 'Account created successfully!'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def edit
    @account = Account.find(params['id'])
  end

  def show
    @account = Account.find(params['id'])
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  def destroy
    @account = Account.find(params['id'])
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_path, notice: 'Account deleted successfully!' }
    end
  end


end
