class CashCollectionsController < ApplicationController
  def new
    @collection = CashCollection.new
  end

  def create
    current_member = Member.first
    collection_data = params['cash_collection']
    @member = current_member
    @account = Account.find_by_name(collection_data['account_id'])
    @collection = @account.cash_collections.build({amount: collection_data['amount'], member_id: current_member.id})
    respond_to do |format|
      if @collection.save!
        format.html { redirect_to cash_collections_path, notice: 'Cash collected successfully!'}
      else
        format.html { render action: "new", alert: "Account name is invalid" }
      end
    end

  end

  def show
  end

  def index
    @collection = CashCollection.all.to_a
  end
end
