class SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
      params[:username],
      params[:password]
    )

    if @user
      ip_address = request.env['ipinfo'].ip
      # sets a default location if we are testing on localhost
      if ip_address == '127.0.0.1'
        current_location = [38.5816, 121.4944]
      else
        current_location = request.env['ipinfo'].loc.split(',').map(&:to_i)
      end

      # no need to run database query if previous and current ip are matching
      if ip_address == @user.last_login_ip
        return @user.last_login_distance
      end

      closest_ip = nil
      closest_ip_distance = nil

      Login.where({ user_id: @user.id }).each do |prev_login|
        distance = prev_login.calculate_distance(current_location)

        if closest_ip_distance.nil? || distance < closest_ip_distance
          closest_ip = prev_login.ip_address
          closest_ip_distance = distance
        end
      end

      @user.update({ last_login_ip: closest_ip, last_login_distance: closest_ip_distance})
      render json: { distance: closest_ip_distance }
    else
      render json: ["Invalid username/password combination"]
    end
  end
end
