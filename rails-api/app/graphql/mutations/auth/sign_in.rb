module Mutations
    module Auth
      class SignIn < BaseMutation
        require 'json_web_token'
  
        description "用户登录"
  
        argument :input, Types::Inputs::SignInInput, required: true
  
        field :token, String, null: false, description: "用户的 Authorizations Token 用于授权的提交和查询"
        field :user, Types::UserType, null: false, description: "用户信息"
  
        def resolve(input: nil)
          user = User.find_by(email: input.email)
          if user && user.password == input.password
            token = JsonWebToken.encode({user_id: user.id})
            if token
              return {token: token, user: user}
            else
              raise GraphQL::ExecutionError.new("Server was unable to created token. Please try again later.")
            end
          else
            raise GraphQL::ExecutionError.new("Invalid Credentials Provided.")
          end
        end
      end
    end
  end