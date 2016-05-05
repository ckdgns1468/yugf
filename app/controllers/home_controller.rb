class HomeController < ApplicationController
  def index
    @posts = Post.all
  end

  def write
    post = Post.new(title:params[:title], content:params[:content])
    if post.save
    redirect_to '/home/index'
    else
    render :text=> post.errors.massege[:title].first
    end
  end
  
  def write_reply
    reply = Reply.new(content:params[:content], post_id:params[:id_of_post])
    reply.save
    redirect_to '/home/index'
  end
  
end
