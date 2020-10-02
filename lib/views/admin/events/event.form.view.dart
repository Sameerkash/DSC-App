import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckssem/services/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../models/badge.dart';
import '../../../models/event.dart';
import '../../../widgets/dailog.dart';
import '../../events/event.vm.dart';
import 'manage.event.vm.dart';

class EventForm extends StatefulHookWidget {
  final bool isEditing;
  final Event event;
  const EventForm({
    Key key,
    this.isEditing = false,
    this.event,
  }) : super(key: key);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    var badges = useState(<Badge>[]);

    return Scaffold(
      appBar: AppBar(
        title:
            widget.isEditing ? Text("Update Event") : Text("Create an Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.isEditing)
                CachedNetworkImage(
                  imageUrl: widget.event.imageUrl,
                  imageBuilder: (_, img) {
                    return Container(
                      height: 0.2.hp,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: img, fit: BoxFit.cover),
                      ),
                    );
                  },
                ),
              SizedBox(
                height: 0.015.hp,
              ),
              FormBuilder(
                initialValue: widget.isEditing
                    ? {
                        "name": widget.event.name,
                        "description": widget.event.description,
                        "color": widget.event.color,
                        "secondaryColor": widget.event.secondaryColor,
                        "date": widget.event.time,
                      }
                    : {},
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
                            child: Text("RedAccent"), value: "0xFFFF1744"),
                        FormBuilderFieldOption(
                            child: Text("OrangeAccent"), value: "0xffffc107"),
                        FormBuilderFieldOption(
                            child: Text("GreenAccent"), value: "0xFF00E676"),
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
                            child: Text("Red"), value: "0xFFE53935"),
                        FormBuilderFieldOption(
                            child: Text("Orange"), value: "0xffffb300"),
                        FormBuilderFieldOption(
                            child: Text("Green"), value: "0xFF66BB6A"),
                        FormBuilderFieldOption(
                            child: Text("Blue"), value: "0xFF00B0FF"),
                      ],
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    FormBuilderDateTimePicker(
                      validators: [
                        FormBuilderValidators.required(),
                      ],
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
                      validators: widget.isEditing
                          ? []
                          : [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(1),
                            ],
                    ),
                    SizedBox(
                      height: 0.02.hp,
                    ),
                    FlatButton.icon(
                      label: Text("Select Badges"),
                      icon: Icon(MaterialCommunityIcons.medal,
                          color: Colors.deepPurple),
                      onPressed: () async {
                        badges.value = await showBadgesSheet(context);
                      },
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
                onPressed: () async {
                  if (_fbKey.currentState.saveAndValidate()) {
                    showBlockingDialog(context);
                    if (widget.isEditing) {
                      await context.read<ManagaeEventVM>().createEvent(
                          form: _fbKey.currentState.value,
                          isEditing: true,
                          eve: widget.event);
                    } else {
                      await context
                          .read<ManagaeEventVM>()
                          .createEvent(form: _fbKey.currentState.value);
                    }
                    await context.read<EventVM>().getEvents();
                    context.rootNavigator.pop();
                    context.rootNavigator.pop();
                  }
                },
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

  Future<List<Badge>> showBadgesSheet(BuildContext context) async {
    List<Badge> b = [];

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return FutureBuilder<List<Badge>>(
              future: context.watch<AppRepository>().getAllBadges(),
              builder: (context, snap) {
                if (snap.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snap.hasData) {
                  return Center(
                    child: Text("You don't have any badges"),
                  );
                }

                if (snap.hasError) {
                  return Center(
                    child: Text("${snap.error}"),
                  );
                }

                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 0.02.wp,
                      mainAxisSpacing: 0.03.hp,
                    ),
                    itemCount: snap.data.length,
                    itemBuilder: (_, index) {
                      return GestureDetector(
                        onLongPress: () async {},
                        onTap: () {
                          if (!b.contains(snap.data[index])) {
                            setState(() {
                              b.add(snap.data[index]);
                            });
                          } else {
                            setState(() {
                              b.remove(snap.data[index]);
                            });
                          }
                        },
                        child: CachedNetworkImage(
                          imageUrl: snap.data[index].imageUrl,
                          imageBuilder: (_, img) {
                            return CircleAvatar(
                              maxRadius: 0.05.hp,
                              child: Stack(
                                children: [
                                  if (b.contains(snap.data[index]))
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.amberAccent,
                                        size: 35,
                                      ),
                                    ),
                                  Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: img, fit: BoxFit.fill),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: Colors.white,
                            );
                          },
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
    return b;
  }
}
