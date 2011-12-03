class HomeController < ApplicationController
  def index
  end

  def trigger
    @socialize_plans = SocializePlan.all
    @socialize_plans.each{|s| SocializePlan.process_activity(s.identifier)}
    render 'done'
  end

end
