## TWTToast

[![Build Status](https://travis-ci.org/twotoasters/Toast.png?branch=travis-ci)](https://travis-ci.org/twotoasters/Toast)

A repo for small utilities we use in Cocoa Development. Conveniently broken up into small subspecs
for à la carte use.

### Subspecs

#### Core

`pod 'TWTToast/Core'`

A subspec chock full of low-level extensions.

##### TWTHighOrderFunctions

* __DEPRECATED__ **`TWTSimpleMap(id<NSObject, NSFastEnumeration> enumeration, TWTMapBlock block)`**
  provides a simple implementation of Map. Map recieves an enumeration of objects and applies the
  block to each item, returning the resulting array.


#### Core Animation

`pod 'TWTToast/CoreAnimation'`

A subspec for Core Animation-level classes and categories.

##### Easing Functions

`pod TWTToast/CoreAnimation/EasingFunctions`

* **`CAMediaTimingFunction+TWTEasingFunctions`** provides factory methods for conveniently creating
common easing timing functions.


#### Foundation

`pod TWTToast/Foundation`

A subspec for Foundation-level classes and categories.

##### Asynchronous Operation

`pod TWTToast/Foundation/AsynchronousOperation`

* **`TWTAsynchronousOperation`** provides an NSOperation subclass with support for asynchronous
  execution during an operation's lifespan.

##### Block Enumeration

`pod TWTToast/Foundation/BlockEnumeration`

* **`TWTBlockEnumeration`** exposes methods on NSArray, NSDictionary, NSEnumerator, NSOrderedSet,
  and NSSet for block based enumeration. These methods include functionality for `Collect`,
  `Inject`, `Detect`, `Reject`, and `Select`.

##### ErrorUtilities

`pod TWTToast/Foundation/ErrorUtilities`

* **`TWTErrorUtilities`** defines utility functions for creating assertions and exception messages.

##### KVO

`pod TWTToast/Foundation/KVO`

* **`TWTKeyValueObserver`** exposes a method for encapsulating a KVO-based observation such that it
  can be more easily released.

##### NSArray Index Path Additions

`pod TWTToast/Foundation/NSArrayIndexPathAdditions`

* **`NSArray+TWTIndexPath`** provides methods for working with arrays (or hierarchically organized
  arrays) by index path.

##### SubclassResponsibility

`pod TWTToast/Foundation/SubclassResponsibility`

* **`NSException+TWTSubclassResponsibility`** provides a convenience factory method for creating
  exceptions when implementing a given method is a subclass's responsibility.

##### Tree Node

`pod TWTToast/Foundation/TreeNode`

* **`TWTTreeNode`** is a simple tree implementation with a node object and a flag for whether the
  node is expanded. Nodes can be looked up by index paths, which they compute themselves. We used
  this model to build a tree view with expadable groups.


#### UIKit

`pod 'TWTToast/UIKit'`

A subspec containing our humble extensions to UIKit.

##### AutoLayout

`pod 'TWTToast/UIKit/AutoLayout'`

* **`UIView+TWTConvenientConstraintAddition`** provides methods for adding constraints for several
  visual format strings with a single message send.

##### Blocks

`pod 'TWTToast/UIKit/Blocks'`

* **`UIActionSheet+TWTBlocks`** establishes a block-based means of handling UIActionSheets.
* **`UIAlertView+TWTBlocks`** does the same for UIAlertView, enabling easy block-based handling of
  UIAlertView input.

##### Color

`pod 'TWTToast/UIKit/Color'`

* **`UIColor+TWTColorHelpers`** is a collection of convenience methods for creating UIColors, e.g.
  from hexadecimal values.

##### Device

`pod 'TWTToast/UIKit/Device'`

* **`UIDevice+TWTSystemVersion`** provides convenient methods of retrieving and comparing iOS
  version information in a more performant way, using NSIntegers rather than string comparison.

##### Nib-backed View

`pod 'TWTToast/UIKit/NibBackedView'`

* **`TWTNibBackedView`** is an abstract class that makes it easy to create a view that is primarily
  laid out and configured using a nib. It is built to work correctly whether the view is 
  instantiated in code or in a nib.

##### Prepare For Segue

`pod 'TWTToast/UIKit/PrepareForSegue'`

* **`UIViewController+TWTPrepareForSegue`** adds `-twt_prepareFor«Identifier»Segue:sender:` to view
  controllers, where «Identifier» is the capitalized form of the segue’s identifier.

##### Snapshot Image

`pod 'TWTToast/UIKit/SnapshotImage'`

* **`UIView+TWTSnapshotImage`** provides a convenient method for getting a snapshot image of a
  view’s hierarchy.

##### Text Style

`pod 'TWTToast/UIKit/TextStyle'`

* **`TWTTextStyle`** is a convenient way to package fonts and colors together as a style and apply
  them to different views. Keep a set of them as singletons or make class factory methods.

##### View Controller Completion

`pod 'TWTToast/UIKit/ViewControllerCompletion'`

* **`UIViewController+TWTCompletion`** adds a completion block and corresponding finish and cancel
  methods to view controllers, to provide an easy way for a presented view controller to signal to
  the presenting view controller when it is done.

##### View Controller Transitions

`pod 'TWTToast/UIKit/ViewControllerTransitions'`

* **`TWTNavigationControllerDelegate`** conforms to the `UINavigationControllerDelegate` protocol
  and adds properties to UIViewController for specifying push and pop animation controllers.
* **`TWTSimpleAnimationController`** conforms to the `UIViewControllerAnimatedTransitioning`
  protocol and wraps `+[UIView transitionFromView:toView:duration:options:completion:]` to
  facilitate using built-in transitions provided by UIKit.


#### Mantle

`pod 'TWTToast/Mantle'`

A subspec containing various Mantle extensions used by Two Toasters.

##### Mantle Model

`pod 'TWTToast/Mantle/MantleModel'`

* **`TWTMantleModel`** contains basic extensions to `MTLModel`. For now, it simply adds the ability
  to exclude property keys from archiving, description, and equality checking.

##### Model Class Deserialization

`pod 'TWTToast/Mantle/ModelClassDeserialization'`

* **`TWTModelClassDeserialization`** unifies deserialization of JSON objects into Mantle model
  objects.

##### Selective JSON Adapter

`pod 'TWTToast/Mantle/SelectiveJSONAdapter'`

* **`TWTSelectiveJSONAdapter`** extends `MTLJSONAdapter` to serialize only a subset of a model
  object’s property keys.


### Credits

TWTToast was created by developers at Two Toasters(@twotoasters) in order to collect our reusable
code into one common repository, easily accessible via Cocoapods subspecs.

### License

All code in TWTToast is released under the MIT License. See the LICENSE file for more info.

