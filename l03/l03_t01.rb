require 'httparty'
require "google/cloud/translate"
project_id = "translation-01-220716"
key_file = "My Project-cf8c099f9b91.json"
translate = Google::Cloud::Translate.new project: project_id, keyfile: key_file
target = "ru"
site = 'http://rubyboosters.herokuapp.com/halloffame'
score = 0
print "Введите никнейм: "
user = gets
system('cls')
ex = false
post_options = {
    body: 
    {
      password: 'CK|fErS#+Mw9',
      user: user,
      score: score
    }
  }

get_options = {
    body:
    {
      password: 'CK|fErS#+Mw9',
      user: user
    }
  }

def trans(translate, target, text)
    translation = translate.translate text, to: target
    return translation
end
def solving(text, translation, input)
    encrypted = text.gsub(/[^#{input}]/, '*')
    return encrypted
end
print "Введите никнейм: "
system('cls')
while ex == false
    words = File.readlines('noun_dictionary.txt').each {|l| l.chomp!}
    text = words.sample
    translation = trans(translate, target, text)
    encrypted = "*"*text.length
    solved = false
    att = 0
    input=""
    while solved == false
        puts translation
        puts encrypted
        input_t = gets.chomp
        input+=input_t
        encrypted = solving(text, translation, input)
        if encrypted == text
            solved = true
        end
        att += 1
        system('cls')
    end
    if att == 1
        score += text.length
    end
    if att > 1
        score += text.length / att
    end
    post_options[:body][:score] = score
    response = HTTParty.post(site, post_options)
    puts "ban"
    puts score
    response = HTTParty.get(site, get_options)
    arr = JSON.parse(response.body).to_a
    puts "User: #{arr[-1]['user']}\nScore: #{arr[-1]['score']}"
end
gets