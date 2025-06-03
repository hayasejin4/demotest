#range
''' Bài tập 1:
Viết chương trình Python sử dụng hàm range để tạo ra một chuỗi số nguyên liên tiếp từ 0 đến 10,
và tính tổng của các phần tử trong chuỗi đó '''
sum = 0
for i in range (0,11):
    print (i)
    sum = sum + i
print("Tong cac phan tu trong chuoi: " , sum)    
'''Bài tập 2:
Viết chương trình Python sử dụng hàm range để tạo ra một chuỗi số nguyên liên tiếp từ 1 đến 20,
và in ra các phần tử trong chuỗi đó nếu chia hết cho 3 hoặc 5. '''
print ("Cac phan tu trong chuoi chia het cho 3 hoac 5: ")
for i in range (1,21):
    if i % 3 == 0 or i % 5 == 0:
        print (i)

#zip
'''Bài tập:
Viết chương trình Python sử dụng hàm zip để tạo ra một danh sách mới từ hai danh sách a và b,
sao cho phần tử thứ i trong danh sách mới bằng tổng của phần tử thứ i trong danh sách
a và phần tử thứ i trong danh sách b.'''
a = [1,2,3,4,5]
b = [6,7,8,9,10]
def tongds(a, b):
    dsmoi = [x + y for x, y in zip(a, b)]
    return dsmoi
# Gọi hàm và in kết quả
kq = tongds(a, b)
print(kq)  # Kết quả: [7, 9, 11, 13, 15]

#enumerate
'''Bài tập 1
Cho một danh sách các số nguyên, hãy viết chương trình Python sử dụng hàm enumerate 
để tạo ra một danh sách mới chứa các phần tử là bình phương của các số trong danh sách ban đầu
, kèm theo chỉ mục tương ứng của nó. '''
def binhphuong_chimuc(ds):
    dsmoi = [(chimuc, i ** 2) for chimuc, i in enumerate(ds)]
    return dsmoi
# Ví dụ sử dụng
ds = [1, 2, 3, 4, 5]
kq = binhphuong_chimuc(ds)
print(kq)  # Kết quả: [(0, 1), (1, 4), (2, 9), (3, 16), (4, 25)]
'''Bài tập 2
Cho một danh sách các chuỗi, hãy viết chương trình Python sử dụng hàm enumerate
 để tạo ra một danh sách mới chứa các chuỗi được đảo ngược theo thứ tự của chỉ mục tương ứng của nó. '''
def daonguoc_chimuc(dschuoi):
    dsmoi = [(chimuc, str[::-1]) for chimuc, str in enumerate(dschuoi)]
    return dsmoi
# Ví dụ sử dụng
dschuoi = ["hello", "world", "python"]
kq = daonguoc_chimuc(dschuoi)
print(kq)  # Kết quả: [(0, "olleh"), (1, "dlrow"), (2, "nohtyp")]

#map
'''Bài tập 1
Cho một danh sách các chuỗi, hãy viết chương trình Python sử dụng hàm map để tạo ra 
một danh sách mới chứa các chuỗi được chuyển thành chữ hoa.'''
def chuhoa(chuoi):
    """Chuyển đổi chuỗi thành chữ hoa."""
    return chuoi.upper()
dschuoi = ["hello", "world", "python"]
dschuoi_hoa = list(map(chuhoa, dschuoi))
print(dschuoi_hoa)  # Kết quả: ['HELLO', 'WORLD', 'PYTHON']
'''Bài tập 2
Cho một danh sách các số nguyên, hãy viết chương trình Python sử dụng hàm map để 
tạo ra một danh sách mới chứa số đảo ngược của các số trong danh sách ban đầu. '''
def daonguocso(so):
    """Đảo ngược một số nguyên."""
    sochuoi = str(so)
    sochuoi_daonguoc = sochuoi[::-1]
    return int(sochuoi_daonguoc)
dsso = [123, 456, 789]
dsso_daonguoc = list(map(daonguocso, dsso))
print(dsso_daonguoc)  # Kết quả: [321, 654, 987]