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

    if (board[0] == board[1] && board[0] == board[2] && board[0] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([0, 1, 2]);
    } else if (board[3] == board[4] && board[3] == board[5] && board[3] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([3, 4, 5]);
    } else if (board[6] == board[7] && board[6] == board[8] && board[6] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([6, 7, 8]);
    } else if (board[0] == board[3] && board[0] == board[6] && board[0] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([0, 3, 6]);
    } else if (board[1] == board[4] && board[1] == board[7] && board[1] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([1, 4, 7]);
    } else if (board[2] == board[5] && board[2] == board[8] && board[2] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([2, 5, 8]);
    } else if (board[0] == board[4] && board[0] == board[8] && board[0] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([0, 4, 8]);
    } else if (board[2] == board[4] && board[2] == board[6] && board[2] != '') {
      result = 'Player ${isXTurn ? 'O' : 'X'} wins!';
      matchedIndexes.addAll([2, 4, 6]);
    } else if (!board.contains('')) {
      result = "It's a tie!";
    }

    if (result.contains('wins')) {
      isXTurn ? oScore++ : xScore++;
      debugPrint(result);
      debugPrint("Matched indexes: $matchedIndexes");
    }
  }
}
