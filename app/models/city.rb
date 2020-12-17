class City < ActiveRecord::Base
  has_many :neighborhoods
  has_many :listings, :through => :neighborhoods
  has_many :reservations, :through => :listings 

  def city_openings(start_date, end_date)
    openings(start_date, end_date)
  end

  def openings(start_date, end_date)
    listings.merge(Listing.available(start_date, end_date))
  end

  def self.most_res
    all.max do |a, b|
      a.reservations.count <=> b.reservations.count 
    end
  end

end

