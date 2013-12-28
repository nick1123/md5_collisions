require 'digest'

def write_hashes_to_file(min, max, file_name)
  hashes = []
  (min..max).each do |i|
    hashes << ::Digest::MD5.hexdigest(i.to_s)
  end

  File.open(file_name, 'a') {|file| file.write(hashes.join("\n")) }
  puts "Wrote file #{file_name}"
end

# Clear out old files
`rm output/*.txt`

increment = (1_000_000 - 1)
iterations = (100 - 1)
min = 0
max = increment

(1..iterations).each do |i|
  file_name = "output/hashes_#{min}_to_#{max}.txt"
  write_hashes_to_file(min, max, file_name)
  min = max + 1
  max = min + increment
end

file_name = "output/hashes_#{min}_to_#{max}.txt"
write_hashes_to_file(min, max, file_name)

