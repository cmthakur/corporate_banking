class CashCollectionsController < ApplicationController
  before_filter :authenticate_member!

  def index
    if current_member.type == "3"
      @collections = CashCollection.order('created_at').limit(50)
    else
      @collections = current_member.cash_collections.order('created_at')
    end
  end

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
end