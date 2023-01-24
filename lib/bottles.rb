class Bottles
  def initialize; end

  def verse(bottles)
    "#{bottles} #{bottles > 1 ? 'bottles' : 'bottle'} of beer on the wall, " \
      "#{bottles} #{bottles > 1 ? 'bottles' : 'bottle'} of beer.\n" \
      "Take #{bottles > 1 ? 'one' : 'it'} down and pass it around, " \
      "#{(bottles - 1).zero? ? 'no more' : bottles - 1} #{bottles - 1 > 1 || (bottles - 1).zero? ? 'bottles' : 'bottle'} of beer on the wall.\n"
  end
end
