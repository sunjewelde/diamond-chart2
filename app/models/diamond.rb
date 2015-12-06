class Diamond < ActiveRecord::Base
 require "date"
   latest = Diamond.last
   oldest = Diamond.first
   latest_date = latest.date
   oldest_date = oldest.date
   # one_week_ago = latest_date - 7
   # i = 7
   # one_week_ago = latest_date - i
   # if one_week_ago.presnt?
   # 	  one_week_ago = latest_date - i
   # 	   break
   # 	  else
   # 	  i = i + 1
   # end


    scope :date_one_week, -> {where(:date=> 1.week.ago..Date.today)}
    scope :date_one_month, -> {where(:date=> 1.months.ago..Date.today)}
    scope :date_three_month, -> {where(:date=> 3.months.ago..Date.today)}
    scope :date_six_month, -> {where(:date=> 6.months.ago..Date.today)}
    scope :date_one_year, -> {where(:date=> 12.months.ago..Date.today)}
    scope :date_full_year, -> {where(:date=> oldest_date..latest_date)}
    
    scope :weight, ->(weight) {where(weight: weight)}

    scope :date_bewteen, -> from, to {
    	if from.present? && to.present?
	      where(date: from..to)
	    elsif from.present?
	      where('date >= ?', from)
	    elsif to.present?
	      where('date <= ?', to)
	    end
    	}
    # scope :weight01, -> {where(:weight=> 0.0...0.3}


    scope :color, ->(color) {where(color: color)}
    scope :clar, ->(clar) {where(clar: clar)}
    scope :date, ->(date) {where(date: date)}
    scope :cut_grade, ->(cut_grade) {where(cut_grade: cut_grade)}
    scope :polish, ->(polish) {where(polish: polish)}
    scope :symmetry, ->(symmetry) {where(symmetry: symmetry)}
    scope :fluorescen, ->(fluorescen) {where(fluorescen: fluorescen)}
    scope :certificate_id, ->(certificate_id) {where(certificate_id: certificate_id)}
    scope :end_price, ->(end_price) {where(end_price: end_price)}

    #重複ないように日付を配列として取得
	@date_all = Diamond.pluck(:date).uniq.sort
	#日付別にデータをグループ
	#日付別データからカラット別にグループ
	#カラット別データをclar別にグループ
	# weight_all = Diamond.pluck(:weight).uniq.sort
	# color_all = Diamond.pluck(:color).uniq
	# clar_all = Diamond.pluck(:clar).uniq
	# cut_grade_all = Diamond.pluck(:cut_grade).uniq
	# polish_all = Diamond.pluck(:polish).uniq
	# symmetry_all = Diamond.pluck(:symmetry).uniq
	# fluorescen_all = Diamond.pluck(:fluorescen).uniq

	# @date_all = Diamond.select(:date).distinct.order(:date)
	# @weight_all = Diamond.select(:weight).distinct.order(:weight)
	# @color_all = Diamond.select(:color).distinct.order(:color)
	# @clar_all = Diamond.select(:clar).distinct.order(:clar)
	# @cut_grade_all = Diamond.select(:cut_grade).distinct.order(:cut_grade)
	# @polish_all = Diamond.select(:polish).distinct.order(:polish)
	# @symmetry_all = Diamond.select(:symmetry).distinct.order(:symmetry)
	# @fluorescen_all = Diamond.select(:fluorescen).distinct.order(:fluorescen)

end


