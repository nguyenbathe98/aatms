class Trainees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @trainee = Trainee.find_for_oauth(request.env["omniauth.auth"], current_trainee)

        if @trainee.persisted?
          sign_in @trainee, event: :authentication
          if @trainee.email_verified?
            redirect_to root_path
          else
            redirect_to finish_signup_path(@trainee)
          end
          set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
        else
          session["devise.#{provider}_data"] = env["omniauth.auth"]
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:twitter, :facebook, :google_oauth2].each do |provider|
    provides_callback_for provider
  end

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
