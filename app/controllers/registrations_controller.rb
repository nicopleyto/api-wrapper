class RegistrationsController < Devise::RegistrationsController
    skip_around_action :set_time_zone

    def create
      super do |resource|
        resource.update(time_zone: params[:user][:time_zone])
      end
    end
end