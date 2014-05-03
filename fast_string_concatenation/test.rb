################################################
# $> ruby -v
# ruby 2.1.1p76 (2014-02-24 revision 45161) [x86_64-darwin12.0]
################################################

def concat_x_millions x
  val = ""
  (1000000*x).times do |i|
    val += i.to_s
  end
end
################################################
# $> time ruby test.rb;time ruby test.rb;time ruby test.rb;time ruby test.rb;
# ^C
# ruby test.rb  362,20s user 756,11s system 98% cpu 18:49,69 total
# I shutted it down because it was too long,
# it would take more than 1GB RAM at this point
################################################



def concat_x_millions x
  val = ""
  (1000000*x).times do |i|
    val.concat(i.to_s)
  end
end
################################################
# $> time ruby test.rb;time ruby test.rb;time ruby test.rb;time ruby test.rb;
# ruby test.rb  0,44s user 0,01s system 98% cpu 0,459 total
# ruby test.rb  0,46s user 0,01s system 99% cpu 0,476 total
# ruby test.rb  0,44s user 0,01s system 99% cpu 0,456 total
# ruby test.rb  0,44s user 0,01s system 99% cpu 0,454 total
################################################

def concat_x_millions x
  val = ""
  (1000000*x).times do |i|
    val << i.to_s
  end
end
################################################
# $> time ruby test.rb;time ruby test.rb;time ruby test.rb;time ruby test.rb;
# ruby test.rb  0,42s user 0,01s system 99% cpu 0,437 total
# ruby test.rb  0,43s user 0,01s system 99% cpu 0,448 total
# ruby test.rb  0,40s user 0,01s system 99% cpu 0,417 total
# ruby test.rb  0,40s user 0,01s system 98% cpu 0,420 total
################################################


concat_x_millions 1
