# frozen_string_literal: true

# Bottles class
class Bottles
  def verse(number)
    "#{number} bottles of beer on the wall, " \
    "#{number} botlles of beer.\n" \
    'Take one down and pass it around. ' \
    "#{number - 1} bottles of beer on the wall.\n"
  end
end
