class Bottles
  def song
    verses(99, 0)
  end

  def verses(hi, lo)
    hi.downto(lo).map { |_n| verse(n) }.join("\n")
  end

  def verse(n)
    "#{n.zero? ? 'No more' : n} bottle#{'s' if n != 1}" \
    'of beer on the wall, ' \
    "#{n.zero? ? 'no more' : n} bottle#{'s' if n != 1} of beer.\n" \
    "#{if n.positive?
         "Take #{n > 1 ? 'one' : 'it'} down and pass it around"
       else
         'Go to the store and buy some more'
       end}, " \
    "#{if (n - 1).negative?
         99
       else
         (n - 1).zero? ? 'no more' : n - 1
       end} bottle#{'s' if n - 1 != 1}" \
    " of beer on the wall.\n"
  end
end
