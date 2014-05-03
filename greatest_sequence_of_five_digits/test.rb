################################################
# $> ruby -v
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
################################################
require 'benchmark'

def range(digits)
  lastBiggest = 0
  (digits.length-4).times do |index|
    value = digits[index .. index+4].to_i
    lastBiggest = value if value > lastBiggest
  end
  lastBiggest
end

def length(digits)
  lastBiggest = 0
  (digits.length-4).times do |index|
    value = digits[index, 5].to_i
    lastBiggest = value if value > lastBiggest
  end
  lastBiggest
end


alotofdigits = File.new("numbfile").gets
Benchmark.bmbm(8) do |x|
  x.report("range:") {range alotofdigits}
  x.report("length:") {length alotofdigits}
end
################################################
# $> ruby test.rb
# Rehearsal --------------------------------------------
# range:     2.200000   0.000000   2.200000 (  2.198225)
# length:    1.410000   0.000000   1.410000 (  1.415523)
# ----------------------------------- total: 3.610000sec
#
#                user     system      total        real
# range:     2.250000   0.000000   2.250000 (  2.258254)
# length:    1.490000   0.000000   1.490000 (  1.499753)
################################################
