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
    "#{quantity(number).capitalize} #{container(number)} of beer on the wall, " \
    "#{quantity(number)} #{container(number)} of beer.\n" \
    "#{action(number)}, " \
    "#{quantity(successor(number))} #{container(successor(number))} of beer on the wall.\n"
  end

  def container(number)
    BottleNumber.new(number).container(number)
  end

  def pronoun(number)
    BottleNumber.new(number).pronoun(number)
  end

  def quantity(number)
    BottleNumber.new(number).quantity
  end

  def action(number)
    BottleNumber.new(number).action(number)
  end

  def successor(number)
    BottleNumber.new(number).successor(number)
  end
end

class BottleNumber
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def container(number)
    if number == 1
      'bottle'
    else
      'bottles'
    end
  end

  def pronoun(number)
    if number == 1
      'it'
    else
      'one'
    end
  end

  def quantity
    if number.zero?
      'no more'
    else
      number.to_s
    end
  end

  def action(number)
    if number.zero?
      'Go to the store and buy some more'
    else
      "Take #{pronoun(number)} down and pass it around"
    end
  end

  def successor(number)
    if number.zero?
      99
    else
      number - 1
    end
  end
end
