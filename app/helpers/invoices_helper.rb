module InvoicesHelper
  def get_viewable_break_up_hash
    break_up_hash = {}
    @break_up.split("/").each_with_index do |value, index|
      index == 0 ? break_up_hash.merge!({"Basic Amount" => value})  : break_up_hash.merge!({TAX_INPUT[index-1] => value})
    end
    break_up_hash
  end
end
