class StaticsController < ApplicationController
  def index
    @statics= Statics.find_by_sql "Select * From statics"
    @vendido= Statics.find_by_sql "Select * From vendido"
    @ganancia= Statics.find_by_sql "Select * From ganancia"
    @inversion= Statics.find_by_sql "Select * From inversion"
  end
end
