class UserUtilities

	def self.users_are_equal? first_user, second_user
		first_user.provider. == second_user.provider &&
		first_user.uid == second_user.uid &&
		first_user.name == second_user.name &&
		first_user.oauth_token == second_user.oauth_token
		first_user.oauth_expires_at == second_user.oauth_expires_at
		first_user.permission_level == second_user.permission_level
	end

	# Following methods enable mocking of auth info from omniauth
	def provider
	end

	def uid
	end

	def info
		self
	end

	def battletag
	end
	
	def credentials
		self
	end

	def token
	end

	def expires_at
	end

end