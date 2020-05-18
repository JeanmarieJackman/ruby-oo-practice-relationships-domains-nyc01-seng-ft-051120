class Listing

    attr_reader :city_name

    @@all = []

    def initialize(city_name)
        @city_name = city_name
        @@all << self
    end

    
    # .all
    # returns an array of all listings
    def self.all
        @@all
    end

    def trips
        Trip.all.select do |trip|
            trip.listing == self
        end
    end

    def guests
        trips.collect do |trip|
            trip.guest
        end
    end

    def trip_count
        trips.count
    end
    
    def self.find_all_by_city(city_name)
        self.all.select do |listing|
            listing.city_name == city_name
        end
    end
 
    def self.most_popular
        self.all.max_by do |listing|
            listing.trip_count
        end
       
    end
end