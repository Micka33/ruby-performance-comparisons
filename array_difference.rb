################################################
# $> ruby -v
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
################################################
require 'benchmark'

def compare_1 arr_1, arr_2
    output = []

    temp = arr_2.each_with_object(Hash.new(0)) { |val, hsh| hsh[val] = 0 }

    arr_1.each do |element|
        if !temp.has_key? (element)
            output << element
        end
    end
    output
end

def compare_2 arr_1, arr_2
    out = []
    arr_1.each do |num|
        if (!arr_2.include?(num))
            out << num
        end
    end
    out
end

require 'set'
def compare_3 arr_1, arr_2
  temp = Set.new arr_2
  arr_1.reject { |e| temp.include? e }
end

def native arr_1, arr_2
  arr_1 - arr_2
end




a1 = (0..50000).to_a
a2 = (0..49999).to_a
Benchmark.bmbm(11) do |x|
  x.report("compare_1:") {compare_1(a1, a2)}
  x.report("compare_2:") {compare_2(a1, a2)}
  x.report("compare_3:") {compare_3(a1, a2)}
  x.report("native:")    {native(a1, a2)}
end
################################################
# $> ruby array_difference.rb
# Rehearsal -----------------------------------------------
# compare_1:    0.030000   0.000000   0.030000 (  0.031663)
# compare_2:   71.300000   0.040000  71.340000 ( 71.436027)
# compare_3:    0.040000   0.000000   0.040000 (  0.042202)
# native:       0.030000   0.010000   0.040000 (  0.030908)
# ------------------------------------- total: 71.450000sec
#
#                   user     system      total        real
# compare_1:    0.030000   0.000000   0.030000 (  0.030870)
# compare_2:   71.090000   0.030000  71.120000 ( 71.221141)
# compare_3:    0.030000   0.000000   0.030000 (  0.034612)
# native:       0.030000   0.000000   0.030000 (  0.030670)
################################################
