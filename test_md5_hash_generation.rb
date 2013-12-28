require 'digest'

max = 1_0

def print_elapsed_time_for_ruby(total)
  beginning_time = ::Time.now
  (1..total).each do |i|
    ::Digest::MD5.hexdigest(i.to_s)
  end

  elasped_time = ::Time.now - beginning_time
  puts "Total: #{total}\tTime: #{elasped_time.round(1)} (Ruby Digest)"
end

# Total: 100000 Time: 0.3 (Ruby Digest)
# Total: 1000000  Time: 2.3 (Ruby Digest)
# Total: 10000000 Time: 25.0 (Ruby Digest)
# Total: 100000000  Time: 246.3 (Ruby Digest)
(5..8).each {|power| print_elapsed_time_for_ruby(10**power) }

