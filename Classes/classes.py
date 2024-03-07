import random

red_numbers = [1,2,3,4,5,6,7]
black_numbers = [8,9,10,11,12,13,14]

# Player class
class RoulettePlayer():
    def __init__(self):
        self.balance = 1000 
        self.bet = Bet() 
    
    # Place a bet method
    def place_bet(self,color,amount):
        self.bet.set_color(color)
        self.bet.set_amount(amount)
        self.balance -= amount

    # Update balance for green color
    def update_balance_g(self):
        self.balance+=self.bet._amount*14
    # Update balance for red and black colors
    def update_balance_n(self):
        self.balance+=self.bet._amount*2

# Bet class
class Bet():
    def __init__(self):
        self._color=""
        self._amount=0
    # Setter methods
    def set_color(self,color):
        self._color = color
    def set_amount(self,amount):
        self._amount = amount

# GameManager class
class GameManager():
    def __init__(self):
        self.r_player = RoulettePlayer() # Roulette player instance
        self.last_spins=[] # storing last plays
    def spin_wheel(self):
        return random.randint(0, 14)
    
    # This method compares players betted color and the spin
    def check_spin(self, bet_color, round_number):
        if round_number in red_numbers and bet_color == 'r':
            self.r_player.update_balance_n()
            return True
        elif round_number in black_numbers and bet_color == 'b':
            self.r_player.update_balance_n()
            return True
        elif round_number == 0 and bet_color == 'g':
            self.r_player.update_balance_g()
            return True
        return False
    
    # This method represents random numbers in color format
    def get_round_color(self, round_number):
        if round_number in red_numbers:
            return 'r'
        elif round_number in black_numbers:
            return 'b'
        else:
            return 'g'
    
    # For storing last ten spins
    def record_last_spin(self, color):
        self.last_spins.append(color)


def main():
    print ("aaaa")

if __name__ =="__main__":
    main()

'''
    #This code is a playable main code. Can be used for trying new functions/edits. Copy all and paste it in def main()

    game_manager = GameManager()
    # Simulating 10 rounds of betting and spinning
    for _ in range(10):
        bet_amount = int(input("Enter the amount you want to bet: "))
        bet_color = input("Enter the color you want to bet on (r for red, b for black, g for green): ")

        # Placing the bet
        game_manager.r_player.place_bet(bet_color, bet_amount)

        # Spinning the wheel
        round_number = game_manager.spin_wheel()
        round_color = game_manager.get_round_color(round_number)
        game_manager.record_last_spin(round_color)

        # Checking the spin result and updating the player's balance
        if game_manager.check_spin(bet_color, round_number):
            print("Congratulations! You won.")
        else:
            print("Sorry, you lost.")

        # Displaying the last 10 spins
        print("Last 10 spins:", game_manager.last_spins)

        # Displaying player's balance after the round
        print("Your balance:", game_manager.r_player.balance)
        print()

'''
