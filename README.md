# Test Driven Tic Tac Toe

  Tic Tac Toe game developed using TDD. The computer is not unbeatable, (though,  I havent been able to win) and you have the option to use any board character and observe computer vs computer game.

## Getting Started

To play the game:

`rake play`

To run the rspec tests:

`rake rspec`

## Notes
After start of game, you can choose any symbol (one character long) to be player 1, and have the ability to set it as a human or computer controlled player. And setup sequence is the same for player 2.

If computer is to have first turn, the recursive algorithm can take up to 20 seconds. Optimization has not begun as of yet.

3 tests are disabled with xit due to the amount of time they take, due to said recursive algorithm.