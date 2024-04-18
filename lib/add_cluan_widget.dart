import 'main_page.dart';
import 'cluans_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCluanWidget extends StatefulWidget {
  const AddCluanWidget({super.key});

  @override
  State<AddCluanWidget> createState() => _AddCluanWidgetState();
}

class _AddCluanWidgetState extends State<AddCluanWidget> {
  FocusNode clueFocusNode = FocusNode();
  TextEditingController clueController = TextEditingController();
  TextEditingController answerController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    clueFocusNode.requestFocus();
    super.initState();
  }

  void clearTextFields() {
    setState(() {
      clueController.clear();
      answerController.clear();
      dateController.clear();
      clueFocusNode.requestFocus();
    });
  }

  DateTime stringToDateTime(String dateString) {
    // Split the date string into components
    List<String> dateParts = dateString.split('/');

    // Extract month, day, and year components
    int month = int.parse(dateParts[0]);
    int day = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    return DateTime(year, month, day);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CluansModel>(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            leadingWidth: 100,
            leading: ElevatedButton(
              onPressed: () {
                clearTextFields();
              },
              child: const Text('Clear'),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  model.addCluan(
                    answer: answerController.text, 
                    clue: clueController.text, 
                    date: stringToDateTime(dateController.text),
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                }, 
                child: const Icon(Icons.add)
              )
            ],
            title: const Text(
              'Add Cluan',
              style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white
              )
            ),
          ),
          body: Column(
            children: [
              Column(
                children: [
                  TextField(
                    maxLength: 150,
                    focusNode: clueFocusNode,
                    controller: clueController,
                    decoration: const InputDecoration(
                      labelText: 'Clue',
                      counterText: '',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                  TextField(
                    maxLength: 21,
                    controller: answerController,
                    decoration: const InputDecoration(
                      labelText: 'Answer',
                      counterText: '',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.datetime,
                    controller: dateController,
                    decoration: const InputDecoration(
                      labelText: 'Date mm/dd/yyyy',
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  model.addCluan(
                    answer: 'SCOT', 
                    clue: 'Lady Macduff, e.g.,', 
                    date: DateTime(2022, 09, 10)
                  );
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                }, 
                child:const Text('Test Addition'),
              ),
            ],
          ),
        );
      }
    );
  }

  @override
  void dispose() {
    clueController.dispose();
    answerController.dispose();
    dateController.dispose();
    super.dispose();
  }
}