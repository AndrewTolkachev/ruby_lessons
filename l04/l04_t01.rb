arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
puts arr.max_by(&:length)
gets