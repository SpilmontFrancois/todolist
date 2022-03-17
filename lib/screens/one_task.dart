import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/tasks_collection.dart';
import 'package:toggle_switch/toggle_switch.dart';

class OneTask extends StatelessWidget {
  const OneTask({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: const MyCustomForm());
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    TextEditingController contentController = TextEditingController();
    TextEditingController completedController = TextEditingController();

    contentController.text = arguments['task'].content;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: Text('Contenu de la tâche'))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: TextFormField(
              controller: contentController,
              decoration: const InputDecoration(
                hintText: "Contenu de la tâche",
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ce champ ne peut pas être vide';
                }
                return null;
              },
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Center(child: Text('Tache complétée ?'))),
          Center(
              child: ToggleSwitch(
            minWidth: 90.0,
            initialLabelIndex: 1,
            cornerRadius: 20.0,
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            totalSwitches: 2,
            labels: const ['Oui', 'Non'],
            icons: const [Icons.check, Icons.close],
            activeBgColors: const [
              [Colors.green],
              [Colors.red]
            ],
            onToggle: (index) {
              if (index == 0) {
                completedController.text = 'true';
              } else {
                completedController.text = 'false';
              }
            },
          )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Consumer<TasksCollection>(
                  builder: (context, collection, child) {
                return ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                      collection.update(
                          arguments['task'],
                          completedController.text == 'true',
                          contentController.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Submit'),
                );
              })),
        ],
      ),
    );
  }
}
