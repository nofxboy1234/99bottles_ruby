# frozen_string_literal: true

# Bottles class
class Bottles
  def song
    verses(99, 0)
  end

  def verses(upper, lower)
    upper.downto(lower).collect { |i| verse(i) }.join("\n")
  end

  def verse(number)
    bottle_number = BottleNumber.for(number)

    "#{bottle_number} of beer on the wall, ".capitalize +
      "#{bottle_number} of beer.\n" \
      "#{bottle_number.action}, " \
      "#{bottle_number.successor} of beer on the wall.\n"
  end
end

class BottleNumber
  # Factories vary along these dimensions:
  # 1. The factory can be open to new variants or closed.

  # 2. The logic that chooses a variant can be owned by the factory
  #    or by the variant.

  # 3. The factory can be responsible for knowing/figuring out
  # which classes are eligible to be manufactured or the variants
  # can volunteer themselves.

  def self.for(number)
    # case number
    # when 0
    #   BottleNumber0
    # when 1
    #   BottleNumber1
    # when 6
    #   BottleNumber6
    # else
    #   BottleNumber
    # end.new(number)

    # begin
    #   const_get("BottleNumber#{number}")
    # rescue NameError
    #   BottleNumber
    # end.new(number)

    # Hash.new(BottleNumber).merge(
    #   0 => BottleNumber0,
    #   1 => BottleNumber1,
    #   6 => BottleNumber6
    # )[number].new(number)

    [BottleNumber6, BottleNumber1, BottleNumber0, BottleNumber].find do |candidate|
      candidate.handles?(number)
    end.new(number)
  end

  def self.handles?(_number)
    true
  end

  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_s
    "#{quantity} #{container}"
  end

  def quantity
    number.to_s
  end

  def container
    'bottles'
  end

  def action
    "Take #{pronoun} down and pass it around"
  end

  def pronoun
    'one'
  end

  def successor
    BottleNumber.for(number - 1)
  end
end

class BottleNumber0 < BottleNumber
  def self.handles?(number)
    number == 0
  end

  def quantity
    'no more'
  end

  def action
    'Go to the store and buy some more'
  end

  def successor
    BottleNumber.for(99)
  end
end

class BottleNumber1 < BottleNumber
  def self.handles?(number)
    number == 1
  end

  def container
    'bottle'
  end

  def pronoun
    'it'
  end
end

class BottleNumber6 < BottleNumber
  def self.handles?(number)
    number == 6
  end

  def quantity
    '1'
  end

  def container
    'six-pack'
  end
end
