class TradeSerializer
    FIELDS = %w[
        id
        is_fair
        offer_player_1
        offer_player_2
        offer_1_experience
        offer_2_experience
        player_1_id
        player_2_id
        created_at
        updated_at
      ].freeze
    
      def initialize(relation)
        @relation = relation
      end
    
      def serialize
        @relation.as_json(only: TradeSerializer::FIELDS)
      end
    
      def serialize_with_pagination(page)
        @relation = @relation.page(page) if page.present?
    
        {
          records: @relation.as_json(only: TradeSerializer::FIELDS),
          pagination: page.present? ? pagination : nil
        }
      end
    
      private
    
      def pagination
        {
          count: Trade.count,
          current_page: @relation.current_page,
          total_pages: @relation.total_pages,
          next_page: @relation.next_page,
          prev_page: @relation.prev_page,
          limit_value: @relation.limit_value,
          current_count: @relation.count
        }
      end
end