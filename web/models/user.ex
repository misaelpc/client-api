defmodule User do

	defstruct auth: "" 

	def authenticate(token) do
		#this token should be retrivied from DB
		credential = :base64.encode_to_string("admin:diverza")
		auth = "Basic " <> to_string credential
		:string.equal((to_string token),(to_string auth)) 
	end

end 