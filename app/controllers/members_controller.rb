class MembersController < ApplicationController
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
    respond_to do |format|
      format.html # show.html.erb
      format.js
    end
  end

  def edit
    @member = Member.find(params['id'])
  end

  def index
    @members =  Member.all.to_a
  end

  def destroy
    @member = Member.find(params['id'])
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_path, notice: 'Member deleted successfully!' }
    end
  end

end
