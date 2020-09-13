# A method named `binary_to_decimal` that receives as input an array of size 8.
# The array is randomly filled with 0’s and 1’s.
# The most significant bit is at index 0.
# The least significant bit is at index 7.
# Calculate and return the decimal value for this binary number using
# the algorithm you devised in class.
def binary_to_decimal(binary_array)
  # raise NotImplementedError
  decimal = 0
  power = binary_array.length - 1
  idx = 0

  binary_array.length.times do
    decimal += binary_array[idx] * 2 ** power
    idx += 1
    power -= 1
  end

  return decimal
end


# Converts positive decimal numbers only to binary
def decimal_to_binary(decimal_num)
  power = 0
  len = 1

  until (decimal_num - 2 ** power) < 0
    power += 1
    len += 1
  end

  # We want to fix any powers or array lengths
  # that are susceptible by "off-by-one" error
  if len > 1
    power -= 1
    len -= 1
  end

  binary_array = Array.new(len, 0)
  idx = 0
  while decimal_num > 0
    if decimal_num - 2 ** power >= 0
      binary_array[idx] = 1
      decimal_num = decimal_num - 2 ** power
    end
    power -= 1
    idx += 1
  end

  return binary_array
end
