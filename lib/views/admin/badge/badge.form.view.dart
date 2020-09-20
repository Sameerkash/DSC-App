import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsckssem/views/admin/badge/badge.vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../models/badge.dart';
import '../../../widgets/dailog.dart';
import '../../events/event.vm.dart';

class BadgeFormView extends StatefulWidget {
  final bool isEditing;
  final Badge badge;
  const BadgeFormView({
    Key key,
    this.isEditing = false,
    this.badge,
  }) : super(key: key);

  @override
  _BadgeFormViewState createState() => _BadgeFormViewState();
}

class _BadgeFormViewState extends State<BadgeFormView> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.isEditing ? Text("Update Badge") : Text("Add a Badge"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (widget.isEditing)
                CachedNetworkImage(
                  imageUrl: widget.badge.imageUrl,
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
                        "name": widget.badge.name,
                        // "imageUrl": w
                      }
                    : {},
                autovalidate: false,
                key: _fbKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.02.hp,
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
                    FormBuilderTextField(
                      style: Theme.of(context).textTheme.bodyText1,
                      attribute: "name",
                      decoration: InputDecoration(
                        labelText: "Name",
                        border: InputBorder.none,
                      ),
                      validators: [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.max(50),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0.015.hp,
              ),
              FlatButton.icon(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Colors.deepPurple,
                onPressed: () async {
                  if (_fbKey.currentState.saveAndValidate()) {
                    showBlockingDialog(context);
                    if (widget.isEditing) {
                      await context.read<BadgeVM>().addBadge(
                          form: _fbKey.currentState.value,
                          isEditing: true,
                          badge: widget.badge);
                    } else {
                      await context
                          .read<BadgeVM>()
                          .addBadge(form: _fbKey.currentState.value);
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
}
