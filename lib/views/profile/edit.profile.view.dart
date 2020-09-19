import 'package:dsckssem/models/user.dart';
import 'package:dsckssem/views/profile/profile.vm.dart';
import 'package:dsckssem/widgets/dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final AppUser user;

  EditProfile({Key key, this.user}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 0.02.hp, left: 0.05.wp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Edit Profile",
                              style: Theme.of(context).textTheme.headline1),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 0.03.wp,
                    ),
                    FormBuilder(
                      key: _fbKey,
                      initialValue: {
                        "name": widget.user.userName,
                        "email": widget.user.email,
                        "usn": widget.user.usn,
                        "phone": widget.user.phone,
                      },
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            style: Theme.of(context).textTheme.bodyText1,
                            attribute: "name",
                            decoration: InputDecoration(
                              labelText: "User Name",
                              border: InputBorder.none,
                            ),
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(25),
                            ],
                          ),
                          SizedBox(
                            height: 0.03.hp,
                          ),
                          FormBuilderTextField(
                            style: Theme.of(context).textTheme.bodyText1,
                            attribute: "usn",
                            decoration: InputDecoration(
                              labelText: "USN",
                              border: InputBorder.none,
                            ),
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(10),
                              FormBuilderValidators.minLength(10),
                            ],
                          ),
                          SizedBox(
                            height: 0.03.hp,
                          ),
                          FormBuilderTextField(
                            // readOnly: true,
                            style: Theme.of(context).textTheme.bodyText1,
                            attribute: "phone",
                            decoration: InputDecoration(
                              labelText: "Phone",
                              border: InputBorder.none,
                            ),
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.maxLength(10),
                              FormBuilderValidators.minLength(10),
                            ],
                          ),
                          SizedBox(
                            height: 0.03.hp,
                          ),
                          FormBuilderTextField(
                            readOnly: true,
                            style: Theme.of(context).textTheme.bodyText1,
                            attribute: "email",
                            decoration: InputDecoration(
                              labelText: "Email",
                              border: InputBorder.none,
                            ),
                            validators: [
                              FormBuilderValidators.required(),
                              FormBuilderValidators.max(50),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FlatButton.icon(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.deepPurple,
                  onPressed: () async {
                    print("called form");
                    if (_fbKey.currentState.saveAndValidate()) {
                      showBlockingDialog(context);
                      await context
                          .read<ProfileVM>()
                          .updateProfile(_fbKey.currentState.value);
                      context.rootNavigator.pop();
                    }
                  },
                  icon: Icon(Icons.check),
                  label: Text("update"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
