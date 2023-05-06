
# CafeApp

The CafeApp is a coffee-brewing test app.

It is developed for iOS using the SwiftUI framework and follows the MVVM design pattern. The app leverages the Realm Database to save data to a local database.
 

## Files and folder structures

The files and folders in this app are structured using vertical grouping rather than horizontal grouping, which means that related files are grouped together in the same directory instead of being separated into different folders based on file type.

Horizontal Grouping
![Horizontal Grouping](https://i.imgur.com/zwYdy7o.png)

Vertical Grouping
![Vertical Grouping](https://i.imgur.com/2yKU9NE.png)


The `Core` folder includes all files that are shared between views. Each `View` folder inside the `Views` folder contains everything necessary for the view to populate itself, and every top-level folder includes shared functionality.

## Workflow and Functionality

There is an API directory inside the Core directory at the top level of the application that is responsible for making API calls to the server.
The implementation of this layer is very flexible and can be fully tested with XCTest or other testing frameworks.
There is a sample for testing RequestManager inside the project testing target.Open RequestManagerTests and run the sample test. This can be done for all the networking requests that are going to be implemented inside the app. Due to the shortage of time and requirements of the project, this is just a sample of what could be done in that manner.

## Views

### CoffeesView

CoffeesView serves as the primary view component in the app architecture. It's responsible for aggregating and presenting other view components to the user. It utilizes a CoffeesViewModel and NavigationRouter to manage the application's state and respond to user interactions.

Every view after CoffeesView acts as a child view for it.

### Modifiers and CommonViews

The `Utils` directory in the root of the project contains several directories like `CommonViews` and `Modifiers.` These directories contain representations that are shared within one or more views and can be used without any coupling problems.


### Models 

Each model contains a data model that is used to populate and interact with the view.

Additionally, there is a `Constants` object inside the `Models' directory that is used as a source of truth for passing text to prevent typos. This also makes it easy to replace texts in the future if the app requires localization support for multiple languages.


## Core

### Navigation

The Navigation directory inside the Core contains two files that are essential for the app to do navigation between views and pass data to views.


### Extensions

The directory contains two files:

  `Extension+View`: extends the view modifiers of the view to give the ability to add corner radius to custom corners of view, by default using the CornerRadius add behavior to all four corners of view. This extension adds more flexibility for customizing the views.

https://github.com/realm/realm-cocoa

# Development

- Clone repository
- Open the project in Xcode and navigate to the Xcode menu.

**File** >  **Swift Packages** >  **Add Package Dependency**

In the search box, enter the Realm repository URL.
```
https://github.com/realm/realm-cocoa
```
Wait until the loading is finished, then check both
**Realm** and **RealmSwift** packages

To install AlertToast using Swift Package Manager, follow the same process as installing Firebase. First, navigate to File > Swift Packages > Add Package Dependency. Then, enter the AlertToast GitHub repository URL: https://github.com/elai950/AlertToast.git.

That's it!  You're ready to build and run the app.


# Dependencies

- Realm
- Alert Toast SwiftUI
  - Repository: `https://github.com/elai950/AlertToast.git`
