import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'cluans_model.dart';
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

    return Consumer<CluansModel>(builder: (context, model, child) {
      return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {
                model.sortByClue();
              },
              child: const Text('Sort by Clue'),
            ),
            ElevatedButton(
              onPressed: () {
                model.sortByAnswer();
              },
              child: const Text('Sort by Answer'),
            ),
          ],
          title: const Text('Cluans',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                  itemCount: model.cluans.length,
                  itemBuilder: (context, index) {
                    String answer = model.cluans[index].answer;
                    String clue = model.cluans[index].clue;
                    String date =
                        dateFormatter.format(model.cluans[index].date);

                    return ListTile(
                      title: Text(answer),
                      subtitle: Text(clue),
                      trailing: Text(date),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                      color: Colors.blue, thickness: 1.0, height: 1.0)),
            ),
            const SizedBox(height: 40),
          ],
        ),
      );
    });
  }
}
