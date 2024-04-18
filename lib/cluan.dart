/// A class representing a Cluan.
///
/// A Cluan is made up of an answer, a clue, and a date.
class Cluan {
  /// The answer associated with this Cluan.
  final String answer;

  /// The clue associated with this Cluan.
  final String clue;

  /// The date when this Cluan was created.
  final DateTime date;

  /// Constructs a new [Cluan] instance.
  ///
  /// The [answer] parameter specifies the answer associated with this Cluan.
  ///
  /// The [clue] parameter specifies the clue associated with this Cluan.
  ///
  /// The [date] parameter specifies the date when this Cluan was created.
  Cluan({
    required this.answer,
    required this.clue,
    required this.date,
  });
}
