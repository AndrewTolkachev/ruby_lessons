puts "Введите буквы"
letters = gets.chomp
begin
    puts "Введите длину слова"
    num = gets.to_i
end until num > 2
    i = 0
arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
while i != arr.length
    text = arr[i]
    if( text =~ /^[#{letters}]{1,#{num}}$/ )
        print text,"\n"
        break
    end
    i+=1
end