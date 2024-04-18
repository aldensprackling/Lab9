import 'cluans_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Answer Length Statistics',
          style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white
          )
        ),
      ),
      body: Consumer<CluansModel>(
        builder: (context, model, child) {
          final List<Text> statistics = [
            Text(
              'Longest: ${model.longestAnswer} (${model.lengthOfLongestAnswer})',
            ),
            Text(
              'Shortest: ${model.shortestAnswer} (${model.lengthOfShortestAnswer})',
            ),
            Text(
              'Mean: ${model.meanAnswerLength.toStringAsFixed(2)}',
            ),
            Text(
              'Standard Deviation: ${model.standardDeviation.toStringAsFixed(2)}',
            ),
          ];
          
          return ListView(
            children: ListTile.divideTiles(
              context: context,
              tiles: statistics.map((item) {
                return ListTile(
                  title: item,
                );
              }),
              color: Colors.blue,
            ).toList(),
          );
        }
      )
    );
  }
}