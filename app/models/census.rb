class Census

  attr_reader :raw_values

  def initialize(array)
    @raw_values = array
    # binding.pry
  end


  def date_sorted_sales_array
    monthly_sales = {}
    raw_values.map do |set|
      monthly_sales[set[4]] = set[0].to_i
    end
    # binding.pry
    monthly_sales.keys.sort.map {|key| monthly_sales[key]}
  end

  def percent_of_total_us
    #  11077,000,000  $493.300,000,000 billion
    ((date_sorted_sales_array[23] / 493300.0) * 100).round(2)
  end

end

#
# set: only really need cell value and time!

# # "[[\"cell_value\",\"category_code\",\"data_type_code\",\"seasonally_adj\",\"time\"],\n[\"10833\",\"453\",\"SM\",\"yes\",\"2017-02\"],\n[\"10156\",\"453\",\"SM\",\"yes\",\"2016-01\"],\n[\"10082\",\"453\",\"SM\",\"yes\",\"2016-02\"],\n[\"10278\",\"453\",\"SM\",\"yes\",\"2016-03\"],\n[\"10602\",\"453\",\"SM\",\"yes\",\"2016-04\"],\n[\"10843\",\"453\",\"SM\",\"yes\",\"2017-03\"],\n[\"10895\",\"453\",\"SM\",\"yes\",\"2017-04\"],\n[\"10449\",\"453\",\"SM\",\"yes\",\"2016-05\"],\n[\"10771\",\"453\",\"SM\",\"yes\",\"2017-05\"],\n[\"10502\",\"453\",\"SM\",\"yes\",\"2016-06\"],\n[\"10468\",\"453\",\"SM\",\"yes\",\"2016-07\"],\n[\"10579\",\"453\",\"SM\",\"yes\",\"2017-06\"],\n[\"10830\",\"453\",\"SM\",\"yes\",\"2017-07\"],\n[\"10367\",\"453\",\"SM\",\"yes\",\"2016-08\"],\n[\"10795\",\"453\",\"SM\",\"yes\",\"2017-08\"],\n[\"10684\",\"453\",\"SM\",\"yes\",\"2016-09\"],\n[\"10870\",\"453\",\"SM\",\"yes\",\"2017-09\"],\n[\"10795\",\"453\",\"SM\",\"yes\",\"2016-10\"],\n[\"10944\",\"453\",\"SM\",\"yes\",\"2017-10\"],\n[\"10576\",\"453\",\"SM\",\"yes\",\"2016-11\"],\n[\"10755\",\"453\",\"SM\",\"yes\",\"2017-01\"],\n[\"11368\",\"453\",\"SM\",\"yes\",\"2017-11\"],\n[\"11077\",\"453\",\"SM\",\"yes\",\"2017-12\"],\n[\"10653\",\"453\",\"SM\",\"yes\",\"2016-12\"]]"
#
# [10156, 10082, 10278, 10602, 10449, 10502, 10468, 10367, 10684, 10795, 10576, 10653, 10755, 10833, 10843, 10895, 10771, 10579, 10830, 10795, 10870, 10944, 11368, 11077, 0]