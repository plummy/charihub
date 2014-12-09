class StaticPagesController < ApplicationController

	def index
		@user = User.where(:id => current_user.id)
	end
	def dashboard
		@post = Post.new
		@user = User.where(:id => current_user.id)
		
	end

	def create_post
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		respond_to do |format|
			if @post.save
				return render :json => {:success => true}
			else
				return render :json => {:success => false, :message=> @post.errors.join(", ")}
			end
		end
	end

	def preview_dashboard
		respond_to do | format |
			format.js {render :layout => false}
		end
	end

	def preview_map
		respond_to do | format |
			format.js {render :layout => false}
		end
	end

	def preview_map
		respond_to do | format |
			format.js {render :layout => false}
		end
	end

	def preview_stats
		@post_share = Post.joins(:category).group("categories.name").where(:post_type => 0).count
		@post_need = Post.joins(:category).group("categories.name").where(:post_type => 1).count
		respond_to do | format |
			format.js {render :layout => false}
		end
	end

	private

	def post_params
		params.require(:post).permit(:message, :full_address, :category_id, :status, :post_type, :phone)
	end
end
