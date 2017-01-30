module EventsHelper
  
  def display_particulars particular, format=true
    return particular if particular.split("(").length == 1
    particulars_array = particular.split("(")
    particulars_sub_array = particulars_array.last.split(",")
    particulars_sub_array.first.gsub!("(",'')
    particulars_sub_array.last.gsub!(")",'')
    arr = particulars_sub_array.map{ |element| "\t #{element}\n"}
    resultant_particular = particulars_array.first + "\n" + arr.join("")
    format ? format_particulars(resultant_particular) : resultant_particular
  end
  
  def format_particulars particular
    "<pre>" + particular + "</pre>"
  end
end
