### Game Description
In this game there are 6 different colour pegs that form a 4 peg "code" that another player tries to break in 12 guesses. After each guess, they receive feedback on the number of pegs that were the right colour and if that right colour was in the correct place.

### Instructions
This Mastermind game is a 1-player game, that is played in the command line. You can choose to be a code-breaker with a computer randomly generated, or you can choose be a code-maker to create a code for the computer to break. To help in determining the code, the game will indicate whether each digit in the player's guess is a correct number and in the correct place.

If you decide to be the code BREAKER, the computer sets a random four-digit code and you have 12 goes to guess the code correctly.

If the player decides to be the code MAKER, the user will input their chosen four-digit code. The computer will then use the Donald Knuth Mastermind-Five-Guess-Algorithm to determine the code. In future I would like to explore ways to make this algorithm run faster.

The easiest way to play this game, is to play online at [repl.it](https://replit.com/@LizzyPedley/mastermind). To play online, click on the green 'run' button at the top of the repl.it page.
