class PostsController < ApplicationController
  def index
   respond_to do |format|
     if !params[:buscador].nil?
       if params[:buscador].length < 3
         @posts = Post.order(:id)
       else
         @posts = Post.where('title LIKE ?', "%#{params[:buscador]}%")
       end
       format.js
     else
       @posts = Post.order(:id)
       format.html
     end
   end
   @post = Post.new
  end

  def create
    @post = Post.new(
      title: params[:post][:title],
      user_id: current_user.id
    )
    @post.save
    respond_to :js
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to :js
  end

  def edit
    @post = Post.find(params[:id])
    respond_to :js
  end

  def update
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.save
    respond_to :js
  end

  def show
    @post = Post.find(params[:id])
    respond_to :js
  end

end


