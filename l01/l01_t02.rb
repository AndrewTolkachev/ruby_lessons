string = gets.chomp
num = gets
if num.to_i >=20
    num = 20
end
i = 1
while i <= num.to_i do
    print string.to_str * i, "\n"
    i+=1
end