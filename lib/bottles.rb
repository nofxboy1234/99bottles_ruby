class Bottles
  def initialize; end

  def verse(bottles)
    "#{bottles} #{bottles > 1 ? 'bottles' : 'bottle'} of beer on the wall, " \
      "#{bottles} #{bottles > 1 ? 'bottles' : 'bottle'} of beer.\n" \
      'Take one down and pass it around, ' \
      "#{bottles - 1} #{bottles - 1 > 1 ? 'bottles' : 'bottle'} of beer on the wall.\n"
  end
end
