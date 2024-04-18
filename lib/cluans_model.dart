import 'cluan.dart';
import 'package:flutter/material.dart';
import 'dart:math';

/// A model class representing a collection of Cluans.
///
/// This class manages a list of Cluans and provides methods for sorting them.
class CluansModel extends ChangeNotifier {
  /// The list of Cluans managed by this model.
  List<Cluan> cluans = [
    Cluan(answer: 'LION', clue: 'Large feline known for its roar', date: DateTime.now()),
    Cluan(answer: 'PARIS', clue: 'Capital city of France', date: DateTime.now()),
    Cluan(answer: 'METABOLISM', clue: 'The process of converting food into energy in living organisms', date: DateTime.now()),
    Cluan(answer: 'CHESS', clue: 'A popular board game involving strategy and pieces', date: DateTime.now()),
    Cluan(answer: 'ATLANTIC OCEAN', clue: 'Large body of water between Europe and North America', date: DateTime.now()),
    Cluan(answer: 'CENTIMETER', clue: 'A unit of length equal to 1/100th of a meter', date: DateTime.now()),
  ];
  
  get math => null;

  void addCluan({required String answer, required String clue, required DateTime date}) {
    cluans.add(Cluan(answer: answer, clue: clue, date: date));
    notifyListeners();
  }

  /// Sorts the list of cluans alphabetically by clue.
  ///
  /// This method uses the [clue] property of each Cluan for sorting.
  void sortByClue() {
    cluans.sort((a, b) => a.clue.compareTo(b.clue));
    notifyListeners();
  }

  /// Sorts the list of cluans by the length of the answer.
  ///
  /// This method compares the lengths of the [answer] property of each Cluan for sorting.
  void sortByAnswer() {
    cluans.sort((a, b) => a.answer.length.compareTo(b.answer.length));
    notifyListeners();
  }

  String get longestAnswer {
    return cluans.fold('', (previousValue, element) => element.answer.length > previousValue.length ? element.answer : previousValue);
  }

  int get lengthOfLongestAnswer {
    return longestAnswer.length;
  }

  String get shortestAnswer {
    return cluans.fold(longestAnswer, (previousValue, element) => element.answer.length < previousValue.length ? element.answer : previousValue);
  }

  int get lengthOfShortestAnswer {
    return shortestAnswer.length;
  }

  double get meanAnswerLength {
    return cluans.map((cluan) => cluan.answer.length).reduce((a, b) => a + b) / cluans.length;
  }

  double get standardDeviation {
    final mean = meanAnswerLength;
    final variance = cluans.map((cluan) => pow(cluan.answer.length - mean, 2)).reduce((a, b) => a + b) / cluans.length;
    return sqrt(variance);
  }
}
