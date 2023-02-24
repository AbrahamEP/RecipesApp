
[![Swift Version][swift-image]][swift-url]
[![Build Status][travis-image]][travis-url]
[![License][license-image]][license-url]
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/EZSwiftExtensions.svg)](https://img.shields.io/cocoapods/v/LFAlertController.svg)  
[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)

# Recipes App

This is a basic recipes app. I use mockable.io to mock a unique endpoint that gives me a list of recipes that I tooked from https://www.themealdb.com/api.php.
I'm leaving the endpoint running but if you have any issues testing my app please send me an email so I turn on the endpoint again.

I couldn't implement and clean the code due the lack of time. I'm sorry about this.

## Features

- [x] Main screen with a UITableView to display the list of recipes. Each cell has a image view, a label with the name, a label with the origin of the meal and a label saying which type of meal is.
- [x] Touching a cell from the main screen would show you a detail screen for the meal. This screen shows all the data mentioned before plus meal tags and the preparation (if you press the "Preparation" button)
- [x] The detail screen has a button that shows a map and display an annotation for the meal, with its name and origin. Also you can see your current location.

## Requirements

- iOS 15.5+
- Xcode 13

## Usage example

```swift
import EZSwiftExtensions
ez.detectScreenShot { () -> () in
    print("User took a screen shot")
}
```

## Contribute

We would love you for the contribution to **YourLibraryName**, check the ``LICENSE`` file for more info.

## Meta

Made by Abraham Escamilla Pinelo

[swift-image]:https://img.shields.io/badge/swift-5.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com
