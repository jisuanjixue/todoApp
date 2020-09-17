module Types
  class ListType < Types::BaseObject
    field :id, ID, null: false, description: "MongoDB List id string"
    field :name, String, null: false, description: "todo列表名"
    field :user, Types::UserType, null: false, description: "列表的用户"
    field :tasks, [Types::TaskType], null: true, description: "List Tasks"
  end
end