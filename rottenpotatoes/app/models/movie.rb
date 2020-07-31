class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  def self.similar_movies mov_title
    director = Movie.find_by_title(mov_title).director
    if director.nil? or director.blank?
      return nil
    end
    Movie.where(director: director).pluck(:title)
  end
end
