module Queries
    module Lists
      class ListShow < BaseQuery
        description "获取已选择的todo"
  
        # Inputs
        argument :id, ID, required: true, description: "列表ID"
  
        type Types::ListType, null: true
  
        def resolve(id:)
          authenticate_user
          context[:current_user].lists.find(id)
        rescue
          raise GraphQL::ExecutionError.new("List Not Found")
        end
  
      end
    end
  end