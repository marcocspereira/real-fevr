module ControllerMacros
  # Define login methods

  RSpec.shared_context :login_admin do
    before { sign_in create(:admin) }
  end

  RSpec.shared_context :login_user do
    before { sign_in create(:user) }
  end
end