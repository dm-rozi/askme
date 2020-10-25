module UsersHelper

  def questions_count_form(number, vopros, voprosa, voprosov, with_number = false)
    remainder10 = number.to_i % 10
    remainder100 = number.to_i % 100
    prefix = ""
    prefix = "#{number} " if with_number

    if (11..14).include?(remainder100)
      return "#{prefix}#{voprosov}"
    elsif  remainder10 == 1
      return "#{prefix}#{vopros}"
    elsif (2..4).include?(remainder10)
      return "#{prefix}#{voprosa}"
    else
      return "#{prefix}#{voprosov}"
    end
  end
end
