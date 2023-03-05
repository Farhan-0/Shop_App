# shop_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


Concepts in Shop App

Module 8 [State Management and Managing UI Efficiently]

[*] ClipRRect for rounded Corners (005)
[*] use GestureDetector for onTap listener. (006)
[*] ChangeNotifierProvider..... 
(i) Provider.of<...>(context)
(ii) Consumer(...) {builder: ,}
[*] MultipleProvider
[*] For swipe to remove use Dismissible widget.
[*] For side drawer use Drawer widget.
 
 

(003 Defining a Data Model) :- 
isFavorite is not final because we need it to change when the app is running.
It's default value can also be false

(004 Working on the Products Grid and Item) :-
In GridView.builder gridDelegate we define the structure of grid. And it takes other arguments as itemBuilder and itemCount.
we will also create a widget for each productItem that will be passed to the itemBuilder of GridView.builder

(005 Styling and Theming) :-
Wrapped the GridTile widget with ClipRRect to have rounded corners.

(006 Adding Navigation to the App) :-
use GestureDetector for onTap listener.
For Navigating to productDetailPage 
Navigator.of(context).pushNamed(
              ProductDetailPage.routeName,
              arguments: product.id,
            );

(007 State Management) :-
image.png

(008 Provider Pagckage) :-
Screenshot_20230110_105507.png

(009 Working with provider package) :-
we make the list _items as private because we don't want it to change it's value from anywhere else in the app, we can only make changes here, so that we can notify from here only.

(010 Inheritance vs Mixin) :-
Mixin are more like utility function provider, that supports multiple parents.

(012 Listening in Different Places ) :-
ChangeNotifierProvider..... 
(i) Provider.of<...>(context)
(ii) Consumer(...) {builder: ,}

(016) Local State vs App-wide State
For filtering logic we'll use local state as we only need the result of this logic in this page only and not in any other part of the application.

(018) MultipleProviders

(022) Making Cart items Dismissible
For swipe to remove use Dismissible widget.


Module 9 Working with User Input and forms

[*] Showing Dialogs and Snackbars(Info Popups)
[*] Fetching User Input via Forms
[*] Input Validation

Module 10 Sending Http Requests to a Server

[*] Storing Data and Http
[*] Sending Http Requests (Store + Fetch Data)
[*] Showing Loading Progress
[*] Handling Errors
[*] RefreshIndicator for pull down refresh

http.post and other requests return a Future object.
With the Future object there is a (then) method associated which is executed after the above code is performed. Basically it waits for the Future function to complete its task then the (then) method is executed. until the Future function is executed, dart marks the (then) fucntion as a todo fucntion later, and executes next part of the code.


Module 11 Adding User Authentication 

[*] How Authentication works in Flutter Apps (002 explaination)
[*] Signup and Login
[*] Managing User Sessions

FutureBuilder :- with FutureBuilder a problem occurs that if we use Provider.of...(context) inside the Widget build method, and if we are also
using another provider from the FutureBuilder then when the products change from the FutureBuilder provider then the Provider inside the build method is also notified of the change and it builds the entire widget tree again and thus again the FutureBuilder will be called. So infinite loop occurs, thus we should not use PRovider inside our widget build method and instead we should use Consumer wherever required.

Module 12 Adding Animations

[*] Different ways of Animating Widgets
[*] Custom Animations and Built-in Animations/Helpers

AnimatedBuilder - the basic idea of all the builder widget is that flutter does something for us and the rebuilds a part of widget when that something changes 

AnimatedContainer - If we only want to animate a container then we can use a more efficient approach of using the Built in AnimatedContainer widget. it is simple to use and more efficent.

To learn more about widgets go to official docs - Widget Catalog