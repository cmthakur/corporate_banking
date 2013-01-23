class CashCollectionsController < ApplicationController
  autocomplete :account, :id, :display_value => :get_name

  def new
    @collection = CashCollection.new
  end

  def create
    collection_data = params['cash_collection']
    @account = Account.find collection_data['account_id']
    collection = @account.cash_collections.new({amount: collection_data['amount'], member_id: current_member.id})
    respond_to do |format|
      if collection.save!
        format.html { redirect_to cash_collections_path, notice: 'Cash collected successfully!'}
      else
        format.html { render action: "new", alert: "Account name is invalid" }
      end
    end

  end

  def show
  end

  def index
    @collections = current_member.cash_collections#CashCollection.all.to_a
  end
end
