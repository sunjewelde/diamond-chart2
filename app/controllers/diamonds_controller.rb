class DiamondsController < ApplicationController
  def new
    @diamond = Diamond.new
  end

  require "date"
  def index
    # @diamonds = Diamond.all
    #kaminariでページネーション
    @diamonds = Diamond.page(params[:page])
    @q = Diamond.ransack(params[:q])
    @diamonds2 = @q.result(distinct: true)
   
   weight = [0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1, 1.2, 1.5]
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

   latest = Diamond.last
   oldest = Diamond.first
   latest_date = latest.date
   oldest_date = oldest.date
   date_range =  latest_date - oldest_date
   three_days_ago = latest_date -3
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

    # weight_group_03_color_D_IF = Diamond.date_full_year.weight(0.3).color("D").clar("IF")
    # weight_group_03_color_E_IF = Diamond.date_full_year.weight(0.3).color("E").clar("IF")
    # weight_group_03_color_F_IF = Diamond.date_full_year.weight(0.3).color("F").clar("IF")
    # weight_group_03_color_G_IF = Diamond.date_full_year.weight(0.3).color("G").clar("IF")
    # weight_group_03_color_H_IF = Diamond.date_full_year.weight(0.3).color("H").clar("IF")
    # weight_group_03_color_I_IF = Diamond.date_full_year.weight(0.3).color("I").clar("IF")
    # weight_group_03_color_J_IF = Diamond.date_full_year.weight(0.3).color("J").clar("IF")
    # weight_group_03_color_K_IF = Diamond.date_full_year.weight(0.3).color("K").clar("IF")
    # weight_group_03_color_L_IF = Diamond.date_full_year.weight(0.3).color("L").clar("IF")
    # weight_group_03_color_M_IF = Diamond.date_full_year.weight(0.3).color("M").clar("IF")

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

    @daily_weight_group_03_color_D_IF = weight_group_03_color_D_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_E_IF = weight_group_03_color_E_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_F_IF = weight_group_03_color_F_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_G_IF = weight_group_03_color_G_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_H_IF = weight_group_03_color_H_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_I_IF = weight_group_03_color_I_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_J_IF = weight_group_03_color_J_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_K_IF = weight_group_03_color_K_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_L_IF = weight_group_03_color_L_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
    @daily_weight_group_03_color_M_IF = weight_group_03_color_M_IF.select('date, color, clar, AVG(end_price) AS avg_price').group(:date)
  
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
    weight_group_03_color_D_IF_date = weight_group_03_color_D_IF.pluck(:date).uniq
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
    
    #For ransack
    @q = Diamond.ransack(params[:q])
    
    #Weightでソート
    @diamonds = Diamond.ransack(:weight_eq => weight).result(distinct: true)
    
    @diamonds_D = @diamonds.ransack(:color_eq => "D").result(distinct: true)
    @diamonds_E = @diamonds.ransack(:color_eq => "E").result(distinct: true)
    @diamonds_F = @diamonds.ransack(:color_eq => "F").result(distinct: true)
    @diamonds_G = @diamonds.ransack(:color_eq => "G").result(distinct: true)
    @diamonds_H = @diamonds.ransack(:color_eq => "H").result(distinct: true)
    @diamonds_I = @diamonds.ransack(:color_eq => "I").result(distinct: true)
    @diamonds_J = @diamonds.ransack(:color_eq => "J").result(distinct: true)
    @diamonds_K = @diamonds.ransack(:color_eq => "K").result(distinct: true)
    @diamonds_L = @diamonds.ransack(:color_eq => "L").result(distinct: true)
    @diamonds_M = @diamonds.ransack(:color_eq => "M").result(distinct: true)
    
    #Weight+Colorでソート
    @diamonds_color = @diamonds.ransack(:color_eq => color).result(distinct: true)
    
    if_end_price = @diamonds_color.ransack(:clar_eq => "IF").result.pluck(:end_price)
    vvs1_end_price = @diamonds_color.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    vvs2_end_price = @diamonds_color.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    vs1_end_price = @diamonds_color.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    vs2_end_price = @diamonds_color.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    si1_end_price = @diamonds_color.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    si2_end_price = @diamonds_color.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #Weight+Color+clarでソート
    @diamonds_clar = @diamonds_color.ransack(:clar_eq => clar).result(distinct: true)
    
    clar_end_price = @diamonds_clar.pluck(:end_price)

    # binding.pry
    
    
    
    #Date
    date2 = @diamonds.pluck(:date)
    
    #color_D
    color_D_IF_end_price = @diamonds_D.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_D_VVS1_end_price = @diamonds_D.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_D_VVS2_end_price = @diamonds_D.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_D_VS1_end_price = @diamonds_D.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_D_VS2_end_price = @diamonds_D.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_D_SI1_end_price = @diamonds_D.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_D_SI2_end_price = @diamonds_D.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_E
    color_E_IF_end_price = @diamonds_E.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_E_VVS1_end_price = @diamonds_E.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_E_VVS2_end_price = @diamonds_E.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_E_VS1_end_price = @diamonds_E.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_E_VS2_end_price = @diamonds_E.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_E_SI1_end_price = @diamonds_E.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_E_SI2_end_price = @diamonds_E.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_F
    color_F_IF_end_price = @diamonds_F.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_F_VVS1_end_price = @diamonds_F.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_F_VVS2_end_price = @diamonds_F.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_F_VS1_end_price = @diamonds_F.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_F_VS2_end_price = @diamonds_F.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_F_SI1_end_price = @diamonds_F.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_F_SI2_end_price = @diamonds_F.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_G
    color_G_IF_end_price = @diamonds_G.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_G_VVS1_end_price = @diamonds_G.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_G_VVS2_end_price = @diamonds_G.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_G_VS1_end_price = @diamonds_G.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_G_VS2_end_price = @diamonds_G.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_G_SI1_end_price = @diamonds_G.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_G_SI2_end_price = @diamonds_G.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_H
    color_H_IF_end_price = @diamonds_H.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_H_VVS1_end_price = @diamonds_H.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_H_VVS2_end_price = @diamonds_H.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_H_VS1_end_price = @diamonds_H.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_H_VS2_end_price = @diamonds_H.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_H_SI1_end_price = @diamonds_H.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_H_SI2_end_price = @diamonds_H.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_I
    color_I_IF_end_price = @diamonds_I.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_I_VVS1_end_price = @diamonds_I.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_I_VVS2_end_price = @diamonds_I.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_I_VS1_end_price = @diamonds_I.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_I_VS2_end_price = @diamonds_I.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_I_SI1_end_price = @diamonds_I.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_I_SI2_end_price = @diamonds_I.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_J
    color_J_IF_end_price = @diamonds_J.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_J_VVS1_end_price = @diamonds_J.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_J_VVS2_end_price = @diamonds_J.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_J_VS1_end_price = @diamonds_J.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_J_VS2_end_price = @diamonds_J.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_J_SI1_end_price = @diamonds_J.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_J_SI2_end_price = @diamonds_J.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_K
    color_K_IF_end_price = @diamonds_K.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_K_VVS1_end_price = @diamonds_K.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_K_VVS2_end_price = @diamonds_K.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_K_VS1_end_price = @diamonds_K.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_K_VS2_end_price = @diamonds_K.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_K_SI1_end_price = @diamonds_K.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_K_SI2_end_price = @diamonds_K.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_L
    color_L_IF_end_price = @diamonds_L.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_L_VVS1_end_price = @diamonds_L.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_L_VVS2_end_price = @diamonds_L.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_L_VS1_end_price = @diamonds_L.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_L_VS2_end_price = @diamonds_L.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_L_SI1_end_price = @diamonds_L.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_L_SI2_end_price = @diamonds_L.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    
    #color_M
    color_M_IF_end_price = @diamonds_M.ransack(:clar_eq => "IF").result.pluck(:end_price)
    color_M_VVS1_end_price = @diamonds_M.ransack(:clar_eq => "VVS1").result.pluck(:end_price)
    color_M_VVS2_end_price = @diamonds_M.ransack(:clar_eq => "VVS2").result.pluck(:end_price)
    color_M_VS1_end_price = @diamonds_M.ransack(:clar_eq => "VS1").result.pluck(:end_price)
    color_M_VS2_end_price = @diamonds_M.ransack(:clar_eq => "VS2").result.pluck(:end_price)
    color_M_SI1_end_price = @diamonds_M.ransack(:clar_eq => "SI1").result.pluck(:end_price)
    color_M_SI2_end_price = @diamonds_M.ransack(:clar_eq => "SI2").result.pluck(:end_price)
    

    # binding.pry
    @chart = LazyHighCharts::HighChart.new('graph') do |f|
      # binding.pry
  
      if color == "all" and clar == "all"
        #カラット別で表示
          f.title(:text => "Diamond Price Chart #{weight}カラット")
          f.xAxis(:categories => date2)
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
          f.xAxis(:categories => date2)
          
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
          f.xAxis(:categories => date2)
          
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
