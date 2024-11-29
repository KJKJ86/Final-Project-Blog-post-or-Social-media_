# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post, counter_cache: :likes_count

  validates :user_id, uniqueness: { scope: :post_id, message: "You can only like a post once." }
end
