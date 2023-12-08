require 'date'
require 'minitest/autorun'

require_relative 'task.rb'

class OrganiserTest < Minitest::Test

    def setup
        ev1 = SportEvent.new("European Championship", Date.new(2024, 6, 14), 5, "football")
        ev2 = Holiday.new("New Year", Date.new(2024, 1, 1), 3, "international", 365)
        ev3 = Event.new("Exam", Date.new(2023, 12, 8), 1)
        ev4 = PoliticalEvent.new("Congress election", Date.new(2023, 12, 25), 4, "USA")
        ev5 = SportEvent.new("Monaco Grand Prix", Date.new(2023, 5, 28), 6, "motorsport")
        ev6 = Holiday.new("Independence Day", Date.new(2023, 8, 24), 2, "Ukraine", 365)
        arr = []
        arr.push(ev1, ev2, ev3, ev4, ev5, ev6)
        @events = Organiser.new(arr)
      end
    
      def test_1
        res = @events.sort_by_date.map{|event| event.name}
        sorted_arr = ["Monaco Grand Prix", "Independence Day", "Exam", "Congress election", "New Year","European Championship"]
        assert_equal res, sorted_arr
    
        puts res
      end
    
      def test_2
        res = @events.sort_by_category.map{|event| event.name}
        sorted_arr = ["Exam", "Independence Day", "New Year", "Congress election", "European Championship", "Monaco Grand Prix"]
        assert_equal res, sorted_arr
    
        puts res
      end
    
      def test_3
        res = @events.get_by_date(Date.new(2023, 12, 8)).map{|event| event.name}
        assert_equal res, ["Exam"]
    
        puts res
      end
    
      def test_4
        res = @events.get_by_range(Date.new(2024, 1, 1), Date.new(2024, 12, 30)).map{|event| event.name}
        assert_equal res, ["European Championship", "New Year"]
    
        puts res
      end
    
      def test_5
        res = @events.get_closest_event(Date.new(2023,12,9)).name
        assert_equal res, "Congress election"
    
        puts res
      end
    end