import 'package:intl/intl.dart';
import 'package:postgres/postgres.dart';
import 'package:flutter/material.dart';

/// A widget that displays a list of Cluans and provides sorting options.
class CluansWidget extends StatelessWidget {
  /// Constructs a new [CluansWidget] instance.
  ///
  /// The [model] parameter specifies the CluansModel containing the list of Cluans.
  const CluansWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Formatter for displaying dates
    final DateFormat dateFormatter = DateFormat('yyyy-dd-MM');

    //TODO: make changes
    return Scaffold();
  }
}
