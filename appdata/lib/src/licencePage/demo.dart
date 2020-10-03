import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:appdata/src/models/masterdata.dart';
import 'package:appdata/src/licencePage/licencdhomepage.dart';
import 'model.dart';
import 'package:frideos/frideos.dart';
class DynamicFieldsPage extends StatefulWidget {
  @override  _DynamicFieldsPageState createState() =>  _DynamicFieldsPageState();
}
class _DynamicFieldsPageState extends State<DynamicFieldsPage> {
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('‘Dynamic fields validation’'),
        ),
        body: DynamicFieldsWidget(),
      ),
    );
  }
}

class FieldsWidget extends StatelessWidget {
  const FieldsWidget({
    this.index,
    this.generatedId,
    this.nameController ,
    this.ageController,
  });

  final int index;
  final TextEditingController generatedId;
  final TextEditingController nameController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text('$index:')),
        Expanded(
          child: Column(
            children: <Widget>[
              StreamBuilder<String>(
                  initialData: ' ',
                  stream: bloc.nameFields.value[index].outStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextField(
                            controller: nameController,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Name:',
                              hintText: 'Insert a name...',
                              errorText: snapshot.error,
                            ),
                            onChanged: bloc.nameFields.value[index].inStream,
                          ),
                        ),
                      ],
                    );
                  }),
              StreamBuilder<String>(
                  initialData: ' ',
                  stream: bloc.ageFields.value[index].outStream,
                  builder: (context, snapshot) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          child: TextField(
                            controller: ageController,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                            decoration: InputDecoration(
                              labelText: 'Age:',
                              hintText: 'Insert the age (1 - 999).',
                              errorText: snapshot.error,
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: bloc.ageFields.value[index].inStream,
                          ),
                        ),
                      ],
                    );
                  }),
              const SizedBox(
                height: 22.0,
              ),
            ],
          ),
        ),
        IconButton(
          icon: const Icon(Icons.delete),
          color: Colors.red,
          onPressed: () => bloc.removeFields(index),
        ),
      ],
    );
  }
}
class DynamicFieldsWidget extends StatelessWidget {
  final nameFieldsController = List<TextEditingController>();
  final ageFieldsController = List<TextEditingController>();
  final generatedId = List<TextEditingController>();
  
  @override
  Widget build(BuildContext context) {
    List<Widget> _buildFields(int length) {
      // Clear the TextEditingControllers lists
      nameFieldsController.clear();
      ageFieldsController.clear();
      generatedId.clear();

      for (int i = 0; i < length; i++) {
        final name = bloc.nameFields.value[i].value;
        final age = bloc.ageFields.value[i].value;
        final id = bloc.generatedIdvalue.value[i].value;
        generatedId.add(TextEditingController(text: '0'));
        nameFieldsController.add(TextEditingController(text: name));
        ageFieldsController.add(TextEditingController(text: age));
      }

      return List<Widget>.generate(
        length,
        (i) => FieldsWidget(
              index: i,
              generatedId: generatedId[i],
              nameController: nameFieldsController[i],
              ageController: ageFieldsController[i],
            ),
      );
    }

    return ListView(
      children: <Widget>[
        Container(
          height: 16.0,
        ),
        ValueBuilder<List<StreamedValue<String>>>(
          streamed: bloc.nameFields,
          builder: (context, snapshot) {
            return Column(
              children: _buildFields(snapshot.data.length),
            );
          },
          noDataChild: const Text('NO DATA'),
        ),
        Container(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RaisedButton(
              color: Colors.green,
              child: const Text('Add more fields',),
              onPressed: bloc.newFields,
            ),
            StreamBuilder<bool>(
                stream: bloc.isFormValid.outStream,
                builder: (context, snapshot) {
                  return RaisedButton(
                    color: Colors.blue,
                    child: snapshot.hasData
                        ? snapshot.data
                            ? const Text('Submit',)
                            : const Text('Form not valid',)
                        : const Text('Form not valid', ),
                    onPressed: snapshot.hasData ? bloc.submit : null,
                  );
                }),
          ],
        ),
      ],
    );
  }
}
class DynamicFieldsBloc  {
  DynamicFieldsBloc() {
    print('-------DynamicFields BLOC--------');

    // Adding the initial three pairs of fields to the screen
    nameFields.addAll([
      StreamedValue<String>(initialData: 'Name AA'),
     ]);

    ageFields.addAll([
      StreamedValue<String>(initialData: '11'),
    ]);
generatedIdvalue.addAll([
      StreamedValue<String>(initialData: '0'),
    ]);
    // Set the method to call every time the stream emits a new event
    for (var item in nameFields.value) {
      item.onChange(checkForm);
    }

    for (var item in ageFields.value) {
      item.onChange(checkForm);
    }
  }

  // A StreamedList holds a list of StreamedValue of type String so
  // it is possibile to add more items.
  final nameFields = StreamedList<StreamedValue<String>>(initialData: []);
  final ageFields = StreamedList<StreamedValue<String>>(initialData: []);
  final generatedIdvalue = StreamedList<StreamedValue<String>>(initialData: []);

  // This StreamedValue is used to handle the current validation state
  // of the form.
  final isFormValid = StreamedValue<bool>();

  // Every time the user clicks on the "New fields" button, this method
  // adds two new fields and sets the checkForm method to be called
  // every time these new fields change.
  void newFields() {
    nameFields.addElement(StreamedValue<String>());
    ageFields.addElement(StreamedValue<String>());
    generatedIdvalue.addElement(StreamedValue<String>());
    
   generatedIdvalue.value.last.onChange(checkForm);
    nameFields.value.last.onChange(checkForm);
    ageFields.value.last.onChange(checkForm);

    // This is used to force the checking of the form so that, adding
    // the new fields, it can reveal them as empty and sets the form
    // to not valid.
    checkForm(null);
  }

  void checkForm(var _) {
    // These two boolean flags will be used to determine whether each group of fields
    // (name or age) is valid or not.
    bool isValidFieldsTypeName = true;
    bool isValidFieldsTypeAge = true;

    // Checking each name fields: if an item is empty an error will be
    // sent to stream and the `isValidFieldsTypeName` set to false. Instead,
    // if the item is null (e.g when new fields are added),
    // it only sets the `isValidFieldsTypeName` to null in order to disable
    // the submit button.
    for (var item in nameFields.value) {
      if (item.value != null) {
        if (item.value.isEmpty) {
          item.stream.sink.addError('The text must not be empty.');
          isValidFieldsTypeName = false;
        }
      } else {
        isValidFieldsTypeName = false;
      }
    }

    // Similarly to the previous check, for the age fields is checked
    // even if the value is a number between 1 and 130.
    for (var item in ageFields.value) {
      if (item.value != null) {
        final age = int.tryParse(item.value);

        if (age == null) {
          item.stream.sink.addError('Enter a valid number.');
          isValidFieldsTypeAge = false;
        } else if (age < 1 || age > 130) {
          item.stream.sink
              .addError('The age must be a number between 1 and 130.');
          isValidFieldsTypeAge = false;
        }
      } else {
        isValidFieldsTypeAge = false;
      }
    }

    // If both of each groups are valid it is given a true value
    // to isFormValid (StreamedValue<bool>) sending the true event
    // to the stream triggering the StreamBuilder to rebuild and
    // enable the submit button. If the condition is not met, then
    // a null value is sent to the stream and the button will be
    // disabled.
    if (isValidFieldsTypeName && isValidFieldsTypeAge) {
      isFormValid.value = true;
    } else {
      isFormValid.value = null;
    }
  }

void submit() {
    for (var item in nameFields.value) 
    print(item.initialData);
    
  }
  void removeFields(int index) {
    nameFields.removeAt(index);
    ageFields.removeAt(index);
    generatedIdvalue.removeAt(index);

  }

  void dispose() {
    print('-------DynamicFields BLOC DISPOSE--------');

    for (var item in nameFields.value) {
      item.dispose();
    }
    nameFields.dispose();

    for (var item in ageFields.value) {
      item.dispose();
    } 
    for (var item in generatedIdvalue.value) {
      item.dispose();
    }    
    ageFields.dispose();
generatedIdvalue.dispose();
    isFormValid.dispose();
  }
}

final bloc = DynamicFieldsBloc();