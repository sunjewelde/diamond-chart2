class Diamond < ActiveRecord::Base
    
    scope :date_one_week, -> {where(:date=> 1.week.ago..Date.today)}
    scope :date_one_month, -> {where(:date=> 1.months.ago..Date.today)}
    scope :date_three_month, -> {where(:date=> 3.months.ago..Date.today)}
    scope :date_six_month, -> {where(:date=> 6.months.ago..Date.today)}
    scope :date_one_year, -> {where(:date=> 12.months.ago..Date.today)}
    
    scope :weight, ->(weight) {where(weight: weight)}
    scope :color, ->(color) {where(color: color)}
    scope :clar, ->(clar) {where(clar: clar)}


end


