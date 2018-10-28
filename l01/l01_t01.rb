rub.to_f = gets
dollar = (rub / 65.44).round(2)
eur = (rub / 75.35).round(2)
sterl = (rub / 85.52).round(2)
puts "Сумма в рублях", rub
puts "Сумма в долларах", dollar
puts "Сумма в евро", eur
puts "Сумма в фунтах стерлинга", sterl