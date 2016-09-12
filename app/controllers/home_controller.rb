class HomeController < ApplicationController
  def index
    
    @posts = Post.all.reverse

  end

  def write
    @howmany = params[:content]
    
    @plength = @howmany.size
    @pwords = @howmany.split.size

    post = Post.new(title: params[:title], content: params[:content], post_length: @plength, post_words: @pwords)
    
    if post.save
      redirect_to "/home/index"
    else
      render :text => post.errors.messages[:title].first
    end
    
  end

  def reply_write

    reply = Reply.new
    reply.content = params[:comment]
    reply.post_id = params[:postid]
    reply.save
    
    redirect_to "/home/index"
    
  end
  
  def reply_destroy
    @one_reply = Reply.find(params[:id])
    @one_reply.destroy
    redirect_to '/home/index'
      
  end

  def destroy
    @one_post = Post.find(params[:id])
    @one_post.destroy
    redirect_to '/home/index'

  end
  
  def update_view
    @one_post = Post.find(params[:id])
  end
  
  def update_act
    @one_post = Post.find(params[:id])
    @one_post.title = params[:head]
    @one_post.content = params[:body]
    @one_post.save
    
    redirect_to '/home/index'
  end    
  
  def reply_update_view
    @one_reply = Reply.find(params[:id])
  end
  
  def reply_update_act
    @one_reply = Reply.find(params[:id])
    @one_reply.content = params[:body]
    @one_reply.save
    
    redirect_to '/home/index'
  end  
  

end
