module Types
    class ListEdgeType < GraphQL::Types::Relay::BaseEdge
        node_type(Types::ListType)
    end
    
    class Types::ListConnection < GraphQL::Types::Relay::BaseConnection
        field :total_count, Integer, null: false
        def total_count
        object.nodes.size
        end
        edge_type(ListEdgeType)
    end
end