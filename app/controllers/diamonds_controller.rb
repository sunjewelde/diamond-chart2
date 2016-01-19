class DiamondsController < ApplicationController
  def new
    @diamond = Diamond.new
  end

  def group_color(weight, color)
    "@weight" + weight + "_diamond_group.weight" + weight + ".color(" + "\"" + color + "\"" + ")"
  end

  def import
     # fileはtmpに自動で一時保存される
    Diamond.import(params[:csv_file])
    redirect_to root_url, notice: "Diamondデータを追加しました。"
  end

  require "date"
  def index
    # @diamonds = Diamond.all
    #kaminariでページネーション
    # @diamonds = Diamond.page(params[:page])
    @q = Diamond.ransack(params[:q])
    # @diamonds2 = @q.result(distinct: true)
   
   weight = ["02", "03", "04", "05", "06", "07", "08", "09", "10", "12", "15", "18", "20", "30", "40"]
   color = ["D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "FIY", "FLY", "FY", "Y-Z"]
   clar = ["IF", "VVS1", "VVS2", "VS1", "VS2", "SI1", "SI2", "I1", "FL"]
   cut_grade = ["Good", "Very Good", "Excellent", "EXC", "VGD", "F"]
   polish = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good"]
   symmetry = ["Excellent", "Very Good", "ex", "vg", "vgd", "gd", "exc", "Good", "g", "Fair", "F"]
   fluorescen = ["Medium", "Faint", "None", "Strong", "f", "mb", "NONE", "Medium Blue", "md blue", 
                 "st", "sb", "str blue", "S.BLUE", "M.BLUE", "VST", "Very Strong", "V.S.BLUE", "FT"]

   #最新旧の日付を取得
   # @latest = Diamond.last
   # @oldest = Diamond.first
   # @latest_date = @latest.date
   # @old_date = @oldest.date

   # latest = Diamond.last
   # oldest = Diamond.first
   # latest_date = latest.date
   # oldest_date = oldest.date
   @latest_date = Diamond.maximum(:date)
   @oldest_date = Diamond.minimum(:date)
   date_range =  @latest_date - @oldest_date
   three_days_ago = @latest_date -3
   # if date_range >= 7
   #     i = 7
   #     one_week_ago = latest_date - i
   #     if one_week_ago.presnt?
   #        owa = one_week_ago
   #     else
   #      i = i + 1
   # end
   # end
   
 
   # @date_all = Diamond.select(:date).distinct.order(:date)

   # date_all = Diamond.pluck(:date).uniq.sort
   # weight_all = Diamond.pluck(:weight).uniq.sort
   # color_all = Diamond.pluck(:color).uniq
   # clar_all = Diamond.pluck(:clar).uniq
   # cut_grade_all = Diamond.pluck(:cut_grade).uniq
   # polish_all = Diamond.pluck(:polish).uniq
   # symmetry_all = Diamond.pluck(:symmetry).uniq
   # fluorescen_all = Diamond.pluck(:fluorescen).uniq

   # binding.pry
  
    # weight_group_03_color_D_IF = Diamond.date_one_week.weight(0.3).color("D").clar("IF")
    # weight_group_03_color_E_IF = Diamond.date_one_week.weight(0.3).color("E").clar("IF")
    # weight_group_03_color_F_IF = Diamond.date_one_week.weight(0.3).color("F").clar("IF")
    # weight_group_03_color_G_IF = Diamond.date_one_week.weight(0.3).color("G").clar("IF")
    # weight_group_03_color_H_IF = Diamond.date_one_week.weight(0.3).color("H").clar("IF")
    # weight_group_03_color_I_IF = Diamond.date_one_week.weight(0.3).color("I").clar("IF")
    # weight_group_03_color_J_IF = Diamond.date_one_week.weight(0.3).color("J").clar("IF")
    # weight_group_03_color_K_IF = Diamond.date_one_week.weight(0.3).color("K").clar("IF")
    # weight_group_03_color_L_IF = Diamond.date_one_week.weight(0.3).color("L").clar("IF")
    # weight_group_03_color_M_IF = Diamond.date_one_week.weight(0.3).color("M").clar("IF")

    #最新のDiamond_data
    @latest_diamond_group = Diamond.where(date: @latest_date)
    #weightでグループ
    @weight03_diamond_group = @latest_diamond_group.weight03
    # @weight04_diamond_group = @latest_diamond_group.weight04
    # @weight05_diamond_group = @latest_diamond_group.weight05
    # @weight06_diamond_group = @latest_diamond_group.weight06
    # @weight07_diamond_group = @latest_diamond_group.weight07
    # @weight08_diamond_group = @latest_diamond_group.weight08
    # @weight09_diamond_group = @latest_diamond_group.weight09
    # @weight10_diamond_group = @latest_diamond_group.weight10
    # @weight12_diamond_group = @latest_diamond_group.weight12
    # @weight15_diamond_group = @latest_diamond_group.weight15
    # @weight18_diamond_group = @latest_diamond_group.weight18
    # @weight20_diamond_group = @latest_diamond_group.weight20
    # @weight30_diamond_group = @latest_diamond_group.weight30
    # @weight40_diamond_group = @latest_diamond_group.weight40

    #colorでグループ
    # for color_group in color
    #   name = color_group
    #   @"#{name}" = @weight03_diamond_group.color("#{color}")
    # end
    temp = group_color("03", "D")
    temp_latest_weight_group_03_color_D = temp.to_i
    latest_weight_group_03_color_D = @weight03_diamond_group.weight03.color("D")
    latest_weight_group_03_color_E = @weight03_diamond_group.weight03.color("E")
    latest_weight_group_03_color_F = @weight03_diamond_group.weight03.color("F")
    latest_weight_group_03_color_G = @weight03_diamond_group.weight03.color("G")
    latest_weight_group_03_color_H = @weight03_diamond_group.weight03.color("H")
    latest_weight_group_03_color_I = @weight03_diamond_group.weight03.color("I")
    latest_weight_group_03_color_J = @weight03_diamond_group.weight03.color("J")
    latest_weight_group_03_color_K = @weight03_diamond_group.weight03.color("K")
    latest_weight_group_03_color_L = @weight03_diamond_group.weight03.color("L")
    latest_weight_group_03_color_M = @weight03_diamond_group.weight03.color("M")

    @latest_weight_group_03_color_D_clar = latest_weight_group_03_color_D.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_E_clar = latest_weight_group_03_color_E.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_F_clar = latest_weight_group_03_color_F.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_G_clar = latest_weight_group_03_color_G.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_H_clar = latest_weight_group_03_color_H.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_I_clar = latest_weight_group_03_color_I.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_J_clar = latest_weight_group_03_color_J.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_K_clar = latest_weight_group_03_color_K.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_L_clar = latest_weight_group_03_color_L.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)
    @latest_weight_group_03_color_M_clar = latest_weight_group_03_color_M.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:clar)

    # @latest_weight_group_03_color_D_clar_IF = @latest_weight_group_03_color_D_clar.where(clar: "IF").select(:avg_price)
    @weight_group_03_color_D_price_clar = []
    @weight_group_03_color_E_price_clar = []
    @weight_group_03_color_F_price_clar = []
    @weight_group_03_color_G_price_clar = []
    @weight_group_03_color_H_price_clar = []
    @weight_group_03_color_I_price_clar = []
    @weight_group_03_color_J_price_clar = []
    @weight_group_03_color_K_price_clar = []
    @weight_group_03_color_L_price_clar = []
    @weight_group_03_color_M_price_clar = []

    @weight_group_03_color_D_price_latest = []
    @weight_group_03_color_E_price_latest = []
    @weight_group_03_color_F_price_latest = []
    @weight_group_03_color_G_price_latest = []
    @weight_group_03_color_H_price_latest = []
    @weight_group_03_color_I_price_latest = []
    @weight_group_03_color_J_price_latest = []
    @weight_group_03_color_K_price_latest = []
    @weight_group_03_color_L_price_latest = []
    @weight_group_03_color_M_price_latest = []

    @latest_weight_group_03_color_D_clar.each do |diamond|
      @weight_group_03_color_D_price_clar << diamond.clar
      @weight_group_03_color_D_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_E_clar.each do |diamond|
      @weight_group_03_color_E_price_clar << diamond.clar
      @weight_group_03_color_E_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_F_clar.each do |diamond|
      @weight_group_03_color_F_price_clar << diamond.clar
      @weight_group_03_color_F_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_G_clar.each do |diamond|
      @weight_group_03_color_G_price_clar << diamond.clar
      @weight_group_03_color_G_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_H_clar.each do |diamond|
      @weight_group_03_color_H_price_clar << diamond.clar
      @weight_group_03_color_H_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_I_clar.each do |diamond|
      @weight_group_03_color_I_price_clar << diamond.clar
      @weight_group_03_color_I_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_J_clar.each do |diamond|
      @weight_group_03_color_J_price_clar << diamond.clar
      @weight_group_03_color_J_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_K_clar.each do |diamond|
      @weight_group_03_color_K_price_clar << diamond.clar
      @weight_group_03_color_K_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_L_clar.each do |diamond|
      @weight_group_03_color_L_price_clar << diamond.clar
      @weight_group_03_color_L_price_latest << diamond.avg_price.round
    end

    @latest_weight_group_03_color_M_clar.each do |diamond|
      @weight_group_03_color_M_price_clar << diamond.clar
      @weight_group_03_color_M_price_latest << diamond.avg_price.round
    end


    arr_D_clar_price = [@weight_group_03_color_D_price_clar, @weight_group_03_color_D_price_latest].transpose
    h_D_clar_price = Hash[*arr_D_clar_price.flatten]

    arr_E_clar_price = [@weight_group_03_color_E_price_clar, @weight_group_03_color_E_price_latest].transpose
    h_E_clar_price = Hash[*arr_E_clar_price.flatten]

    arr_F_clar_price = [@weight_group_03_color_F_price_clar, @weight_group_03_color_F_price_latest].transpose
    h_F_clar_price = Hash[*arr_F_clar_price.flatten]

    arr_G_clar_price = [@weight_group_03_color_G_price_clar, @weight_group_03_color_G_price_latest].transpose
    h_G_clar_price = Hash[*arr_G_clar_price.flatten]

    arr_H_clar_price = [@weight_group_03_color_H_price_clar, @weight_group_03_color_H_price_latest].transpose
    h_H_clar_price = Hash[*arr_H_clar_price.flatten]

    arr_I_clar_price = [@weight_group_03_color_I_price_clar, @weight_group_03_color_I_price_latest].transpose
    h_I_clar_price = Hash[*arr_I_clar_price.flatten]

    arr_J_clar_price = [@weight_group_03_color_J_price_clar, @weight_group_03_color_J_price_latest].transpose
    h_J_clar_price = Hash[*arr_J_clar_price.flatten]

    arr_K_clar_price = [@weight_group_03_color_K_price_clar, @weight_group_03_color_K_price_latest].transpose
    h_K_clar_price = Hash[*arr_K_clar_price.flatten]

    arr_L_clar_price = [@weight_group_03_color_L_price_clar, @weight_group_03_color_L_price_latest].transpose
    h_L_clar_price = Hash[*arr_L_clar_price.flatten]

    arr_M_clar_price = [@weight_group_03_color_M_price_clar, @weight_group_03_color_M_price_latest].transpose
    h_M_clar_price = Hash[*arr_M_clar_price.flatten]

    @D_IF_price = h_D_clar_price["IF"]
    @D_VVS1_price = h_D_clar_price["VVS1"]
    @D_VVS2_price = h_D_clar_price["VVS2"]
    @D_VS1_price = h_D_clar_price["VS1"]
    @D_VS2_price = h_D_clar_price["VS2"]
    @D_SI1_price = h_D_clar_price["SI1"]
    @D_SI2_price = h_D_clar_price["SI2"]

    @E_IF_price = h_E_clar_price["IF"]
    @E_VVS1_price = h_E_clar_price["VVS1"]
    @E_VVS2_price = h_E_clar_price["VVS2"]
    @E_VS1_price = h_E_clar_price["VS1"]
    @E_VS2_price = h_E_clar_price["VS2"]
    @E_SI1_price = h_E_clar_price["SI1"]
    @E_SI2_price = h_E_clar_price["SI2"]

    @F_IF_price = h_F_clar_price["IF"]
    @F_VVS1_price = h_F_clar_price["VVS1"]
    @F_VVS2_price = h_F_clar_price["VVS2"]
    @F_VS1_price = h_F_clar_price["VS1"]
    @F_VS2_price = h_F_clar_price["VS2"]
    @F_SI1_price = h_F_clar_price["SI1"]
    @F_SI2_price = h_F_clar_price["SI2"]

    @G_IF_price = h_G_clar_price["IF"]
    @G_VVS1_price = h_G_clar_price["VVS1"]
    @G_VVS2_price = h_G_clar_price["VVS2"]
    @G_VS1_price = h_G_clar_price["VS1"]
    @G_VS2_price = h_G_clar_price["VS2"]
    @G_SI1_price = h_G_clar_price["SI1"]
    @G_SI2_price = h_G_clar_price["SI2"]

    @H_IF_price = h_H_clar_price["IF"]
    @H_VVS1_price = h_H_clar_price["VVS1"]
    @H_VVS2_price = h_H_clar_price["VVS2"]
    @H_VS1_price = h_H_clar_price["VS1"]
    @H_VS2_price = h_H_clar_price["VS2"]
    @H_SI1_price = h_H_clar_price["SI1"]
    @H_SI2_price = h_H_clar_price["SI2"]

    @I_IF_price = h_I_clar_price["IF"]
    @I_VVS1_price = h_I_clar_price["VVS1"]
    @I_VVS2_price = h_I_clar_price["VVS2"]
    @I_VS1_price = h_I_clar_price["VS1"]
    @I_VS2_price = h_I_clar_price["VS2"]
    @I_SI1_price = h_I_clar_price["SI1"]
    @I_SI2_price = h_I_clar_price["SI2"]

    @J_IF_price = h_J_clar_price["IF"]
    @J_VVS1_price = h_J_clar_price["VVS1"]
    @J_VVS2_price = h_J_clar_price["VVS2"]
    @J_VS1_price = h_J_clar_price["VS1"]
    @J_VS2_price = h_J_clar_price["VS2"]
    @J_SI1_price = h_J_clar_price["SI1"]
    @J_SI2_price = h_J_clar_price["SI2"]

    @K_IF_price = h_K_clar_price["IF"]
    @K_VVS1_price = h_K_clar_price["VVS1"]
    @K_VVS2_price = h_K_clar_price["VVS2"]
    @K_VS1_price = h_K_clar_price["VS1"]
    @K_VS2_price = h_K_clar_price["VS2"]
    @K_SI1_price = h_K_clar_price["SI1"]
    @K_SI2_price = h_K_clar_price["SI2"]

    @L_IF_price = h_L_clar_price["IF"]
    @L_VVS1_price = h_L_clar_price["VVS1"]
    @L_VVS2_price = h_L_clar_price["VVS2"]
    @L_VS1_price = h_L_clar_price["VS1"]
    @L_VS2_price = h_L_clar_price["VS2"]
    @L_SI1_price = h_L_clar_price["SI1"]
    @L_SI2_price = h_L_clar_price["SI2"]

    @M_IF_price = h_M_clar_price["IF"]
    @M_VVS1_price = h_M_clar_price["VVS1"]
    @M_VVS2_price = h_M_clar_price["VVS2"]
    @M_VS1_price = h_M_clar_price["VS1"]
    @M_VS2_price = h_M_clar_price["VS2"]
    @M_SI1_price = h_M_clar_price["SI1"]
    @M_SI2_price = h_M_clar_price["SI2"]
 

    weight_group_03_color_D_IF = Diamond.date_one_week.weight03.color("D").clar("IF")
    weight_group_03_color_E_IF = Diamond.date_one_week.weight03.color("E").clar("IF")
    weight_group_03_color_F_IF = Diamond.date_one_week.weight03.color("F").clar("IF")
    weight_group_03_color_G_IF = Diamond.date_one_week.weight03.color("G").clar("IF")
    weight_group_03_color_H_IF = Diamond.date_one_week.weight03.color("H").clar("IF")
    weight_group_03_color_I_IF = Diamond.date_one_week.weight03.color("I").clar("IF")
    weight_group_03_color_J_IF = Diamond.date_one_week.weight03.color("J").clar("IF")
    weight_group_03_color_K_IF = Diamond.date_one_week.weight03.color("K").clar("IF")
    weight_group_03_color_L_IF = Diamond.date_one_week.weight03.color("L").clar("IF")
    weight_group_03_color_M_IF = Diamond.date_one_week.weight03.color("M").clar("IF")

    @daily_weight_group_03_color_D_IF = weight_group_03_color_D_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_E_IF = weight_group_03_color_E_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_F_IF = weight_group_03_color_F_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_G_IF = weight_group_03_color_G_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_H_IF = weight_group_03_color_H_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_I_IF = weight_group_03_color_I_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_J_IF = weight_group_03_color_J_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_K_IF = weight_group_03_color_K_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_L_IF = weight_group_03_color_L_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
    @daily_weight_group_03_color_M_IF = weight_group_03_color_M_IF.select('date, color, clar, AVG(end_price * 0.3 / weight) AS avg_price').group(:date)
  
    # weight_group_03_color_D_IF = Diamond.weight(0.3).color("D").clar("IF")
    # weight_group_03_color_E_IF = Diamond.weight(0.3).color("E").clar("IF")
    # weight_group_03_color_F_IF = Diamond.weight(0.3).color("F").clar("IF")
    # weight_group_03_color_G_IF = Diamond.weight(0.3).color("G").clar("IF")
    # weight_group_03_color_H_IF = Diamond.weight(0.3).color("H").clar("IF")
    # weight_group_03_color_I_IF = Diamond.weight(0.3).color("I").clar("IF")
    # weight_group_03_color_J_IF = Diamond.weight(0.3).color("J").clar("IF")
    # weight_group_03_color_K_IF = Diamond.weight(0.3).color("K").clar("IF")
    # weight_group_03_color_L_IF = Diamond.weight(0.3).color("L").clar("IF")
    # weight_group_03_color_M_IF = Diamond.weight(0.3).color("M").clar("IF")
  
    
    # weight_group_03_color_D_IF = Diamond.where(weight: 0.3).where(color: "D").where(clar: "IF")
    # weight_group_03_color_E_IF = Diamond.where(weight: 0.3).where(color: "E").where(clar: "IF")
    # weight_group_03_color_F_IF = Diamond.where(weight: 0.3).where(color: "F").where(clar: "IF")
    # weight_group_03_color_G_IF = Diamond.where(weight: 0.3).where(color: "G").where(clar: "IF")
    # weight_group_03_color_H_IF = Diamond.where(weight: 0.3).where(color: "H").where(clar: "IF")
    # weight_group_03_color_I_IF = Diamond.where(weight: 0.3).where(color: "I").where(clar: "IF")
    # weight_group_03_color_J_IF = Diamond.where(weight: 0.3).where(color: "J").where(clar: "IF")
    # weight_group_03_color_K_IF = Diamond.where(weight: 0.3).where(color: "K").where(clar: "IF")
    # weight_group_03_color_L_IF = Diamond.where(weight: 0.3).where(color: "L").where(clar: "IF")
    # weight_group_03_color_M_IF = Diamond.where(weight: 0.3).where(color: "M").where(clar: "IF")
    
    # weight_group_03_color_D_VVS1 = Diamond.where(weight: 0.3).where(color: "D").where(clar: "VVS1")
    # weight_group_03_color_E_VVS1 = Diamond.where(weight: 0.3).where(color: "E").where(clar: "VVS1")
    # weight_group_03_color_F_VVS1 = Diamond.where(weight: 0.3).where(color: "F").where(clar: "VVS1")
    # weight_group_03_color_G_VVS1 = Diamond.where(weight: 0.3).where(color: "G").where(clar: "VVS1")
    # weight_group_03_color_H_VVS1 = Diamond.where(weight: 0.3).where(color: "H").where(clar: "VVS1")
    # weight_group_03_color_I_VVS1 = Diamond.where(weight: 0.3).where(color: "I").where(clar: "VVS1")
    # weight_group_03_color_J_VVS1 = Diamond.where(weight: 0.3).where(color: "J").where(clar: "VVS1")
    # weight_group_03_color_K_VVS1 = Diamond.where(weight: 0.3).where(color: "K").where(clar: "VVS1")
    # weight_group_03_color_L_VVS1 = Diamond.where(weight: 0.3).where(color: "L").where(clar: "VVS1")
    # weight_group_03_color_M_VVS1 = Diamond.where(weight: 0.3).where(color: "M").where(clar: "VVS1")

    

    
    #0.3_All
    #Date
    # weight_group_03_color_D_IF_date = weight_group_03_color_D_IF.pluck(:date).uniq
    weight_group_03_color_D_IF_date = []
    @daily_weight_group_03_color_D_IF.each do |diamond|
      weight_group_03_color_D_IF_date << diamond.date
    end

    # binding.pry
    #Price_0.3

    weight_group_03_color_D_IF_end_price = []
    @daily_weight_group_03_color_D_IF.each do |diamond|
      weight_group_03_color_D_IF_end_price << diamond.avg_price.round
    end
    # binding.pry




    
    # require "date"
    # require 'time'
    # sdate = weight_group_03_color_D_IF_date
    # sdate.each do |str|
    # #   # @date = DateTime.parse(str)
    # #   @date = Date.strptime(str)
    # @date = Date.parse(date).strftime("%d/%m/%Y %H:%M")
    # end
    
    # dt = []
    # sdate.flatten.each do |date|
    #   dt << DateTime.parse(date).strftime("%d/%m/%Y %H:%M")
    # end
    
    
    
    # binding.pry
    
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      
      f.global(useUTC: false)
      @sdate = weight_group_03_color_D_IF_date.find.first
      # binding.pry
      f.title(:text => "Diamond Price Chart")
      
      f.xAxis(:type => 'datetime', :dateTimeLabelFormats => { month: '%b %e, %Y' })
      
      # f.xAxis(:categories => weight_group_03_color_D_IF_date)
      f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_IF", :data => weight_group_03_color_D_IF_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VVS1", :data => weight_group_03_color_D_VVS1_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VVS2", :data => weight_group_03_color_D_VVS2_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VS1", :data => weight_group_03_color_D_VS1_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_VS2", :data => weight_group_03_color_D_VS2_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_SI1", :data => weight_group_03_color_D_SI1_end_price)
      # f.series(:pointInterval => 1.day, :pointStart => @sdate, :name => "0.3_D_SI2", :data => weight_group_03_color_D_SI2_end_price)
      
      
      f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      # f.chart({:defaultSeriesType=>"column"})
    end
    
  end
  
  def create
    @diamond = Diamond.new(diamond_params)
    @diamond.save
    redirect_to root_path , notice: 'データを保存しました'
  end
  
  
  def chart
    #indexページからグラフ描画の引数を取得
    weight = params[:q][:weight]
    color = params[:q][:color]
    clar = params[:q][:clar]
    date = params[:q][:date]

    if date == "1w"
        onw_week_data = Diamond.date_one_week
        # @diamonds = onw_week_data.ransack(:weight_eq => weight).result
        @diamonds = onw_week_data.weight"#{weight}"
      elsif date == "1m"
        one_month_data = Diamond.date_one_month
        # @diamonds = one_month_data.ransack(:weight_eq => weight).result
        @diamonds = one_month_data.weight"#{weight}"
      elsif date == "3m"
        three_month_data = Diamond.date_three_month
        # @diamonds = three_month_data.ransack(:weight_eq => weight).result
        @diamonds = three_month_data.weight"#{weight}"
      elsif date == "6m"
        six_month_data = Diamond.date_six_month
        # @diamonds = six_month_data.ransack(:weight_eq => weight).result
        @diamonds = six_month_data.weight"#{weight}"
      elsif date == "1y"
        one_year_data = Diamond.date_one_year
        # @diamonds = one_year_data.ransack(:weight_eq => weight).result
        @diamonds = one_year_data.weight"#{weight}"
      elsif date == "max"
        full_year_data = Diamond.date_full_year
        # @diamonds = full_year_data.ransack(:weight_eq => weight).result
        @diamonds = full_year_data.weight"#{weight}"
    end
    
    #For ransack
    @q = Diamond.ransack(params[:q])
    
    #Weightでソート
    # @diamonds = Diamond.ransack(:weight_eq => weight).result(distinct: true)

    @diamonds_D = @diamonds.ransack(:color_eq => "D").result
    @diamonds_E = @diamonds.ransack(:color_eq => "E").result
    @diamonds_F = @diamonds.ransack(:color_eq => "F").result
    @diamonds_G = @diamonds.ransack(:color_eq => "G").result
    @diamonds_H = @diamonds.ransack(:color_eq => "H").result
    @diamonds_I = @diamonds.ransack(:color_eq => "I").result
    @diamonds_J = @diamonds.ransack(:color_eq => "J").result
    @diamonds_K = @diamonds.ransack(:color_eq => "K").result
    @diamonds_L = @diamonds.ransack(:color_eq => "L").result
    @diamonds_M = @diamonds.ransack(:color_eq => "M").result
    
    #Weight+Colorでソート
    @diamonds_color = @diamonds.ransack(:color_eq => color).result
    
    g_if_end_price = @diamonds_color.ransack(:clar_eq => "IF").result
    g_vvs1_end_price = @diamonds_color.ransack(:clar_eq => "VVS1").result
    g_vvs2_end_price = @diamonds_color.ransack(:clar_eq => "VVS2").result
    g_vs1_end_price = @diamonds_color.ransack(:clar_eq => "VS1").result
    g_vs2_end_price = @diamonds_color.ransack(:clar_eq => "VS2").result
    g_si1_end_price = @diamonds_color.ransack(:clar_eq => "SI1").result
    g_si2_end_price = @diamonds_color.ransack(:clar_eq => "SI2").result

    @weight_color_group_if = g_if_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_vvs1 = g_vvs1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_vvs2 = g_vvs2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_vs1 = g_vs1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_vs2 = g_vs2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_si1 = g_si1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @weight_color_group_si2 = g_si2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)

    #Date
    group_IF_date = []
    group_VVS1_date = []
    group_VVS2_date = []
    group_VS1_date = []
    group_VS2_date = []
    group_SI1_date = []
    group_SI2_date = []

    @weight_color_group_if.each do |diamond|
      group_IF_date << diamond.date
    end

    @weight_color_group_vvs1.each do |diamond|
      group_VVS1_date << diamond.date
    end

    @weight_color_group_vvs2.each do |diamond|
      group_VVS2_date << diamond.date
    end

    @weight_color_group_vs1.each do |diamond|
      group_VS1_date << diamond.date
    end

    @weight_color_group_vs2.each do |diamond|
      group_VS2_date << diamond.date
    end

    @weight_color_group_si1.each do |diamond|
      group_SI1_date << diamond.date
    end

    @weight_color_group_si2.each do |diamond|
      group_SI2_date << diamond.date
    end

    if_end_price = []
    vvs1_end_price = []
    vvs2_end_price = []
    vs1_end_price = []
    vs2_end_price = []
    si1_end_price = []
    si2_end_price = []

    @weight_color_group_if.each do |diamond|
      if_end_price << diamond.avg_price.round
    end

    @weight_color_group_vvs1.each do |diamond|
      vvs1_end_price << diamond.avg_price.round
    end

    @weight_color_group_vvs2.each do |diamond|
      vvs2_end_price << diamond.avg_price.round
    end

    @weight_color_group_vs1.each do |diamond|
      vs1_end_price << diamond.avg_price.round
    end

    @weight_color_group_vs2.each do |diamond|
      vs2_end_price << diamond.avg_price.round
    end

    @weight_color_group_si1.each do |diamond|
      si1_end_price << diamond.avg_price.round
    end

    @weight_color_group_si2.each do |diamond|
      si2_end_price << diamond.avg_price.round
    end

    #Weight+Color+clarでソート
    @diamonds_clar = @diamonds_color.ransack(:clar_eq => clar).result
    
    @g_clar_end_price = @diamonds_clar.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)

    clar_end_price = []
    @g_clar_end_price.each do |diamond|
      clar_end_price << diamond.avg_price.round
    end

    # binding.pry
    
    #Date
    # date2 = @diamonds.pluck(:date)
    
    #color_D
    g_color_D_IF_end_price = @diamonds_D.ransack(:clar_eq => "IF").result
    g_color_D_VVS1_end_price = @diamonds_D.ransack(:clar_eq => "VVS1").result
    g_color_D_VVS2_end_price = @diamonds_D.ransack(:clar_eq => "VVS2").result
    g_color_D_VS1_end_price = @diamonds_D.ransack(:clar_eq => "VS1").result
    g_color_D_VS2_end_price = @diamonds_D.ransack(:clar_eq => "VS2").result
    g_color_D_SI1_end_price = @diamonds_D.ransack(:clar_eq => "SI1").result
    g_color_D_SI2_end_price = @diamonds_D.ransack(:clar_eq => "SI2").result

    @color_D_group_if = g_color_D_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vvs1 = g_color_D_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vvs2 = g_color_D_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vs1 = g_color_D_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_vs2 = g_color_D_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_si1 = g_color_D_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_D_group_si2 = g_color_D_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_D_IF_end_price = []
    color_D_VVS1_end_price = []
    color_D_VVS2_end_price = []
    color_D_VS1_end_price = []
    color_D_VS2_end_price = []
    color_D_SI1_end_price = []
    color_D_SI2_end_price = []

    @color_D_group_if.each do |diamond|
      color_D_IF_end_price << diamond.avg_price.round
    end

    @color_D_group_vvs1.each do |diamond|
      color_D_VVS1_end_price << diamond.avg_price.round
    end

    @color_D_group_vvs2.each do |diamond|
      color_D_VVS2_end_price << diamond.avg_price.round
    end

    @color_D_group_vs1.each do |diamond|
      color_D_VS1_end_price << diamond.avg_price.round
    end

    @color_D_group_vs2.each do |diamond|
      color_D_VS2_end_price << diamond.avg_price.round
    end

    @color_D_group_si1.each do |diamond|
      color_D_SI1_end_price << diamond.avg_price.round
    end

    @color_D_group_si2.each do |diamond|
      color_D_SI2_end_price << diamond.avg_price.round
    end

    #color_E
    g_color_E_IF_end_price = @diamonds_E.ransack(:clar_eq => "IF").result
    g_color_E_VVS1_end_price = @diamonds_E.ransack(:clar_eq => "VVS1").result
    g_color_E_VVS2_end_price = @diamonds_E.ransack(:clar_eq => "VVS2").result
    g_color_E_VS1_end_price = @diamonds_E.ransack(:clar_eq => "VS1").result
    g_color_E_VS2_end_price = @diamonds_E.ransack(:clar_eq => "VS2").result
    g_color_E_SI1_end_price = @diamonds_E.ransack(:clar_eq => "SI1").result
    g_color_E_SI2_end_price = @diamonds_E.ransack(:clar_eq => "SI2").result

    @color_E_group_if = g_color_E_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vvs1 = g_color_E_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vvs2 = g_color_E_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vs1 = g_color_E_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_vs2 = g_color_E_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_si1 = g_color_E_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_E_group_si2 = g_color_E_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_E_IF_end_price = []
    color_E_VVS1_end_price = []
    color_E_VVS2_end_price = []
    color_E_VS1_end_price = []
    color_E_VS2_end_price = []
    color_E_SI1_end_price = []
    color_E_SI2_end_price = []

    @color_E_group_if.each do |diamond|
      color_E_IF_end_price << diamond.avg_price.round
    end

    @color_E_group_vvs1.each do |diamond|
      color_E_VVS1_end_price << diamond.avg_price.round
    end

    @color_E_group_vvs2.each do |diamond|
      color_E_VVS2_end_price << diamond.avg_price.round
    end

    @color_E_group_vs1.each do |diamond|
      color_E_VS1_end_price << diamond.avg_price.round
    end

    @color_E_group_vs2.each do |diamond|
      color_E_VS2_end_price << diamond.avg_price.round
    end

    @color_E_group_si1.each do |diamond|
      color_E_SI1_end_price << diamond.avg_price.round
    end

    @color_E_group_si2.each do |diamond|
      color_E_SI2_end_price << diamond.avg_price.round
    end
    
    #color_F
    g_color_F_IF_end_price = @diamonds_F.ransack(:clar_eq => "IF").result
    g_color_F_VVS1_end_price = @diamonds_F.ransack(:clar_eq => "VVS1").result
    g_color_F_VVS2_end_price = @diamonds_F.ransack(:clar_eq => "VVS2").result
    g_color_F_VS1_end_price = @diamonds_F.ransack(:clar_eq => "VS1").result
    g_color_F_VS2_end_price = @diamonds_F.ransack(:clar_eq => "VS2").result
    g_color_F_SI1_end_price = @diamonds_F.ransack(:clar_eq => "SI1").result
    g_color_F_SI2_end_price = @diamonds_F.ransack(:clar_eq => "SI2").result

    @color_F_group_if = g_color_F_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vvs1 = g_color_F_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vvs2 = g_color_F_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vs1 = g_color_F_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_vs2 = g_color_F_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_si1 = g_color_F_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_F_group_si2 = g_color_F_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_F_IF_end_price = []
    color_F_VVS1_end_price = []
    color_F_VVS2_end_price = []
    color_F_VS1_end_price = []
    color_F_VS2_end_price = []
    color_F_SI1_end_price = []
    color_F_SI2_end_price = []

    @color_F_group_if.each do |diamond|
      color_F_IF_end_price << diamond.avg_price.round
    end

    @color_F_group_vvs1.each do |diamond|
      color_F_VVS1_end_price << diamond.avg_price.round
    end

    @color_F_group_vvs2.each do |diamond|
      color_F_VVS2_end_price << diamond.avg_price.round
    end

    @color_F_group_vs1.each do |diamond|
      color_F_VS1_end_price << diamond.avg_price.round
    end

    @color_F_group_vs2.each do |diamond|
      color_F_VS2_end_price << diamond.avg_price.round
    end

    @color_F_group_si1.each do |diamond|
      color_F_SI1_end_price << diamond.avg_price.round
    end

    @color_F_group_si2.each do |diamond|
      color_F_SI2_end_price << diamond.avg_price.round
    end
    
    #color_G
    g_color_G_IF_end_price = @diamonds_G.ransack(:clar_eq => "IF").result
    g_color_G_VVS1_end_price = @diamonds_G.ransack(:clar_eq => "VVS1").result
    g_color_G_VVS2_end_price = @diamonds_G.ransack(:clar_eq => "VVS2").result
    g_color_G_VS1_end_price = @diamonds_G.ransack(:clar_eq => "VS1").result
    g_color_G_VS2_end_price = @diamonds_G.ransack(:clar_eq => "VS2").result
    g_color_G_SI1_end_price = @diamonds_G.ransack(:clar_eq => "SI1").result
    g_color_G_SI2_end_price = @diamonds_G.ransack(:clar_eq => "SI2").result

    @color_G_group_if = g_color_G_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vvs1 = g_color_G_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vvs2 = g_color_G_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vs1 = g_color_G_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_vs2 = g_color_G_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_si1 = g_color_G_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_G_group_si2 = g_color_G_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_G_IF_end_price = []
    color_G_VVS1_end_price = []
    color_G_VVS2_end_price = []
    color_G_VS1_end_price = []
    color_G_VS2_end_price = []
    color_G_SI1_end_price = []
    color_G_SI2_end_price = []

    @color_G_group_if.each do |diamond|
      color_G_IF_end_price << diamond.avg_price.round
    end

    @color_G_group_vvs1.each do |diamond|
      color_G_VVS1_end_price << diamond.avg_price.round
    end

    @color_G_group_vvs2.each do |diamond|
      color_G_VVS2_end_price << diamond.avg_price.round
    end

    @color_G_group_vs1.each do |diamond|
      color_G_VS1_end_price << diamond.avg_price.round
    end

    @color_G_group_vs2.each do |diamond|
      color_G_VS2_end_price << diamond.avg_price.round
    end

    @color_G_group_si1.each do |diamond|
      color_G_SI1_end_price << diamond.avg_price.round
    end

    @color_G_group_si2.each do |diamond|
      color_G_SI2_end_price << diamond.avg_price.round
    end

    
    #color_H
    g_color_H_IF_end_price = @diamonds_H.ransack(:clar_eq => "IF").result
    g_color_H_VVS1_end_price = @diamonds_H.ransack(:clar_eq => "VVS1").result
    g_color_H_VVS2_end_price = @diamonds_H.ransack(:clar_eq => "VVS2").result
    g_color_H_VS1_end_price = @diamonds_H.ransack(:clar_eq => "VS1").result
    g_color_H_VS2_end_price = @diamonds_H.ransack(:clar_eq => "VS2").result
    g_color_H_SI1_end_price = @diamonds_H.ransack(:clar_eq => "SI1").result
    g_color_H_SI2_end_price = @diamonds_H.ransack(:clar_eq => "SI2").result

    @color_H_group_if = g_color_H_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vvs1 = g_color_H_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vvs2 = g_color_H_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vs1 = g_color_H_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_vs2 = g_color_H_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_si1 = g_color_H_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_H_group_si2 = g_color_H_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_H_IF_end_price = []
    color_H_VVS1_end_price = []
    color_H_VVS2_end_price = []
    color_H_VS1_end_price = []
    color_H_VS2_end_price = []
    color_H_SI1_end_price = []
    color_H_SI2_end_price = []

    @color_H_group_if.each do |diamond|
      color_H_IF_end_price << diamond.avg_price.round
    end

    @color_H_group_vvs1.each do |diamond|
      color_H_VVS1_end_price << diamond.avg_price.round
    end

    @color_H_group_vvs2.each do |diamond|
      color_H_VVS2_end_price << diamond.avg_price.round
    end

    @color_H_group_vs1.each do |diamond|
      color_H_VS1_end_price << diamond.avg_price.round
    end

    @color_H_group_vs2.each do |diamond|
      color_H_VS2_end_price << diamond.avg_price.round
    end

    @color_H_group_si1.each do |diamond|
      color_H_SI1_end_price << diamond.avg_price.round
    end

    @color_H_group_si2.each do |diamond|
      color_H_SI2_end_price << diamond.avg_price.round
    end

    
    #color_I
    g_color_I_IF_end_price = @diamonds_I.ransack(:clar_eq => "IF").result
    g_color_I_VVS1_end_price = @diamonds_I.ransack(:clar_eq => "VVS1").result
    g_color_I_VVS2_end_price = @diamonds_I.ransack(:clar_eq => "VVS2").result
    g_color_I_VS1_end_price = @diamonds_I.ransack(:clar_eq => "VS1").result
    g_color_I_VS2_end_price = @diamonds_I.ransack(:clar_eq => "VS2").result
    g_color_I_SI1_end_price = @diamonds_I.ransack(:clar_eq => "SI1").result
    g_color_I_SI2_end_price = @diamonds_I.ransack(:clar_eq => "SI2").result

    @color_I_group_if = g_color_I_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vvs1 = g_color_I_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vvs2 = g_color_I_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vs1 = g_color_I_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_vs2 = g_color_I_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_si1 = g_color_I_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_I_group_si2 = g_color_I_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_I_IF_end_price = []
    color_I_VVS1_end_price = []
    color_I_VVS2_end_price = []
    color_I_VS1_end_price = []
    color_I_VS2_end_price = []
    color_I_SI1_end_price = []
    color_I_SI2_end_price = []

    @color_I_group_if.each do |diamond|
      color_I_IF_end_price << diamond.avg_price.round
    end

    @color_I_group_vvs1.each do |diamond|
      color_I_VVS1_end_price << diamond.avg_price.round
    end

    @color_I_group_vvs2.each do |diamond|
      color_I_VVS2_end_price << diamond.avg_price.round
    end

    @color_I_group_vs1.each do |diamond|
      color_I_VS1_end_price << diamond.avg_price.round
    end

    @color_I_group_vs2.each do |diamond|
      color_I_VS2_end_price << diamond.avg_price.round
    end

    @color_I_group_si1.each do |diamond|
      color_I_SI1_end_price << diamond.avg_price.round
    end

    @color_I_group_si2.each do |diamond|
      color_I_SI2_end_price << diamond.avg_price.round
    end

    
    #color_J
    g_color_J_IF_end_price = @diamonds_J.ransack(:clar_eq => "IF").result
    g_color_J_VVS1_end_price = @diamonds_J.ransack(:clar_eq => "VVS1").result
    g_color_J_VVS2_end_price = @diamonds_J.ransack(:clar_eq => "VVS2").result
    g_color_J_VS1_end_price = @diamonds_J.ransack(:clar_eq => "VS1").result
    g_color_J_VS2_end_price = @diamonds_J.ransack(:clar_eq => "VS2").result
    g_color_J_SI1_end_price = @diamonds_J.ransack(:clar_eq => "SI1").result
    g_color_J_SI2_end_price = @diamonds_J.ransack(:clar_eq => "SI2").result

    @color_J_group_if = g_color_J_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vvs1 = g_color_J_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vvs2 = g_color_J_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vs1 = g_color_J_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_vs2 = g_color_J_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_si1 = g_color_J_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_J_group_si2 = g_color_J_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_J_IF_end_price = []
    color_J_VVS1_end_price = []
    color_J_VVS2_end_price = []
    color_J_VS1_end_price = []
    color_J_VS2_end_price = []
    color_J_SI1_end_price = []
    color_J_SI2_end_price = []

    @color_J_group_if.each do |diamond|
      color_J_IF_end_price << diamond.avg_price.round
    end

    @color_J_group_vvs1.each do |diamond|
      color_J_VVS1_end_price << diamond.avg_price.round
    end

    @color_J_group_vvs2.each do |diamond|
      color_J_VVS2_end_price << diamond.avg_price.round
    end

    @color_J_group_vs1.each do |diamond|
      color_J_VS1_end_price << diamond.avg_price.round
    end

    @color_J_group_vs2.each do |diamond|
      color_J_VS2_end_price << diamond.avg_price.round
    end

    @color_J_group_si1.each do |diamond|
      color_J_SI1_end_price << diamond.avg_price.round
    end

    @color_J_group_si2.each do |diamond|
      color_J_SI2_end_price << diamond.avg_price.round
    end

    
    #color_K
    g_color_K_IF_end_price = @diamonds_K.ransack(:clar_eq => "IF").result
    g_color_K_VVS1_end_price = @diamonds_K.ransack(:clar_eq => "VVS1").result
    g_color_K_VVS2_end_price = @diamonds_K.ransack(:clar_eq => "VVS2").result
    g_color_K_VS1_end_price = @diamonds_K.ransack(:clar_eq => "VS1").result
    g_color_K_VS2_end_price = @diamonds_K.ransack(:clar_eq => "VS2").result
    g_color_K_SI1_end_price = @diamonds_K.ransack(:clar_eq => "SI1").result
    g_color_K_SI2_end_price = @diamonds_K.ransack(:clar_eq => "SI2").result

    @color_K_group_if = g_color_K_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vvs1 = g_color_K_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vvs2 = g_color_K_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vs1 = g_color_K_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_vs2 = g_color_K_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_si1 = g_color_K_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_K_group_si2 = g_color_K_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_K_IF_end_price = []
    color_K_VVS1_end_price = []
    color_K_VVS2_end_price = []
    color_K_VS1_end_price = []
    color_K_VS2_end_price = []
    color_K_SI1_end_price = []
    color_K_SI2_end_price = []

    @color_K_group_if.each do |diamond|
      color_K_IF_end_price << diamond.avg_price.round
    end

    @color_K_group_vvs1.each do |diamond|
      color_K_VVS1_end_price << diamond.avg_price.round
    end

    @color_K_group_vvs2.each do |diamond|
      color_K_VVS2_end_price << diamond.avg_price.round
    end

    @color_K_group_vs1.each do |diamond|
      color_K_VS1_end_price << diamond.avg_price.round
    end

    @color_K_group_vs2.each do |diamond|
      color_K_VS2_end_price << diamond.avg_price.round
    end

    @color_K_group_si1.each do |diamond|
      color_K_SI1_end_price << diamond.avg_price.round
    end

    @color_K_group_si2.each do |diamond|
      color_K_SI2_end_price << diamond.avg_price.round
    end

    
    #color_L
    g_color_L_IF_end_price = @diamonds_L.ransack(:clar_eq => "IF").result
    g_color_L_VVS1_end_price = @diamonds_L.ransack(:clar_eq => "VVS1").result
    g_color_L_VVS2_end_price = @diamonds_L.ransack(:clar_eq => "VVS2").result
    g_color_L_VS1_end_price = @diamonds_L.ransack(:clar_eq => "VS1").result
    g_color_L_VS2_end_price = @diamonds_L.ransack(:clar_eq => "VS2").result
    g_color_L_SI1_end_price = @diamonds_L.ransack(:clar_eq => "SI1").result
    g_color_L_SI2_end_price = @diamonds_L.ransack(:clar_eq => "SI2").result

    @color_L_group_if = g_color_L_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vvs1 = g_color_L_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vvs2 = g_color_L_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vs1 = g_color_L_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_vs2 = g_color_L_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_si1 = g_color_L_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_L_group_si2 = g_color_L_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_L_IF_end_price = []
    color_L_VVS1_end_price = []
    color_L_VVS2_end_price = []
    color_L_VS1_end_price = []
    color_L_VS2_end_price = []
    color_L_SI1_end_price = []
    color_L_SI2_end_price = []

    @color_L_group_if.each do |diamond|
      color_L_IF_end_price << diamond.avg_price.round
    end

    @color_L_group_vvs1.each do |diamond|
      color_L_VVS1_end_price << diamond.avg_price.round
    end

    @color_L_group_vvs2.each do |diamond|
      color_L_VVS2_end_price << diamond.avg_price.round
    end

    @color_L_group_vs1.each do |diamond|
      color_L_VS1_end_price << diamond.avg_price.round
    end

    @color_L_group_vs2.each do |diamond|
      color_L_VS2_end_price << diamond.avg_price.round
    end

    @color_L_group_si1.each do |diamond|
      color_L_SI1_end_price << diamond.avg_price.round
    end

    @color_L_group_si2.each do |diamond|
      color_L_SI2_end_price << diamond.avg_price.round
    end
    
    #color_M
    g_color_M_IF_end_price = @diamonds_M.ransack(:clar_eq => "IF").result
    g_color_M_VVS1_end_price = @diamonds_M.ransack(:clar_eq => "VVS1").result
    g_color_M_VVS2_end_price = @diamonds_M.ransack(:clar_eq => "VVS2").result
    g_color_M_VS1_end_price = @diamonds_M.ransack(:clar_eq => "VS1").result
    g_color_M_VS2_end_price = @diamonds_M.ransack(:clar_eq => "VS2").result
    g_color_M_SI1_end_price = @diamonds_M.ransack(:clar_eq => "SI1").result
    g_color_M_SI2_end_price = @diamonds_M.ransack(:clar_eq => "SI2").result

    @color_M_group_if = g_color_M_IF_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vvs1 = g_color_M_VVS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vvs2 = g_color_M_VVS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vs1 = g_color_M_VS1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_vs2 = g_color_M_VS2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_si1 = g_color_M_SI1_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    @color_M_group_si2 = g_color_M_SI2_end_price.select("date, color, clar, AVG(end_price * #{weight} / weight) AS avg_price").group(:date)
    
    color_M_IF_end_price = []
    color_M_VVS1_end_price = []
    color_M_VVS2_end_price = []
    color_M_VS1_end_price = []
    color_M_VS2_end_price = []
    color_M_SI1_end_price = []
    color_M_SI2_end_price = []

    @color_M_group_if.each do |diamond|
      color_M_IF_end_price << diamond.avg_price.round
    end

    @color_M_group_vvs1.each do |diamond|
      color_M_VVS1_end_price << diamond.avg_price.round
    end

    @color_M_group_vvs2.each do |diamond|
      color_M_VVS2_end_price << diamond.avg_price.round
    end

    @color_M_group_vs1.each do |diamond|
      color_M_VS1_end_price << diamond.avg_price.round
    end

    @color_M_group_vs2.each do |diamond|
      color_M_VS2_end_price << diamond.avg_price.round
    end

    @color_M_group_si1.each do |diamond|
      color_M_SI1_end_price << diamond.avg_price.round
    end

    @color_M_group_si2.each do |diamond|
      color_M_SI2_end_price << diamond.avg_price.round
    end

    

    # binding.pry
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # binding.pry
  
      if color == "all" and clar == "all"
        #カラット別で表示
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          #D_
          f.series(:name => "D_IF", :data => color_D_IF_end_price)
          f.series(:name => "D_VVS1", :data => color_D_VVS1_end_price)
          f.series(:name => "D_VVS2", :data => color_D_VVS2_end_price)
          f.series(:name => "D_VS1", :data => color_D_VS1_end_price)
          f.series(:name => "D_VS2", :data => color_D_VS2_end_price)
          f.series(:name => "D_SI1", :data => color_D_SI1_end_price)
          f.series(:name => "D_SI2", :data => color_D_SI2_end_price)
          
          #E_
          f.series(:name => "E_IF", :data => color_E_IF_end_price)
          f.series(:name => "E_VVS1", :data => color_E_VVS1_end_price)
          f.series(:name => "E_VVS2", :data => color_E_VVS2_end_price)
          f.series(:name => "E_VS1", :data => color_E_VS1_end_price)
          f.series(:name => "E_VS2", :data => color_E_VS2_end_price)
          f.series(:name => "E_SI1", :data => color_E_SI1_end_price)
          f.series(:name => "E_SI2", :data => color_E_SI2_end_price)
          
          #F_
          f.series(:name => "F_IF", :data => color_F_IF_end_price)
          f.series(:name => "F_VVS1", :data => color_F_VVS1_end_price)
          f.series(:name => "F_VVS2", :data => color_F_VVS2_end_price)
          f.series(:name => "F_VS1", :data => color_F_VS1_end_price)
          f.series(:name => "F_VS2", :data => color_F_VS2_end_price)
          f.series(:name => "F_SI1", :data => color_F_SI1_end_price)
          f.series(:name => "F_SI2", :data => color_F_SI2_end_price)
          
          #G_
          f.series(:name => "G_IF", :data => color_G_IF_end_price)
          f.series(:name => "G_VVS1", :data => color_G_VVS1_end_price)
          f.series(:name => "G_VVS2", :data => color_G_VVS2_end_price)
          f.series(:name => "G_VS1", :data => color_G_VS1_end_price)
          f.series(:name => "G_VS2", :data => color_G_VS2_end_price)
          f.series(:name => "G_SI1", :data => color_G_SI1_end_price)
          f.series(:name => "G_SI2", :data => color_G_SI2_end_price)
          
          #H_
          f.series(:name => "H_IF", :data => color_H_IF_end_price)
          f.series(:name => "H_VVS1", :data => color_H_VVS1_end_price)
          f.series(:name => "H_VVS2", :data => color_H_VVS2_end_price)
          f.series(:name => "H_VS1", :data => color_H_VS1_end_price)
          f.series(:name => "H_VS2", :data => color_H_VS2_end_price)
          f.series(:name => "H_SI1", :data => color_H_SI1_end_price)
          f.series(:name => "H_SI2", :data => color_H_SI2_end_price)
          
          #I_
          f.series(:name => "I_IF", :data => color_I_IF_end_price)
          f.series(:name => "I_VVS1", :data => color_I_VVS1_end_price)
          f.series(:name => "I_VVS2", :data => color_I_VVS2_end_price)
          f.series(:name => "I_VS1", :data => color_I_VS1_end_price)
          f.series(:name => "I_VS2", :data => color_I_VS2_end_price)
          f.series(:name => "I_SI1", :data => color_I_SI1_end_price)
          f.series(:name => "I_SI2", :data => color_I_SI2_end_price)
          
          #J_
          f.series(:name => "J_IF", :data => color_J_IF_end_price)
          f.series(:name => "J_VVS1", :data => color_J_VVS1_end_price)
          f.series(:name => "J_VVS2", :data => color_J_VVS2_end_price)
          f.series(:name => "J_VS1", :data => color_J_VS1_end_price)
          f.series(:name => "J_VS2", :data => color_J_VS2_end_price)
          f.series(:name => "J_SI1", :data => color_J_SI1_end_price)
          f.series(:name => "J_SI2", :data => color_J_SI2_end_price)
          
          #K_
          f.series(:name => "K_IF", :data => color_K_IF_end_price)
          f.series(:name => "K_VVS1", :data => color_K_VVS1_end_price)
          f.series(:name => "K_VVS2", :data => color_K_VVS2_end_price)
          f.series(:name => "K_VS1", :data => color_K_VS1_end_price)
          f.series(:name => "K_VS2", :data => color_K_VS2_end_price)
          f.series(:name => "K_SI1", :data => color_K_SI1_end_price)
          f.series(:name => "K_SI2", :data => color_K_SI2_end_price)
          
          #L_
          f.series(:name => "L_IF", :data => color_L_IF_end_price)
          f.series(:name => "L_VVS1", :data => color_L_VVS1_end_price)
          f.series(:name => "L_VVS2", :data => color_L_VVS2_end_price)
          f.series(:name => "L_VS1", :data => color_L_VS1_end_price)
          f.series(:name => "L_VS2", :data => color_L_VS2_end_price)
          f.series(:name => "L_SI1", :data => color_L_SI1_end_price)
          f.series(:name => "L_SI2", :data => color_L_SI2_end_price)
          
          #M_
          f.series(:name => "M_IF", :data => color_M_IF_end_price)
          f.series(:name => "M_VVS1", :data => color_M_VVS1_end_price)
          f.series(:name => "M_VVS2", :data => color_M_VVS2_end_price)
          f.series(:name => "M_VS1", :data => color_M_VS1_end_price)
          f.series(:name => "M_VS2", :data => color_M_VS2_end_price)
          f.series(:name => "M_SI1", :data => color_M_SI1_end_price)
          f.series(:name => "M_SI2", :data => color_M_SI2_end_price)
          
          
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
          # f.chart({:defaultSeriesType=>"column"})
    
        elsif color != "all" and clar == "all"
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          
          f.series(:name => "#{color}_IF", :data => if_end_price)
          f.series(:name => "#{color}_VVS1", :data => if_end_price)
          f.series(:name => "#{color}_VVS2", :data => vvs2_end_price)
          f.series(:name => "#{color}_VS1", :data => vs1_end_price)
          f.series(:name => "#{color}_VS2", :data => vs2_end_price)
          f.series(:name => "#{color}_SI1", :data => si1_end_price)
          f.series(:name => "#{color}_SI2", :data => si2_end_price)
          
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
        elsif  color != "all" and clar != "all"
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => group_IF_date)
          
          f.series(:name => "#{color}_#{clar}", :data => clar_end_price)
          f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
      end
    end  
    
  end
  
  private
  def diamond_params
    params.require(:diamond).permit(:date, :weight, :clar, :start_price, :end_price, :low_price, :high_price )
  end
  
end
