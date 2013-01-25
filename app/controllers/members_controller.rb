class MembersController < ApplicationController
  before_filter :authenticate_member!
  before_filter :check_existance_of_profile, :only => [:show]

  def index
    @members = Member.all.to_a
  end

  def new
    @member = Member.new
  end

  def create
    member_data =  params['member'].except('profile')
    profile_data = params['member']['profile']
    @member = Member.new(member_data)
    Member.transaction do
      @member.save
      @profile = Profile.create(profile_data.merge({:member_id => @member.id}))
      @member.profile = @profile
      @member.save
    end
    respond_to do |format|
      if Member.last == @member
        format.html { redirect_to members_path, notice: 'Member created successfully!'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def show
    @member = Member.find(params['id'])
    @profile = @member.profile
    @collections = @member.cash_collections
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  def edit
    @member = Member.find(params['id'])
  end

  def update
    @member = Member.find(params['id'])
    member_data =  params['member'].except('profile')
    profile_data = params['member']['profile']
    @member.update_attributes(member_data)
    Member.transaction do
      @member.save
      @profile = Profile.create(profile_data.merge({:member_id => @member.id}))
      @member.profile = @profile
      @member.save
    end
    respond_to do |format|
      if Member.last == @member
        format.html { redirect_to members_path, notice: 'Member created successfully!'}
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @member = Member.find(params['id'])
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_path, notice: 'Member deleted successfully!' }
    end
  end

  private

  def check_existance_of_profile
    if current_member
      member = current_member ||  Member.find(params["id"])
      unless member.profile
        redirect_to edit_member_path(member)
      end
    end
  end
end
