# frozen_string_literal: true

class AddMovieReferenceToReviewsTable < ActiveRecord::Migration[7.1]
  def change
    add_reference(:reviews, :film)
  end
end
