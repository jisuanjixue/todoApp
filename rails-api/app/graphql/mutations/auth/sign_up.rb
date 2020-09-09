module Mutations
    module Auth
      class SignUp < BaseMutation
        require 'json_web_token'
  
        description "用户注册"
  
        argument :input, Types::Inputs::SignInInput, required: true
  
        field :token, String, null: false, description: "用户的 Authorizations Token 用于授权的提交和查询"
        field :user, Types::UserType, null: false, description: "用户信息输出"
  
        def resolve(input: nil)
          user = User.new(email: input.email, password: input.password)
          if user.save
            token = JsonWebToken.encode({user_id: user.id})
            if token
              return {token: token, user: user}
            else
              raise GraphQL::ExecutionError.new("Server was unable to created token. Please try again later.")
            end
          else
            raise GraphQL::ExecutionError.new(user.errors.full_messages.join(', '))
          end
        end
      end
    end
  end