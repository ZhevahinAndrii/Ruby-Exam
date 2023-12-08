require 'date'

class Event
    attr_accessor :name, :date, :category

    def initialize(name,date,category)
        @name= name
        @date = date
        @category = category
    end
end

class PeriodicEvent < Event
    attr_accessor :period_days

    def initialize(name,date,category,period_days)
        super(name,date,category)
        @period_days = period_days
    end
end

class SportEvent < Event
    attr_accessor :sport

    def initialize(name,date,category,sport)
        super(name,date,category)
        @sport = sport
    end
end

class PoliticalEvent < Event
    attr_accessor :country

    def initialize(name,date,category,country)
        super(name,date,category)
        @country = country
    end
end

class Holiday < PeriodicEvent
    attr_accessor :country

    def initialize(name,date,category,country,period_days)
        super(name,date,category,period_days)
        @country = country
    end
end

class Organiser
    attr_accessor :events

    def initialize(events)
        @events = events
    end

    def sort_by_date
        @events.sort_by{|event| event.date}
    end

    def sort_by_category
        @events.sort_by{|event| event.category}
    end

    def get_by_date(date)
        @events.select {|event| event.date==date}
    end

    def get_by_range(start_date,end_date)
        @events.select{|i| i.date>=start_date&&i.date<=end_date}
    end

    def get_closest_event(date)
        arr = []
        @events.each{|event| (event.date>=date)?arr.push(event):''}
        arr = arr.sort_by{|event| event.date}
        arr.first
    end
end
          

