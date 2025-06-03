#if nhiều điều kiện
'''
1. Cho phép người dùng nhập vào một giá trị tháng. Hãy cho biết giá trị tháng vừa nhập
có hợp lệ hay không? (Với qui ước: tháng hợp lệ là tháng ∈ [1, 12]).
'''
thang = int(input("Nhap vao 1 thang trong nam: "))
if thang >=1 and thang <= 12:
    print("Thang hop le")
else:
    print("Thang khong hop le")
'''
2. Cho phép người dùng nhập vào số thực x, xuất f(x) theo công thức sau:
f(x) = - x! + 3x + 5, x > 0
−x! − 3x − 5, x ≤ 
'''
x=float(input("Nhap vao mot so thuc: "))
x_positive = x*x + 3*x + 5
x_negative = -x*(-x) - 3*x - 5
if x>0:
    print("f(x)=", x_positive)
elif x <=0:
    print("f(x)=", x_negative)
'''
3. Cho phép người dùng nhập vào 5 số a, b, c, d, e. Hãy cho biết trong 5 số vừa nhập
có bao nhiêu số âm, bao nhiêu số dương, bao nhiêu số bằng 0?
'''
# Nhập 5 số a, b, c, d, e
a = float(input("Nhập số a: "))
b = float(input("Nhập số b: "))
c = float(input("Nhập số c: "))
d = float(input("Nhập số d: "))
e = float(input("Nhập số e: "))
# Khởi tạo các biến đếm số âm, số dương và số bằng 0
negative_count = 0
positive_count = 0
zero_count = 0
# Đưa các số vào danh sách để dễ dàng lặp qua
numbers = [a, b, c, d, e]
# Kiểm tra từng số
for num in numbers:
    if num < 0:
        negative_count += 1
    elif num > 0:
        positive_count += 1
    else:
        zero_count += 1
# In kết quả
print("Số âm: ", negative_count)
print("Số dương: ", positive_count)
print("Số bằng 0: ", zero_count)
'''
4. Viết chương trình nhập vào 2 số nguyên dương a, b.
Nếu cả a và b đều là số chẵn thì xuất câu: “a va b la 2 so chan”
Nếu trong 2 số a và b chỉ có một số chẵn thì xuất ra câu: “chi co mot so chan”
Nếu trong 2 số a và b không có số chẵn nào thì xuất ra câu: “a, b la hai so le”
'''
a = int(input("Nhap so nguyen duong a: "))
b = int(input("Nhap so nguyen duong b: "))
if a % 2 == 0 and b % 2 ==0:
    print("a va b la 2 so chan")
elif a % 2 == 0 or b % 2 == 0:
    print("chi co 1 so chan")
elif a % 2 != 0 and b % 2 !=0:
    print("a va b la 2 le")
'''
5. Viết chương trình nhập năm, cho biết đó là năm nhuận hay không. Lưu ý: Năm
nhuận là năm chia hết cho 4 nhưng không chia hết cho 100 hoặc là chia hết cho 400.
'''
nam = int(input("Nhap nam"))
if nam % 4 == 0 and nam % 100 != 0 or nam % 400 == 0:
    print(nam, "la nam nhuan")
else:
    print(nam, "khong phai nam nhuan")
'''
6. Cho phép người dùng nhập vào hai số nguyên a, b. Hãy cho biết số a có phải là bội
của số b hay không? Ví dụ:
'''
a=int(input("Nhap boi so a: "))
b=int(input("Nhap boi so b: "))
if a % b == 0:
    print(a, "la boi so cua ", b)
else:
    print(a, "khong phai la boi so cua ", b)
'''
7. Nhập vào 3 số nguyên a, b, c. Xuất lên màn hình giá trị dương nhỏ nhất trong 3 số
trên nếu có:
'''
a = int(input("Nhap so nguyen 1"))
b = int(input("Nhap so nguyen 2"))
c = int(input("Nhap so nguyen 3"))
if a>0 and a < b and a < c:
    print(a, "la so duong nho nhat")
elif b>0 and b < a and b < c:
    print(b, "la so duong nho nhat")
elif c>0 and c < b and c < a:
    print(c, "la so duong nhat")
'''
8. Nhập vào 3 số nguyên tìm số chẵn lớn nhất
'''
a = int(input("Nhap so nguyen 1"))
b = int(input("Nhap so nguyen 2"))
c = int(input("Nhap so nguyen 3"))
if a%2==0 and a > b and a > c:
    print(a, "la so chan lon nhat")
elif b%2==0 and b > a and b > c:
    print(b, "la so chan lon nhat")
elif c%2==0 and c > b and a < c:
    print(c, "la so chan lon nhat")
'''
9. Nhập vào 3 số nguyên. Xuất lên màn hình số lớn nhì trong 3 số đó.
'''
# Nhập 3 số nguyên
a = int(input("Nhập số nguyên a: "))
b = int(input("Nhập số nguyên b: "))
c = int(input("Nhập số nguyên c: "))
# Sắp xếp 3 số và lấy số lớn nhì
numbers = [a, b, c]
numbers.sort()  # Sắp xếp các số theo thứ tự tăng dần
# Số lớn nhì sẽ là số đứng thứ 2 trong danh sách đã sắp xếp
second_largest = numbers[1]
# In kết quả
print("Số lớn nhì là: ", second_largest)

#Vòng lặp
'''
1. Nhập vào một số nguyên dương N (với N ∈ [10000, 99999]). Hãy cho biết trong số N
vừa nhập có bao nhiêu chữ số chẵn, bao nhiêu chữ số lẻ?
'''
n = int(input("Nhập số nguyên dương N (10000 ≤ N ≤ 99999): "))
if 10000 <= n <= 99999:
    demchan = 0
    demle=0
    temp = n
    while temp > 0:
        chu_so = temp % 10  
        if chu_so % 2 == 0:
            demchan += 1
        else:
            demle += 1
        temp //= 10
    print(n, "co", demchan,"so chan va",demle,"so le")
else:
    n = int(input("Nhập số nguyên dương N (10000 ≤ N ≤ 99999): "))

'''
2. Viết chương trình kiểm tra 1 số nguyên có phải SỐ CHÍNH PHƯƠNG không? Nếu
không phải xuất SỐ CHÍNH PHƯƠNG gần nó nhất.
'''
import math

# Nhập số nguyên từ người dùng
n = int(input("Nhập số nguyên n: "))
# Kiểm tra số chính phương
socp = int(math.sqrt(n))
if socp * socp == n:
    print("n", "là số chính phương.")
    lower_cp = socp * socp
    upper_cp = (socp+ 1) * (socp+ 1)
    if (n - lower_cp) < (upper_cp - n):
        closest_cp = lower_cp
    else:
        closest_cp = upper_cp

    print(n, "không phải là số chính phương.")
    print(n, "Số chính phương gần nhất là: " , closest_cp)

'''
3. Nhập vào số dương, nếu nhập sai nhập lại cho đến khi đúng, nếu nhập đúng thì xuất
số đã nhập
'''
soduong= int(input("Nhap vao so nguyen duong: "))
while soduong <= 0:
    soduong= int(input("Nhap lai, nhap vao so nguyen duong: "))
print(soduong)

'''
4. Nhập điểm lý thuyết, thực hành; kiểm tra điểm nhập phải trong khoảng từ 0 đến 10,
kiểm tra riêng từng điểm, nếu không đúng phải nhập lại cho đến khi nào hợp lệ thì
xuất điểm trung bình cộng.
'''
diemlt=int(input("Nhap diem ly thuyet: "))
diemth=int(input("Nhap diem thuc hanh: "))
while 0 <= diemlt > 10:
    print("Điểm không hợp lệ! Vui lòng nhập lại.")
    break
while 0 <= diemth > 10:
    print("Điểm không hợp lệ! Vui lòng nhập lại.")
    break
tbcong = (diemlt + diemth) / 2
print("Trung binh cong: ", tbcong)

'''
5. Nhập vào 1 số dương, giả sử luôn nhập đúng, xuất các số từ 1 đến số đó
Ví dụ: Nhap 5, Xuat 1 2 3 4 5
'''
mang = int(input("Nhap vao so nguyen duong: "))
for i in range(1, mang + 1):
    print(i, end=" ")
'''
6. Nhập vào tháng trong năm, kiểm tra giá trị nhập phải hợp lệ (từ 1 đến 12) nếu sai
yêu cầu nhập lại cho đúng. Khi đã nhập đúng thì xuất ra mùa của tháng đã nhập.
'''
thang = int(input("Nhập tháng trong năm: "))
while thang < 1 or thang > 12:
       thang = int(input("Tháng không hợp lệ, vui lòng nhập lại từ 1 đến 12: "))
else:
        if 1 <= thang <= 3:
            print("Mùa Xuân")
        elif 4 <= thang <= 6:
            print("Mùa Hè")
        elif 7 <= thang <= 9:
            print("Mùa Thu")
        else:
            print("Mùa Đông")
 
'''
7. Nhập vào thứ trong tuần, kiểm tra giá trị nhập phải hợp lệ (từ 1 đến 7) nếu sai yêu
cầu nhập lại cho đúng. Khi đã nhập đúng thì xuất ra tên của thứ trong tuần là tiếng
anh.
'''
day= int(input("Nhap vao thu trong tuan (1-7) : "))
while 1 < day > 7 :
    day = int(input("Nhap lai, nhap vao so trong tuan (1-7): "))
else:
    if day == 1:
        print("Monday")
    elif day ==2:
        print("Tuesday")
    elif day ==3:
        print("Wednesday")
    elif day==4:
        print("Thursday")
    elif day==5:
        print("Friday")
    elif day == 6:
        print("Saturday")
    elif day == 7:
        print("Sunday")


'''
8. Nhập vào lần lượt các số để tính ra giá trị lớn nhất, nếu nhập vào số 0 thì kết thúc
việc nhập số. Xuất ra giá trị lớn nhất trong các số đã nhập.
'''
max_value = None
while True:
    n = int(input())
    if n == 0:
        break
    if max_value is None or n > max_value:
        max_value = n
print(max_value if max_value is not None else "Không có số nào được nhập")
'''
9. Nhập vào 2 số nguyên khác 0 là tử và mẫu của một phân số, xuất ra giá trị thập phân
của phân số, ví dụ nhập tử là 5, nhập mẫu là 8 thì xuất ra giá trị phân số dạng thập
phân là 0.625, và cho nhập tiếp hai số khác để tính. Chương trình ngừng khi một
trong hai số nhập vào là số 0.
'''
while True:
    tu = int(input())
    mau = int(input())
    if tu == 0 or mau == 0:
        break
    print(tu / mau)
'''
10.Nhập vào một số nguyên dương, kiểm tra nếu nhập không đúng phải nhập lại cho
đúng. Tính tổng các chữ số trong số nguyên và xuất kết quả. (Ví dụ nhập 307 thì
xuất tổng là 10)
'''
while True:
    n = int(input())
    if n > 0:
        break
tong = sum(int(chu_so) for chu_so in str(n))
print("Tong: ",tong)
'''
11.Nhập vào lần lượt các số và tính tổng các số dương, nếu nhập vào số 0 thì kết thúc
việc nhập số. Xuất ra tổng các số dương.
Ví dụ: nhập 3 8 -2 7 -5 1 0, dừng và xuất ra 19
'''
tongduong = 0
while True:
    n = int(input("Nhap so nguyen: "))
    if n == 0:
        break
    if n > 0:
        tongduong += n
print("Tong cac so duong: ", tongduong)
'''
12.Nhập vào các số nguyên hoặc nhập 0 để kết thúc. Đếm số lượng các số âm có trong
dãy số vừa nhập.
Ví dụ: nhập 3 8 -2 7 -5 1 0, dừng và xuất ra “Co 2 so am”
'''
dem_am = 0
while True:
    n = int(input("Nhap so nguyen: "))
    if n == 0:
        break
    if n < 0:
        dem_am += 1
print("Co", dem_am, "so am")
'''
13.Nhập vào một số nguyên dương. Đếm xem có bao nhiêu ký số 7 trong số vừa nhập.
Ví dụ: nhập 37577 0, xuất ra “Co 3 so 7”
'''
n = int(input())
dem_7 = str(n).count('7')
print("Co", dem_7,"so 7")
