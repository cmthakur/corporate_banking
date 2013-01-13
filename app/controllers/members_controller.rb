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
  end

  def index
    @members =  Member.all.to_a
  end
end
