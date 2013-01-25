class DashboardController < ApplicationController
  # before_filter :authenticate_user!

  def index
    @links_tags = {'account_department' => accounts_path, 'staff_department' => members_path, 'collection_department' => cash_collections_path}
  end
end
