class PokemonSerializer
    FIELDS = %w[
        id
        name
        base_experience
        created_at
        updated_at
      ].freeze
    
      def initialize(relation)
        @relation = relation
      end
    
      def serialize
        @relation.as_json(only: PokemonSerializer::FIELDS)
      end
    
      def serialize_with_pagination(page)
        @relation = @relation.page(page) if page.present?
    
        {
          records: @relation.as_json(only: PokemonSerializer::FIELDS),
          pagination: page.present? ? pagination : nil
        }
      end
    
      private
    
      def pagination
        {
          count: Pokemon.count,
          current_page: @relation.current_page,
          total_pages: @relation.total_pages,
          next_page: @relation.next_page,
          prev_page: @relation.prev_page,
          limit_value: @relation.limit_value,
          current_count: @relation.count
        }
      end
end