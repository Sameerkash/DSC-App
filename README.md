# Developer Students Club App

![DSC](/assets/dsc.png)

### A template for creating, managing and conducting events by a DSC club in their chapter, built using Flutter 💙 x Firebase🔥

**Setup for your chapter**

- Star this project 😜, Clone it.
- For a different package name, create a New Flutter Project and copy the lib folder
- Setup a firebase account and add an android app, add debug SHA and release SHA
- Navigate to `lib/views/auth/authView.dart` and Change the name to your chapter name
- Navigate to `lib/explore/explore.view.dart` and Change 'DSC KSSEM' to your chapter name
- Navigate to `lib/explore/explore.view.dart` and Change `youtubeUrl` and `chapterUrl` to your chapter links
- Login, and update the value of `isAdmin` to `true` in the firebase console, relogin again so the admin page is accessible.

  And That's it!, You are all setup to give your chapter a personalized DSC experince with your app 🚀

**Features**

- [x] View Events page, which displays future events
- [x] SignUp users using google singin
- [x] Generate QR code on event geistration and verify it on venue
- [x] Explore page for connecting users with the DSC chapter page and displaying past events pictures and videos
- [x] Profile page for displaying user account, badges and accomplishments
- [ ] Issue Badges to attendees for registration or winning tasks during the event
- [ ] Gain Accurate insight on the details of Attendees.

**Admin**

- [x] Create,update and delete events
- [x] Verify QR code
- [x] Manage users
- [x] Add, Issue Badges to users
- [ ] Check Attendess list

**Docs**

- State management - [State Notifier](https://pub.dev/packages/state_notifier) and [Provider](https://pub.dev/packages/provider)
- I've also used [Flutter Hooks](https://pub.dev/packages/flutter_hooks) at places to reduce boilerplate of Stateful Widgets
- I've used [Freezed](https://pub.dev/packages/freezed) for data modelling as it works so well with Provider and StateNotifier
- [Auto Route](https://pub.dev/packages/auto_route) for navigation to speed up setting named routes
- The entire app is Dark Themed by default, although, you can implement light theme as well using the `theme.util.dart` and  `SharedPrefernces`
- There are also a few  university specific data in the data model for `AppUser` and in `edit.profile.view.dart`, you can always change it to match your requirements. 
- This project uses the latest version of [FlutterFire](https://firebase.flutter.dev/) plugins, so be sure to check out the documentation for breaking changes
- Run `pub gloabl activate derry` to use derry for running `build_runner` scripts.


**Contributing**

Contributions are welcome!

- Fork it 🍴
- Clone it ⬇
- Chekout to a new branch 🔀
- Make your changes 👩‍💻
- Submit a Pull Request ⬆

**Screenshots**

<img src="./screenshots/splash.jpg" alt="Splash" width="200" height="400"/> <img src="./screenshots/E1.jpg" alt="Splash" width="200" height="400"/> <img src="./screenshots/ed.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/E2.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/qr.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/chapter.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/profile.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/admin.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/events.jpg" alt="Splash" width="200" height="400"/><img src="./screenshots/eform.jpg" alt="Splash" width="200" height="400"/>
