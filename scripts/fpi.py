import random
import time

class Crypto:
    def __init__(self):
        self.name = "$FPIBANK"
        self.price = 10000
        self.market_cap = 1_000_000_000

    def update_price(self):
        # Изменяем цену на случайную величину в диапазоне -5% до +5%
        change_percent = random.uniform(-0.05, 0.05)
        self.price *= (1 + change_percent)

def main():
    crypto = Crypto()
    investment = int(input("Введите сумму для инвестирования в рублях: "))
    
    print(f"Текущая цена {crypto.name}: ₽{crypto.price:.2f}")
    amount = investment / crypto.price
    print(f"Вы купили {amount:.4f} {crypto.name}")

    while True:
        time.sleep(2)  # Пауза для обновления
        crypto.update_price()
        print(f"Новая цена {crypto.name}: ₽{crypto.price:.2f}")

if __name__ == "__main__":
    main()
