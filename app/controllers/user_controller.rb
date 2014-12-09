class UserController < ApplicationController
	def profile
		@user = User.where(id: current_user.id)
	end

	def new
		@user = User.new
	end

	def edit
		@user = User.new
	end

	def update_profile
		@user = User.where(id: current_user.id)
		respond_to do |format|
			if @user.update(current_user.id, user_params)
				format.html { redirect_to root_path, notice: 'Profile was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :full_address, :avatar)
	end
end
