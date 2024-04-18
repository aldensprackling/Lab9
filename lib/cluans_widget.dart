import 'cockroachdb.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text('Hello, CockroachDB')),
      body: FutureBuilder(
        future: fetchCluans(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return const Text('Waiting for data');
          } else {
            Result results =
                snapshot.data!; // a Result is an "ListView<ResultRow>"
            for (ResultRow row in results) {
              print(row
                  .toColumnMap()); // this turns each row, a ListView<dynamic>, into a map
            }
            return ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) => ListTile(
                    title: Text(results[index][2].toString()),
                    subtitle: Text(
                      results[index][3].toString(),
                    )));
          }
        },
      ),
    );
  }
}
