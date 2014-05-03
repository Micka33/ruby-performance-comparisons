################################################
# $> ruby -v
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
################################################
require 'benchmark'

def plus num
  val = ""
  num.times do |i|
    val += i.to_s
  end
  val
end

def concat num
  val = ""
  num.times do |i|
    val.concat(i.to_s)
  end
  val
end

def arrows num
  val = ""
  num.times do |i|
    val << i.to_s
  end
  val
end

num = 50000
Benchmark.bmbm(11) do |x|
  x.report("plus:") {plus num}
  x.report("concat:") {concat num}
  x.report("arrows:") {arrows num}
end
################################################
# $> ruby fast_string_concatenation.rb
# Rehearsal -----------------------------------------------
# plus:         1.250000   1.910000   3.160000 (  3.160035)
# concat:       0.020000   0.000000   0.020000 (  0.020662)
# arrows:       0.010000   0.000000   0.010000 (  0.018061)
# -------------------------------------- total: 3.190000sec
#
#                   user     system      total        real
# plus:         1.240000   1.890000   3.130000 (  3.139633)
# concat:       0.020000   0.000000   0.020000 (  0.018018)
# arrows:       0.020000   0.000000   0.020000 (  0.017364)
################################################