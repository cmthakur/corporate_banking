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
    collection_data = params['cash_collection'].merge!(params['collecton_type'])
    @account = Account.where(id: collection_data['account_id']).first
    respond_to do |format|
      if @account.present?
        collection = @account.cash_collections.new(collection_data.except('account_id').merge({member_id: current_member.id}))
        if collection.save!
          format.html { redirect_to cash_collections_path, notice: 'Cash collected successfully!'}
        else
          format.html { render action: "new", alert: "Collection can not be done for this account." }
        end
      else
        format.html {redirect_to new_cash_collection_path, :alert => "Account do not exists !" }
      end
    end
  end
end