<p align="center">
	<img src="docs/pinlayout-logo-small.png" alt="PinLayout Performance" width=100/>
</p>

<h1 align="center" style="color: #376C9D; font-family: Arial Black, Gadget, sans-serif; font-size: 1.5em">PinLayout</h1>


# Change Log

## [1.5.8](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.8)
Released on 2018-01-20

* Handle layout relative to a view with a transform and/or a modified anchorPoint.  
Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#116](https://github.com/mirego/PinLayout/pull/116) 

## [1.5.7](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.7)
Released on 2018-01-19

* Fix an issue that was affecting UIScrollViews. PinLayout now set only the bounds's size and keep the origin.  
Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#115](https://github.com/mirego/PinLayout/pull/115) 

* Handle correctly view's `layer.anchorPoint`. PinLayout now update correctly the view position when the view's layer.anchorPoint has been modified, i.e. when it is not its default value (0.5, 0.5).
Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#114](https://github.com/mirego/PinLayout/pull/114) 

## [1.5.5](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.5)
Released on 2018-01-12

Add methods:

* **`all(_ value: CGFloat)`**  
The value specifies the **top, bottom, left and right edges** distance from the superview's corresponding edge in pixels. 
Similar to calling `view.top(value).bottom(value).left(value).right(value)`. 

* **`horizontally(_ value: CGFloat)`** / **`horizontally(_ percent: Percent)`** 
The value specifies the **left and right edges** on its superview's corresponding edges in pixels (or in percentage of its superview's width).  
Similar to calling `view.left(value).right(value)`. 

* **`vertically(_ value: CGFloat)`**  / **`vertically(_ percent: Percent)`** 
The value specifies the ** top and bottom edges** on its superview's corresponding edges in pixels (or in percentage of its superview's height).  
Similar to calling `view.top(value).bottom(value)`. 
	* Added by [Olivier Pineau](https://github.com/OlivierPineau) in Pull Request [#111](https://github.com/mirego/PinLayout/pull/111) 

## [1.5.4](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.4)
Released on 2017-12-28

* PinLayout now handle correctly more situations with view with transforms.
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#110](https://github.com/mirego/PinLayout/pull/110) 


## [1.5.3](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.3)
Released on 2017-12-28

* PinLayout now handle correctly parents (superviews) with transforms.
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#108](https://github.com/mirego/PinLayout/pull/108) 


## [1.5.2](https://github.com/layoutBox/FlexLayout/releases/tag/1.5.2)
Released on 2017-12-22

* POSSIBLE BREAKING CHANGE: PinLayout now keeps UIView's transform (scale, rotation, ...)    
Previously any view's transform was altered after layouting the view with PinLayout. Now PinLayout won't affect the view's transforms.  

	For people not using transforms, this should be a non-breaking change. If someone is using transforms with PinLayout, this may change the behavior, although I think this will produce the expected results (ie, transforms not being affected/altered by layout).
  
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#107](https://github.com/mirego/PinLayout/pull/107) 


## [1.5.1](https://github.com/mirego/PinLayout/releases/tag/1.5.1)

#### Change

* Add `layout()` method to support Xcode playgrounds
PinLayout layouts views immediately after the line containing `.pin` has been fully executed, thanks to ARC (Automatic Reference Counting) this works perfectly on iOS/tvOS/macOS simulators and devices. But in Xcode Playgrounds, ARC doesn't work as expected, object references are kept much longer. This is a well-documented issue. The impact of this problem is that PinLayout doesn't layout views at the time and in the order required. To handle this situation in playgrounds it is possible to call the `layout()` method to complete the layout.

[See PinLayout in Xcode Playgrounds documentation for more information](https://github.com/mirego/PinLayout#playgrounds)
	
* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#101](https://github.com/mirego/PinLayout/pull/101)
	

## [1.5.0](https://github.com/mirego/PinLayout/releases/tag/1.5.0)
### New method `sizeToFit(:FitType)` & `fitSize()` is now deprecated

#### Changes

* BREAKING CHANGE: **`fitSize()`** is now deprecated. The new `sizeToFit(:FitType)` should be used instead.

* New method **`sizeToFit(_ fitType: FitType)`**  
	* **`sizeToFit(_ fitType: FitType)`**  
	The method adjust the view's size based on the view's `sizeThatFits()` method result.
	     PinLayout will adjust either the view's width or height based on the `fitType` parameter value.
	     
	     Notes:
	     * If margin rules apply, margins will be applied when determining the reference dimension (width/height).
	     * The resulting size will always respect `minWidth` / `maxWidth` / `minHeight` / `maxHeight`.
	     
		**Parameter `fitType`:** Identify the reference dimension (width / height) that will be used to adjust the view's size.  
	
	 * **`.width`**: The method adjust the view's size based on the **reference width**.
	        * If properties related to the width have been pinned (e.g: width, left & right, margins, ...), the **reference width will be determined by these properties**, if not the **current view's width** will be used.
	        * The resulting width will always **match the reference width**.
	     
	 * **`.height`**: The method adjust the view's size based on the **reference height**.
	         * If properties related to the height have been pinned (e.g: height, top & bottom, margins, ...), the **reference height will be determined by these properties**, if not the **current view's height**  will be used.
	         * The resulting height will always **match the reference height**.
	     
	 * **`.widthFlexible`**: Similar to `.width`, except that PinLayout won't constrain the resulting width to match the reference width. The resulting width may be smaller of bigger depending on the view's sizeThatFits(..) method result. For example a single line UILabel may returns a smaller width if its string is smaller than the reference width.
	     
	 * **`.heightFlexible`**: Similar to `.height`, except that PinLayout won't constrain the resulting height to match the reference height. The resulting height may be smaller of bigger depending on the view's sizeThatFits(..) method result.

	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#103](https://github.com/mirego/PinLayout/pull/103)

## [1.4.3](https://github.com/mirego/PinLayout/releases/tag/1.4.1)
Fix Carthage support

* Fix an issue that occurs with the latest Carthage version.

## [1.4.2](https://github.com/mirego/PinLayout/releases/tag/1.4.1)
#### Change
Add method that can pin multiples edges:

* `all()`: Pin all edges on its superview's corresponding edges (top, bottom, left, right). Similar to calling `view.top().bottom().left().right()`

* `horizontally()`: Pin the left and right edges on its superview's corresponding edges. Similar to calling `view.left().right()`.

* `vertically()`: Pin the **top and bottom edges** on its superview's corresponding edges. Similar to calling `view.top().bottom()`.
     
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#93](https://github.com/mirego/PinLayout/pull/93)
    

## [1.4.1](https://github.com/mirego/PinLayout/releases/tag/1.4.1)
#### Change
* Add new method `margin(_ directionalInsets: NSDirectionalEdgeInsets)`  

	Set margins using NSDirectionalEdgeInsets.
     This method is particularly to set all margins using iOS 11 `UIView.directionalLayoutMargins`.
     
     Available only on iOS 11 and higher.
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#85](https://github.com/mirego/PinLayout/pull/85)
     
* Update all examples so they support iOS 11 and iPhoneX landscape mode. They use the new UIView.safeAreaInsets property.
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#85](https://github.com/mirego/PinLayout/pull/85)

## [1.4.0](https://github.com/mirego/PinLayout/releases/tag/1.4.0)
#### Change
* PinLayout now apply correctly margins when hCenter or vCenter have been set
	* hCenter: When the Horizontal Center is set, PinLayout now applies the left margin.
	* vCenter: When the Vertical Center is set, PinLayout now applies the top margin.

	**BREAKING CHANGE**: This may be a breaking change if you are using hCenter(..), vCenter(...), center(...), centerRight(...), centerLeft(...), or any other method using the center position while also using a margin.

	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#91](https://github.com/mirego/PinLayout/pull/91)


## [1.3.2](https://github.com/mirego/PinLayout/releases/tag/1.3.2)
#### Change
* Add **aspectRatio** methods:
	* **`aspectRatio(_ ratio: CGFloat)`**:  
Set the view aspect ratio. If a single dimension is set (either width or height), the aspect ratio will be used to compute the other dimension.  
		* AspectRatio is defined as the ratio between the width and the height (width / height). 
		* An aspect ratio of 2 means the width is twice the size of the height.
		* AspectRatio respects the min (minWidth/minHeight) and the max (maxWidth/maxHeight) dimensions of an item.
Set all margins using an UIEdgeInsets.
This method is particularly useful to set all margins using iOS 11 UIView.safeAreaInsets
	* **`aspectRatio(of view: UIView)`**:  
	Set the view aspect ratio using another UIView's aspect ratio. 
     
     AspectRatio is applied only if a single dimension (either width or height) can be determined,
     in that case the aspect ratio will be used to compute the other dimension.
     
     * AspectRatio is defined as the ratio between the width and the height (width / height).
     * AspectRatio respects the min (minWidth/minHeight) and the max (maxWidth/maxHeight)
     dimensions of an item.
     
 * **`aspectRatio()`**:  
	If the layouted view is an UIImageView, this method will set the aspectRatio using
     the UIImageView's image dimension.
     
     For other types of views, this method as no impact. 
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#84](https://github.com/mirego/PinLayout/pull/84)
	
## [1.3.1](https://github.com/mirego/PinLayout/releases/tag/1.3.1)
#### Change
* Add new margin method `margin(_ insets: UIEdgeInsets)`  
Set all margins using an UIEdgeInsets.
This method is particularly useful to set all margins using iOS 11 UIView.safeAreaInsets
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#82](https://github.com/mirego/PinLayout/pull/82)
	
## [1.3.0](https://github.com/mirego/PinLayout/releases/tag/1.3.0)
Released on 2017-08-18. 

#### Change
* **Breaking change related to hCenter(CGFloat), hCenter(percent), vCenter(CGFloat), vCenter(percent)**:  
  * **`vCenter(_ value: CGFloat)`** and **`vCenter(_ percent: Percent)`**:  
The value specifies the distance vertically of the view's center **related to the superview's center** in pixels. Previously it was related to the **superview's top edge**.
  * **`hCenter(_ value: CGFloat)`** and **`hCenter(_ percent: Percent)`**:  
The value specifies the distance horizontally of the view's center **related to the superview's center** in pixels. Previously it was related to the **superview's left edge**.

Previously `hCenter(0)` wasn't equal to `hCenter()`, same thing for `vCenter(0)`. But this was an exception: `top(0)` == `top()`,` left(0)` == `left()`, `right(0)` == `right()`. Now thay all have the same logic.

## [1.2.4](https://github.com/mirego/PinLayout/releases/tag/1.2.4)
#### Change
* Add methods to pin hCenter and vCenter to any other view's edges (including the new hCenter and vCenter edges)
	*  **New methods**:
		* **`hCenter(to: edge)`**  
        Position horizontally the view's center directly on another view’s edge (left/hCenter/right)
		* **`vCenter(to: edge)`**  
        Position vertically the view's center directly on another view’s edge (top/vCenter/bottom).
	*  **New UIView's edges**:
		*  **`UIView.edge.hCenter`**
		*  **`UIView.edge.vCenter`**
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#80](https://github.com/mirego/PinLayout/pull/80) 
  
## [1.2.3](https://github.com/mirego/PinLayout/releases/tag/1.2.3)
#### Change
* Warnings now display more context information
  * The class name of the view being layouted.
  * The view's current frame 
  * The class name of all superviews
  * The view's Tag  

	Examples:
	
	* 👉 PinLayout Warning: width(50.0%) won't be applied, the view (UIView) must be added as a sub-view before being layouted using this method.  
(Layouted view info: Type: UIView, Frame: (10.0, 10.0, 20.0, 30.0), Tag: 0)
	
	* 👉 PinLayout Warning: width(-20.0) won't be applied, the width (-20.0) must be greater than or equal to zero.  
(Layouted view info: Type: ItemButton, Frame: (140.0, 100.0, 100.0, 60.0), Superviews: HomeView -> UIView, Tag: 0)
	
	* 👉 PinLayout Warning: topLeft(to: .topLeft, of: (UIView, Frame: (10.0, 10.0, 10.0, 10.0))) won't be applied, the reference view (UIView, Frame: (10.0, 10.0, 10.0, 10.0)) must be added as a sub-view before being used as a reference.  
(Layouted view info: Type: UIView, Frame: (140.0, 100.0, 100.0, 60.0), Superviews: UIView -> UIView, Tag: 0)

	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#75](https://github.com/mirego/PinLayout/pull/75) 

## [1.2.2](https://github.com/mirego/PinLayout/releases/tag/1.2.2)
#### Change
* Added a new method `fitSize()` that will replace the `sizeThatFit()` method. Its prior name was creating confusion with the already existingUIView.sizeToFit()` method.
* `sizeThatFit()` method has been marked as deprecated.

## [1.2.1](https://github.com/mirego/PinLayout/releases/tag/1.2.1)
#### Change
* Add Swift 4.0 support  

## [1.2.0](https://github.com/mirego/PinLayout/releases/tag/1.2.0)
Released on 2017-08-18. 

#### Change
* **Breaking change related to the following anchor's name**. The change makes these anchor's name more standard:  
  * **UIView.anchors.leftCenter** has been renamed UIView.anchors.centerLeft
  * **UIView.anchors.rightCenter** has been renamed UIView.anchors.centerRight

* **Add left to right (LTR) and right to left (RTL) language support**.  
Additions:
  * Pin.layoutDirection(_ direction: LayoutDirection)
  * start(), start(_ value: CGFloat), start(_ percent: Percent)
  * end(), end(_ value: CGFloat), end(_ percent: Percent)
  * UIView.edge.start
  * UIView.edge.end
  * UIView.anchor.topStart
  * UIView.anchor.topEnd
  * UIView.anchor.centerStart
  * UIView.anchor.centerEnd
  * UIView.anchor.bottomStart
  * UIView.anchor.bottomEnd
  * topStart(to anchor: Anchor), topStart()
  * topEnd(to anchor: Anchor), topEnd()
  * centerStart(to anchor: Anchor), centerStart()
  * centerEnd(to anchor: Anchor), centerEnd()
  * bottomStart(to anchor: Anchor), bottomStart()
  * bottomEnd(to anchor: Anchor), bottomEnd()
  * before(of: UIView), before(of: [UIView])
  * before(of: UIView, aligned: VerticalAlign), before(of: [UIView], aligned: VerticalAlign)
  * after(of: UIView), after(of: [UIView])
  * after(of: UIView, aligned: VerticalAlign), after(of: [UIView], aligned: VerticalAlign)
  * marginStart(_ value: CGFloat)
  * marginEnd(_ value: CGFloat)
  * HorizontalAlign.start
  * HorizontalAlign.end
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#56](https://github.com/mirego/PinLayout/pull/56) 



## [1.1.5](https://github.com/mirego/PinLayout/releases/tag/1.1.5)
Released on 2017-07-14. 

#### Change
* Fix missing UIKit import. The problem was occuring while using Swift Package Manager.
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#67](https://github.com/mirego/PinLayout/pull/67) 


## [1.1.4](https://github.com/mirego/PinLayout/releases/tag/1.1.4)
Released on 2017-07-09. 

#### Change
* Implementation of:
	* minWidth
	* maxWidth
	* minHeight
	* maxHeight
	* justify(:HorizontalAlign)
	* align(:VerticalAlign)
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#53](https://github.com/mirego/PinLayout/pull/53) 


## [1.1.1](https://github.com/mirego/PinLayout/releases/tag/1.1.1)
Released on 2017-06-27. 

#### Change
* Support **Xcode 9 Beta 2**
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#52](https://github.com/mirego/PinLayout/pull/52)
* Add a Form example
	* Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#51](https://github.com/mirego/PinLayout/pull/51)  
	* This example demonstrates:  
		* Usage of filter method when using PinLayout's relative methods (above, below, left, right)
		* Adjusting a container's height to match all its children.
		* Animation of the appearance/disappearance of UIViews.

	
  
## [1.1.0](https://github.com/mirego/PinLayout/releases/tag/1.1.0)
Released on 2017-06-18. 

#### Change
* Update relative methods signatures when specifying multiple relative views.  
Update the minor version due to a small breaking change with methods above(of…), below(of…), left(of…) and right(of…). They now takes either a single UIView or an Array of UIViews.
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#48](https://github.com/mirego/PinLayout/pull/48)


## [1.0.15](https://github.com/mirego/PinLayout/releases/tag/1.0.15)
Released on 2017-06-12. 

#### Change
* Add **tvOS** support & set iOS target to 8.0 (instead of 10.2)
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#46](https://github.com/mirego/PinLayout/pull/46)


## [1.0.14](https://github.com/mirego/PinLayout/releases/tag/1.0.14)
Released on 2017-06-12. 

#### Change

* Implementation of **relative positioning using multiple relative views**
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#43](https://github.com/mirego/PinLayout/pull/43)
  * The following methods can now receives one or many relative views. Useful to position a view relative to many UIViews.  
	 * `above(of relativeViews: UIView...) `
	 * `above(of relativeViews: UIView..., aligned: HorizontalAlignment) `
	 * `below(of relativeViews: UIView...)`
	 * `below(of relativeViews: UIView..., aligned: HorizontalAlignment)`
	 * `left(of relativeViews: UIView...) `
	 * `left(of relativeViews: UIView..., aligned: VerticalAlignment)`
	 * `right(of relativeViews: UIView...) `
	 * `right(of relativeViews: UIView..., aligned: VerticalAlignment)`

## [1.0.11](https://github.com/mirego/PinLayout/releases/tag/1.0.11)
Released on 2017-06-08. 

#### Change

* Add **Swift Package Manager** support
  * Added by [Luc Dion](https://github.com/lucdion) in Pull Request [#38](https://github.com/mirego/PinLayout/pull/38
* **`size(…)` methods** now tries to apply the width and the height individually  
Previously the size specified was applied only if both the width and height wasn’t specified. Now PinLayout will apply them individually, so if the width has been specified yet, the size’s width will be applied, else a warning will be displayed that indicate that the width won’t be applied. Same thing for the height.
* Doesn’t display a warning anymore if the new specified width or height value is equal to the currently set value. This is coherent with other methods (top, left, hCenter, ….)
* Clean up `size(...)` methods source code
* Add PinLayout's performance documentation
* Add 52 more unit tests. Code coverage is now 95.38%.

### Fixes
- Fix an issue with pin.vCenter() and pin.hCenter()
  - Fixed by [Luc Dion](https://github.com/lucdion) in Pull Request
  [#36](https://github.com/mirego/PinLayout/pull/36).


## [1.0.7](https://github.com/mirego/PinLayout/releases/tag/1.0.7)
Released on 2017-06-06. 

### Fixes
- Fix an issue with pin.vCenter() and pin.hCenter()
  - Fixed by [Luc Dion](https://github.com/lucdion) in Pull Request
  [#36](https://github.com/mirego/PinLayout/pull/36).
