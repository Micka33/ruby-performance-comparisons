################################################
# $> ruby -v
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
################################################

def solution(digits)
  lastBiggest = 0
  (digits.length-4).times do |index|
    value = digits[index .. index+4].to_i
    lastBiggest = value if value > lastBiggest
  end
  lastBiggest
end
################################################
# $> time ruby test.rb;time ruby test.rb;time ruby test.rb;time ruby test.rb;
# ruby test.rb  2,29s user 0,01s system 99% cpu 2,315 total
# ruby test.rb  2,28s user 0,01s system 99% cpu 2,300 total
# ruby test.rb  2,34s user 0,01s system 99% cpu 2,359 total
# ruby test.rb  2,29s user 0,01s system 99% cpu 2,306 total
################################################

def solution(digits)
  lastBiggest = 0
  (digits.length-4).times do |index|
    value = digits[index, 5].to_i
    lastBiggest = value if value > lastBiggest
  end
  lastBiggest
end
################################################
# $> time ruby test.rb;time ruby test.rb;time ruby test.rb;time ruby test.rb;
# ruby test.rb  1,46s user 0,01s system 99% cpu 1,476 total
# ruby test.rb  1,44s user 0,01s system 99% cpu 1,451 total
# ruby test.rb  1,48s user 0,01s system 99% cpu 1,499 total
# ruby test.rb  1,48s user 0,01s system 99% cpu 1,498 total
################################################

solution(File.new("numbfile").gets)
