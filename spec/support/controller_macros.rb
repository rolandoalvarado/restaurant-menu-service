module ControllerMacros
  def self.included(base)
    base.extend(ClassMethods)
  end
  
  module ClassMethods
    def authorized_user!(*actions)
      actions.each do |action|
        it "#{action} action should require to login." do
          get action
          expect(response).to redirect_to(signin_path)
        end
      end
    end
  end

  def login_user
    before do
      user = FactoryBot.create(:user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      current_user = user
      sign_in user
    end
  end

  def redirects_unauthorized(*actions)
    actions.each do |action|
      context "without authorization" do
        it "should redirect to login page" do
          get action
          expect(response).to redirect_to(signin_path)
        end
      end
    end
  end
end
