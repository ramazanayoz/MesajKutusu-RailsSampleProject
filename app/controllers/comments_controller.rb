class CommentsController < ApplicationController
	before_action :find_message ## işlem yapılcak olan mesaj bulma methodu before ise yapılacak ilk işlem bu sayfa açılışında
	before_action :find_comment, only: [:edit, :update, :destroy] ## sonra bu method edit update only meyhodları için çalıştırılıyor  
### hepsi 2
	def create 
		##@message = Message.find(params[:message_id]) #2# mesaj idsini bularak ve o satırdaki tüm bilgileri getiriyor ,  Message modelle , veritababana bağlanarak messages tablosundan 
		@comment = @message.comments.create(comment_params) #2#
		@comment.user_id = current_user.id  #2#
		
		if @comment.save
			redirect_to message_path(@message) ## yorum kaydedilince yorum yapılan mesaj idisine yönlendirme yapılıyor
		else
		 render 'new' ## kaydedilmezse
		end
	end
	
	def edit
		##@message = Message.find(params[:message_id]) ##
		##@comment = @message.comments.find(params[:id]) # burada join yapılmış gibi
	end	
		
	def update
		if @comment.update(comment_params) ##
		redirect_to message_path(@message) ##işlem yapıldıktan sonra @message de id'si ile,  message sayfasına döner
		else
			render 'edit' ##
		end
	end
	
	def destroy
		@comment.destroy##
		redirect_to message_path(@message)#
		end
	private 
	
		def comment_params
			params.require(:comment).permit(:content) ## update ve create işlemlerinde kullandık
		end
		
		def find_message
			@message = Message.find(params[:message_id]) ##mesaj idsini bularak ve o satırdaki tüm bilgileri getiriyor ,  Message modelle , veritababana bağlanarak messages tablosa erişerek yapıyor
		end
		
		def find_comment
			@comment = @message.comments.find(params[:id]) 
			##bunlar join gibi düşünülebir  @message deki mesaj idsi ne bağlı comments tablosundan  belirtilen  id dek satırdaki tüm bilgler getiriliyor
		end
end
