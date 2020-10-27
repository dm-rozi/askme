module UsersHelper

  def questions_count_form(number, vopros, voprosa, voprosov, with_number = false)
    remainder10 = number.to_i % 10
    remainder100 = number.to_i % 100

    prefix = with_number ? "#{number} " : ""

    return prefix + voprosov if (11..14).include?(remainder100)

    word = case remainder10
           when 1 then vopros
           when 2..4 then voprosa
           else
             voprosov
           end
    prefix + word
  end
end
