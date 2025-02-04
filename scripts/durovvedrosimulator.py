import os

class Game:
    def __init__(self):
        self.cache_file = 'cache/game_data.txt'
        self.balance = 0
        self.bucket_price = 10
        self.load_data()

    def load_data(self):
        """Загрузка данных из файла."""
        if os.path.exists(self.cache_file):
            with open(self.cache_file, 'r') as file:
                self.balance = int(file.readline().strip())
        print(f"Баланс загружен: {self.balance}")

    def save_data(self):
        """Сохранение данных в файл."""
        os.makedirs(os.path.dirname(self.cache_file), exist_ok=True)
        with open(self.cache_file, 'w') as file:
            file.write(f"{self.balance}")

    def click(self):
        self.balance += 1
        self.save_data()
        print(f"Баланс: {self.balance}")

    def buy_bucket(self):
        if self.balance >= self.bucket_price:
            self.balance -= self.bucket_price
            self.save_data()
            print("Вы купили ведро дурову!")
        else:
            print("Недостаточно средств для покупки ведра дурову.")

    def run(self):
        print("Добро пожаловать в игру!")
        while True:
            action = input("Введите 'click' для увеличения баланса или 'buy' для покупки ведра дурову: ").strip().lower()
            if action == 'click':
                self.click()
            elif action == 'buy':
                self.buy_bucket()
            else:
                print("Неверная команда. Попробуйте снова.")

if __name__ == "__main__":
    game = Game()
    game.run()
