class LuhnAlgorithm
  def initialize(card_number)
    reversed = reverse_card_number(card_number)
    split = split_card_number(reversed)
    doubled = double_every_other_number(split)
    singled = convert_to_single_digits(doubled)
    sum = sum_of_digits(singled)
    verification(sum)
  end

  def reverse_card_number(card_number)
    card_number.reverse
  end

  def split_card_number(card_number)
    card_number_array = card_number.split("")
    convert_to_integer(card_number_array)
  end

  def convert_to_integer(card_number_array)
    card_number_array.map do |number|
      number.to_i
    end
  end

  def convert_to_string(card_number)
    card_number.map do |number|
      number.to_s
    end
  end

  def double_every_other_number(card_number)
    doubled_number = card_number.each_with_index.map {|v,i| i % 2 == 0 ? v : v * 2 }
    convert_to_string(doubled_number)
  end

  def convert_to_single_digits(card_number)
    card_number.join.chars.map(&:to_i)
  end

  def sum_of_digits(card_number)
    card_number.map.reduce(0, :+)
  end

  def verification(sum)
    if sum % 10 == 0
      puts "The number is valid!"
    else
      puts "The number is invalid!"
    end
  end
end

LuhnAlgorithm.new("4929735477250543")
LuhnAlgorithm.new("5541808923795240")
LuhnAlgorithm.new("4024007136512380")
LuhnAlgorithm.new("6011797668867828")
LuhnAlgorithm.new("5541801923795240")
LuhnAlgorithm.new("4024007106512380")
LuhnAlgorithm.new("6011797668868728")
LuhnAlgorithm.new("342804633855673") #American Express
LuhnAlgorithm.new("342801633855673") #American Express
