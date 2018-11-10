puts "Введите сумму депозита"
sum = gets.to_f
puts "Введите дату получения накоплений (формат даты: ГГ.ММ)"
date = gets.gsub(/^[0]/, '')
date = date.split('.')
date_m = date[0].to_i * 12 + date[1].to_i
i=0
new_sum = sum
while i != date_m
    new_sum = new_sum+0.07/12*new_sum
    i+=1
end
puts new_sum
gets