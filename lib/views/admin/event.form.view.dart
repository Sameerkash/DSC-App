import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class EventForm extends StatefulWidget {
  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create an Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormBuilder(
                autovalidate: false,
                key: _fbKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    Text("Card Color"),
                    FormBuilderChoiceChip(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      labelPadding: EdgeInsets.all(2),
                      // selectedColor: Colors.deepPurple,
                      elevation: 2,
                      attribute: "color",
                      runSpacing: 2,
                      spacing: 0.05.wp,
                      options: [
                        FormBuilderFieldOption(
                            child: Text("RedAccent"), value: "vanilla"),
                        FormBuilderFieldOption(
                            child: Text("OrangeAccent"), value: "chocolate"),
                        FormBuilderFieldOption(
                            child: Text("GreenAccent"), value: "strawberry"),
                        FormBuilderFieldOption(
                            child: Text("BlueAccent"), value: "0xff29B6F6"),
                      ],
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    Text("Button Color"),
                    FormBuilderChoiceChip(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      labelPadding: EdgeInsets.all(2),
                      elevation: 2,
                      attribute: "secondaryColor",
                      runSpacing: 2,
                      spacing: 0.05.wp,
                      options: [
                        FormBuilderFieldOption(
                            child: Text("RedAccent"), value: "vanilla"),
                        FormBuilderFieldOption(
                            child: Text("OrangeAccent"), value: "chocolate"),
                        FormBuilderFieldOption(
                            child: Text("GreenAccent"), value: "strawberry"),
                        FormBuilderFieldOption(
                            child: Text("BlueAccent"), value: "0xff00B0FF"),
                      ],
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    FormBuilderDateTimePicker(
                      style: Theme.of(context).textTheme.bodyText1,
                      attribute: "date",
                      inputType: InputType.both,
                      builder: (BuildContext context, Widget child) {
                        return Theme(
                          data: ThemeData.dark().copyWith(
                              primaryColor: const Color(0xFF4A5BF6),
                              accentColor: const Color(0xFF4A5BF6)),
                          child: child,
                        );
                      },
                      format: DateFormat("yyyy-MM-dd | hh:mm a"),
                      decoration: InputDecoration(
                          labelText: "Event Date",
                          border: InputBorder.none,
                          fillColor: Colors.grey),
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    FormBuilderImagePicker(
                      attribute: 'image',
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      labelText: "Select an image",
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    FormBuilderTextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      attribute: "name",
                      decoration: InputDecoration(
                        labelText: "Title",
                        border: InputBorder.none,
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(50),
                      ],
                    ),
                    SizedBox(
                      height: 0.03.hp,
                    ),
                    FormBuilderTextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      maxLines: null,
                      attribute: "description",
                      // maxLines: 50,
                      decoration: InputDecoration(
                        labelText: "Description",
                        border: InputBorder.none,
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    SizedBox(
                      height: 0.04.hp,
                    ),
                  ],
                ),
              ),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                onPressed: () {},
                icon: Icon(Icons.check),
                label: Text("Submit"),
              ),
              SizedBox(
                height: 0.02.hp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
