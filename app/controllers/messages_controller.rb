class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :edit, :update, :destroy] # show edit update destroy methodlarında find_message methodu geçrli olacak
	before_action :authenticate_user!, except: [:index, :show]##
	def index ###
		@messages = Message.all.order("created_at DESC")##SQL DE SELECT "messages".* FROM "messages" ORDER BY created at DESC
	end
	
	def new ##
		@message = current_user.messages.build#2# #1#Message.new ##
	end
	
	def show ##
		#ilk kullanım şekli##@message = Message.find(params[:id]) ## databaseden params içinden  o id bulunup getiriliyor sonra @ message html kısmında işlenir 
		# şimdi ikinci kullanım şeklini kullanıyoruz  ## def _find method ve before action methodlarıyla
	end
	
	def create ##
		# title: params[:title], description: [:description]
		##@message.save  diğer kullanım şekli
		@message =current_user.messages.build(message_params)  ##Message.new(message_params) ##
		if @message.save  ##mesaj kayıt true döndürürse
			redirect_to root_path ##ana sayfaya yönlendirir
		else
			render 'new' ##
		end ##
		
	end ##
	
	def edit
	
	end
	
	def update
		if @message.update(message_params)  ## mesaj bulunduysa ve update edildiyse
			redirect_to message_path ## http://localhost:3000/messages/3 yani showa yönlendrilir gider
		else
			render 'edit'  ## true değer dönmezse edite gelir tekrar  http://localhost:3000/messages/3/edit
		end
	
	end
	
	def destroy
		@message.destroy
		redirect_to root_path ## mesaj silinince indexe  http://localhost:3000/messages yönelir
	
	end
	
	private ##
	
		def message_params ##
			params.require(:message).permit(:title, :description) #########################
		end  ##
		
		def find_message
			@message = Message.find(params[:id])
		end
end
