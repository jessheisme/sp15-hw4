class DogsController < ApplicationController
	def index
		@dogs = Dog.all
	end
	
	def new
    	@dog = Dog.new #Creates an empty user object.
	end

	def show
    	@dog = Dog.find(params[:id]) # Query for the user with the id that is in params
  	end


	def create
		@dog = Dog.create(dog_params)
		if @dog.save
			redirect_to Dog.new
		else
			render "new"
		end
	end

	private

	def dog_params
		params.require(:dog).permit(:name, :age)
	end
end
