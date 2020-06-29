# Intro to building cross-platform apps with Flutter

Welcome to the Zeitspace Session! First, let's make sure you're all set up.

## Setup

### Install Flutter and run the starter app

Follow [this guide](https://flutter.dev/docs/get-started/install) until you’ve completed **Step 3: Test Drive** (found in the guide's sidebar).

You’ll need to:

- Install Flutter
- Do one of the following:
  - Install Xcode to build an iOS app
  - Install Android Studio and the Android SDK to build an Android app
- Set up an editor
- Run the starter app

There are also some helpful videos that will walk you through Flutter installation and setup:

- Mac: https://www.youtube.com/watch?v=_p3VbxiVuRU
- Windows: https://www.youtube.com/watch?v=Z2ugnpCQuyw

### Clone this repo to your machine

You can do this [using Github Desktop](https://help.github.com/en/desktop/contributing-to-projects/cloning-a-repository-from-github-to-github-desktop) or by using the command line: `git clone <url>`

## How to use checkpoints

If you run into a problem and want to catch up during the session, you can switch git branches to load the correct code for the start of each step.

- [Switch branch using Github Desktop](https://help.github.com/en/desktop/contributing-to-projects/switching-between-branches)
- Use the command line: `git checkout <branch>`

## Activity: Let's build a todo app

Let's learn about Flutter by building a to do app. 

### Step 1: Start layout and show a list

Before you start, checkout branch: `main` if you are not on that branch already.

At the start of this step if you try to run the app you should only see a black screen.

What we'll do:
- Create the base app layout
- Store the todos in a data structure
- Display todos in a simple list

To catch up to the end of step 1, checkout branch: `step1`

### Step 2: Add a new to do

What we'll do:
- Add an "Add" button in the app bar
- Build the dialog
- Show the new todo item to the list

To catch up to the end of step 2, checkout branch: `step2`

### Step 3: Mark as done

What we'll do:
- Customize the style of todo items
- Add checkbox
- Add Completed list
- Move todo item between Todos and Completed list when checked / unchecked

To catch up to the end of step 3, checkout branch: `step3`

### Step 4: Show confirmation message

What we'll do:
- Show a message when a todo is completed (using the Snackbar widget)
- Show a message when a completed todo is moved back to active todos

To catch up to the end of step 4, checkout branch: `step4`

### Step 5: Show / hide completed to dos

What we'll do:
- Add Switch widget (which adapts to iOS / Android style)
- Show / hide the completed items list when toggled

To catch up to the end of step 5, checkout branch: `step5`

### Step 6: Show friends' todos

What we'll do:
- Add the `http` package to our project
- Use it to request and wait for JSON data
- Add Friends' todos page and display data there
- Navigate to and from the new Friends page

To catch up to the end of step 6, checkout branch: `step6`

That's it! Congrats on building a fully functional Flutter app that works on both Android and iOS.

## Resources

### Keep learning

- [Flutter in Focus (Youtube)](https://www.youtube.com/playlist?list=PLjxrf2q8roU2HdJQDjJzOeO6J3FoFLWr2) Learn Flutter features in 10 minutes or less.
- [Flutter codelabs](https://flutter.dev/docs/codelabs). Hands-on coding tutorials.
- [Layouts in Flutter](https://flutter.dev/docs/development/ui/layout). More about how to build UI layouts.
- [Accessibility in Flutter](https://flutter.dev/docs/development/accessibility-and-localization/accessibility). Make sure your app is accessible to a broad range of users.
- [Flutter cookbook](https://flutter.dev/docs/cookbook). Reference that contains "recipes" for common tasks while writing Flutter apps.
- [Using the debugger](https://flutter.dev/docs/development/tools/devtools/debugger). How to use Flutter DevTools to track down those bugs.
- [Bootstrap into Dart](https://flutter.dev/docs/resources/bootstrap-into-dart). Get up to speed on the Dart language.

### Coming from another platform?

- [Flutter for web devs](https://flutter.dev/docs/get-started/flutter-for/web-devs)
- [Flutter for React Native devs](https://flutter.dev/docs/get-started/flutter-for/react-native-devs)
- [Flutter for Android devs](https://flutter.dev/docs/get-started/flutter-for/android-devs)
- [Flutter for iOS devs](https://flutter.dev/docs/get-started/flutter-for/ios-devs)

### Other cool things

- [Flutter app showcase](https://flutter.dev/showcase). See what others have built with Flutter.
- [Flutter gallery](https://gallery.flutter.dev/#/). Live previews of Flutter demo apps and widgets.
- [Dartpad](https://dartpad.dev/). Play around with Dart in your browser.
- [How to learn Flutter in 2020 – FreeCodeCamp](https://www.freecodecamp.org/news/how-to-learn-flutter-in-2020/). Even more resources!