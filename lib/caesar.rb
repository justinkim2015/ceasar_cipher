def caesar_cipher(string, shift)
  str_array = string.split('')
  ord_array = make_ord_array(str_array)
  new_str_array = []

  ord_array.each do |number|
    if lowercase?(number)
      new_str_array << shift_lower(number, shift)
    elsif number < 65 #This keeps punctuation in place
      new_str_array << number.chr
    elsif uppercase?(number)
      new_str_array << shift_upper(number, shift)
    end
  end

  new_str_array.join
end

def make_ord_array(array)
  arr = []
  array.each do |value|
    arr.push(value.ord)
  end
  arr
end

def lowercase?(number)
  true if number.between?(97, 122)
end

def uppercase?(number)
  true if number.between?(65, 90)
end

def lower_spill?(number, shift)
  true if number + shift > 122
end

def upper_spill?(number, shift)
  true if number + shift > 90
end

def shift_lower(number, shift)
  if lower_spill?(number, shift)
    wrap(number, shift)
  else
    (number + shift).chr
  end
end

def shift_upper(number, shift)
  if upper_spill?(number, shift)
    wrap(number, shift)
  else
    (number + shift).chr
  end
end

def wrap(number, shift)
  # 26 is 97(beginning of ascii values) - 123(end of ascii values) 26 letters
  number += shift
  number -= 26 while number > 122
  number.chr
end

caesar_cipher('Hhello!', 42)
