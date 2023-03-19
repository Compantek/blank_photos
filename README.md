# Blank Photos

A simple Flutter project to display blank photos.

## Requirements

- Android : `4.1 and later`
- iOS : `11 and later`

## Structure

- commons : Commons information every widget may need (constants, theme, networking, snack bar)
- features : Screens and components that they need
- models : Objects the project need (Photo)
- providers : To store global state with facility access (Photos, Loading)
- services : Only services classes should connect to the internet and transform all the needed data (PhotosService)

## Features

### Pages

- Splash Screen Page to welcome the user
- Loading Page while waiting
- Photos Page for showing all photos to a list
- Photo Detail Page for Showing details of the selected photo (title, photo, description)

### Models

- Photos

### Providers

- Photos Provider to store all the fetched data
- Loading Provider to store the loading status

### Others

- An action button to get data from the server
- Fetching photos from the server
- Mocking the description because the server doesn't return it
- Screen orientation locked to portrait up
- Custom icon
- Snack Bar bottom notification message
- Floating button to return back to the top of the list
- Filtering photos by title

## Opening project

### Android Studio / IntelliJ IDEA

- Open the project folder
- Go to pubspec.yaml and click `Pub get` to install all the dependencies

### VS Code

- Open the project folder
- Open the terminal and run `flutter pub get` to install all the dependencies

## Installation

### Development build

You should connect a device first

#### Android Studio / IntelliJ IDEA

- Click on the `play button` or `Shift + F10` 

#### VS Code

- Open the terminal and run `flutter run`

### Release build

- Open the terminal and run `flutter run --release`
