def doks_program():
    name = input("Введите имя: ")
    surname = input("Введите фамилию: ")
    city = input("Введите город: ")
    phone = input("Введите номер телефона: ")
    
    print("\nДанные человека:")
    print(f"Имя: {name}")
    print(f"Фамилия: {surname}")
    print(f"Город: {city}")
    print(f"Номер телефона: {phone}")

if __name__ == "__main__":
    doks_program()
