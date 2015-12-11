class Diamond < ActiveRecord::Base
 require "date"
   # latest = Diamond.last
   # oldest = Diamond.first
   # latest_date = latest.date
   # oldest_date = oldest.date
   latest_date = Diamond.maximum(:date)
   oldest_date = Diamond.minimum(:date)
   weight_max = Diamond.maximum(:weight)
   weight_min = Diamond.minimum(:weight)
   one_week_ago = latest_date - 6
   one_months_ago = latest_date - 30
   three_months_ago = latest_date - 90
   six_months_ago = latest_date - 180
   one_year_ago = latest_date - 364

   #7days agoの日付が存在しない場合の対処
   # one_week_ago = latest_date - 7
   # i = 7
   # one_week_ago = latest_date - i
   # if one_week_ago.presnt?
   # 	  one_week_ago = latest_date - i
   # 	   break
   # 	  else
   # 	  i = i + 1
   # end


    scope :date_one_week, -> {where(:date=> one_week_ago..latest_date)}
    scope :date_one_month, -> {where(:date=> one_months_ago..latest_date)}
    scope :date_three_month, -> {where(:date=> three_months_ago..latest_date)}
    scope :date_six_month, -> {where(:date=> six_months_ago..latest_date)}
    scope :date_one_year, -> {where(:date=> one_year_ago..latest_date)}
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

    scope :color, ->(color) {where(color: color) if color.present? }
    scope :clar, ->(clar) {where(clar: clar) if clar.present? }
    scope :date, ->(date) {where(date: date) if date.present? }
    scope :cut_grade, ->(cut_grade) {where(cut_grade: cut_grade) if cut_grade.present? }
    scope :polish, ->(polish) {where(polish: polish) if polish.present?}
    scope :symmetry, ->(symmetry) {where(symmetry: symmetry) if symmetry.present? }
    scope :fluorescen, ->(fluorescen) {where(fluorescen: fluorescen) if fluorescen.present? }
    scope :certificate_id, ->(certificate_id) {where(certificate_id: certificate_id) if color.present? }
    scope :end_price, ->(end_price) {where(end_price: end_price) if end_price.present? }

    scope :weight02, -> {where(:weight=> weight_min...0.3 ) }
    scope :weight03, -> {where(:weight=> 0.3...0.4 ) }
    scope :weight04, -> {where(:weight=> 0.4...0.5 ) }
    scope :weight05, -> {where(:weight=> 0.5...0.6 ) }
    scope :weight06, -> {where(:weight=> 0.6...0.7 ) }
    scope :weight07, -> {where(:weight=> 0.7...0.8 ) }
    scope :weight08, -> {where(:weight=> 0.8...0.9 ) }
    scope :weight09, -> {where(:weight=> 0.9...1.0 ) }
    scope :weight10, -> {where(:weight=> 1.0...1.2 ) }
    scope :weight12, -> {where(:weight=> 1.2...1.5 ) }
    scope :weight15, -> {where(:weight=> 1.5...1.8 ) }
    scope :weight18, -> {where(:weight=> 1.8...2.0 ) }
    scope :weight20, -> {where(:weight=> 2.0...3.0 ) }
    scope :weight30, -> {where(:weight=> 3.0...4.0 ) }
    scope :weight40, -> {where(:weight=> 4.0..weight_max ) }

    #重複ないように日付を配列として取得
	# @date_all = Diamond.pluck(:date).uniq.sort
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


