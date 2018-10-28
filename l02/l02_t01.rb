choice = 0
month = 0
def persent(sum)
    return sum * 0.01
end
def body(month, sum)
    return month - persent(sum)
end

def calc_m(sum)
    month = gets.to_f
    time = 1
    if month > persent(sum)
        puts "+--------+------------+------------+------------+------------+"
        puts "|    1   |     2      |     3      |      4     |      5     |"
        while sum > month
            puts "+--------+------------+------------+------------+------------+"
            printf "|%3uy %2um|%12.2f|%12.2f|%12.2f|%12.2f|\n", (time/12).to_i, time%12, sum, persent(sum), month, body(month, sum)
            sum -= body(month, sum)
            time += 1
        end
        month = persent(sum)+sum
        puts "+--------+------------+------------+------------+------------+"
        printf "|%3uy %2um|%12.2f|%12.2f|%12.2f|%12.2f|\n", (time/12).to_i, time%12, sum, persent(sum), month, body(month, sum)
        puts "+--------+------------+------------+------------+------------+"
    else
        puts "Недостаточно средств для выплаты. Минимальная сумма выплаты: ", persent(sum)+0.1
    end
end

def calc_pay(sum)
    time = gets.to_i
    month = sum/time+persent(sum)
    begin
        test_sum = sum.to_f
        for i in 1..time
            test_sum -= body(month, test_sum)
        end
        month_old = month
        month=month_old+test_sum/time
    end until test_sum.to_i == 0
    print "Месячный платеж: ",month_old.round(2),"\n"
end

sum = gets.to_f
puts "Выберите? \n1. Считать кол-во месяцов \n2. Считать месячный платеж"
choice = gets.to_i
case choice
    when 1
        calc_m(sum)
    when 2
        calc_pay(sum)
    else
        print "Вы ввели неверное значение"
end
gets