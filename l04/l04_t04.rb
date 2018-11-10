arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
letters = "a b c d e f g h i j k l m n o p q r s t u v w x y z".split(' ')
puts (arr.uniq).count, "\n"
i=0
num_w = []
while i != letters.length
    num_w += [letters[i]*(arr.select {|word| word[0].downcase==letters[i]}).count]
    i+=1
end
i=0
while i != letters.length
    print num_w.sort_by {|x| x.length}[i][0].chomp, ' '
    i+=1
end
2.times {puts "\n"}
num_w = []
i=0
num_c = 0
j = 0
while i != letters.length
    while j != arr.length
        num_c += arr[j].count(letters[i])
        j+=1
    end
    num_w += [letters[i]*num_c]
    i+=1
end
i=0
while i != letters.length
    print num_w.sort_by {|x| x.length}[i][0].chomp, ' '
    i+=1
end
gets