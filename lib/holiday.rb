require 'pry'

holiday_supplies_hash =
{
  :winter => {
    :christmas => ["Lights", "Wreath"],
    :new_years => ["Party Hats"]
  },
  :summer => {
    :fourth_of_july => ["Fireworks", "BBQ"]
  },
  :fall => {
    :thanksgiving => ["Turkey"]
  },
  :spring => {
    :memorial_day => ["BBQ"]
  }
}

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply
end


def add_supply_to_memorial_day(holiday_hash, supply)
     holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  supplies = (holiday_hash[:winter].collect do |holiday, supply|
      supply.collect do |item|
        item
        end
      end
      ).flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.collect do |season, hash|
    puts "#{season.to_s.capitalize}:"
    hash.collect do |holiday, item|
      puts "  #{holiday.to_s.gsub("_", " ").split.map(&:capitalize).join(' ')}: #{item.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  barbeque_holidays = []
  holiday_hash.collect do |season, hash|
      hash.collect do |holiday, supplies|
        if supplies.include?("BBQ")
          barbeque_holidays << holiday
        end
      end
    end
    barbeque_holidays.flatten
  end
