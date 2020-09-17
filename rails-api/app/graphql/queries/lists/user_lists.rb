module Queries
    module Lists
      class UserLists < BaseQuery
        description "获取用户列表"

         # Inputs
         argument :page, Integer, required: true, description: "页数"
         argument :per, Integer, required: true, description: "每页数"
        
        type [Types::ListType], null: false
  
        def resolve(page:, per:)
          authenticate_user
          context[:current_user].lists.page(page).per(per)
        end
  
      end
    end
  end