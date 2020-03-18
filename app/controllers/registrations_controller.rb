class RegistrationsController < Devise::RegistrationsController

# use custom methods to redirect our host
def after_sign_up_path_for(resource)
 "/hosts/#{resource.id}"
end

end
