arr = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
score = 0
word = (arr.sample).downcase
user_w = ''
puts word
used = [word]
while score != -1
    if user_w != ''
        word = ((arr.select {|word| word[0]==user_w[-1]}).sample).downcase
        puts word
        used += [word]
    end
    user_w = (gets.chomp).downcase
    if user_w[0] == word[-1] && used.any? {|word| user_w == word} == false && arr.any? {|word| user_w == word} == true
        score += 1
        used += [user_w]
        puts score
    else
        score -= 1
        used += [user_w]
        if score < 0
            puts "You lose... :("
        else
            puts score
        end
    end
    sleep(1)
    system('cls')
end