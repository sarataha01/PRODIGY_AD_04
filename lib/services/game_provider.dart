import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  bool isXTurn = true;
  List<String> board = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  int oScore = 0;
  int xScore = 0;
  String result = '';

  void tapped(int index) {
    if (board[index] == '' && result == '') {
      board[index] = isXTurn ? 'X' : 'O';
      isXTurn = !isXTurn;
      checkWinner();
      notifyListeners();
    }
  }

  void resetGame() {
    board = ['', '', '', '', '', '', '', '', ''];
    matchedIndexes = [];
    isXTurn = true;
    result = '';
    notifyListeners();
  }

  void resetScore() {
    board = ['', '', '', '', '', '', '', '', ''];
    matchedIndexes = [];
    isXTurn = true;
    oScore = 0;
    xScore = 0;
    result = '';
    notifyListeners();
  }

  void checkWinner() {
    matchedIndexes.clear();
    List<List<int>> winningCombinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Rows
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Columns
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (var combination in winningCombinations) {
      int a = combination[0];
      int b = combination[1];
      int c = combination[2];

      if (board[a] == board[b] && board[a] == board[c] && board[a] != '') {
        result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
        matchedIndexes.addAll([a, b, c]);
        isXTurn ? oScore++ : xScore++;
        return;
      }
    }

    if (!board.contains('')) {
      result = "It's a tie!";
    }
  }
}
