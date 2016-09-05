class RegistrationsController < Devise::RegistrationsController  
	before_action :set_organization, only: [:create]

	def new
		super
	end

	def create
		super
	end

	private  

	def sign_up_params  
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation).merge(organization_id: @organization.id)
	end 

	def account_update_params  
		params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)  
	end  

	def organization_params  
		params.require(:user).permit(:company_name)
	end  

	def set_organization
		@organization = Organization.new(name: organization_params[:company_name])
		@organization.save
	end

end  