# Pre-work - Tippy

**Tippy** is a tip calculator application for iOS.

Submitted by: Fabien Renaud 

Time spent: 20 hours spent in total

## User Stories

The following **required** functionality is complete:

* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [x] Settings page to change the default tip percentage.

The following **optional** features are implemented:
* [x] Remembering the bill amount across app restarts (if <10mins)
* [x] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.
* [ ] UI animations

No additional features.

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

*http://imgur.com/OvBC1Gr*

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Some new features in Swift 3 and Xcode 8 slowed me down:
 
 - Renaming or removing a Swift variable bound to some control in the xib file is a pain. Xcode almost never cleans up the xib file and the app just crashes upon load. Removing/fixing the variable manually in the xib resolves the issue.
 - many Swift classes were renamed so many of the code sample found on the Internet still need to be adapted in some way (Xcode helps a bit most of the time).
 - Xcode 8 was always crashing on me when trying to define some margins for some controls.
 - Refactoring/renaming Swift code in Xcode 8 is just impossible. 
 - Apparently, there are multiple way of adding a button to the navigation bar. The first I tried, the button looked normal but none of the 'Action Segue' were working. Somehow removing the button and adding it back in a different way fixed the problem.

## License

    Copyright 2016 Fabien Renaud 

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
