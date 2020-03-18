class SessionsController < Devise::SessionsController

# use custom methods to redirect our host
def after_sign_in_path_for(resource)
 "/hosts/#{resource.id}"
end

end
