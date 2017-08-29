// Copyright (c) 2017, Mirego
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are met:
//
// - Redistributions of source code must retain the above copyright notice,
//   this list of conditions and the following disclaimer.
// - Redistributions in binary form must reproduce the above copyright notice,
//   this list of conditions and the following disclaimer in the documentation
//   and/or other materials provided with the distribution.
// - Neither the name of the Mirego nor the names of its contributors may
//   be used to endorse or promote products derived from this software without
//   specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
// AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
// ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
// LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
// CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
// SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
// INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
// CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

import Foundation

#if os(iOS) || os(tvOS)
import UIKit

// MARK: - PinLayout UIView's extension
public extension UIView {
    public var pin: PinLayout {
        return PinLayoutImpl(view: self)
    }

    public var anchor: AnchorList {
        return AnchorListImpl(view: self)
    }

    public var edge: EdgeList {
        return EdgeListImpl(view: self)
    }
}

/*
 UIView's anchors point
 ======================

         topLeft      topCenter       topRight
            o-------------o--------------o
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            |           center           |
 centerLeft o             o              o centerRight
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            |                            |
            o-------------o--------------o
       bottomLeft    bottomCenter     bottomLeft

 */

/// UIViews's anchor definition
public protocol Anchor {
}

/// UIViews's list of anchors.
public protocol AnchorList {
    var topLeft: Anchor { get }
    var topCenter: Anchor { get }
    var topRight: Anchor { get }
    var centerLeft: Anchor { get }
    var center: Anchor { get }
    var centerRight: Anchor { get }
    var bottomLeft: Anchor { get }
    var bottomCenter: Anchor { get }
    var bottomRight: Anchor { get }

    // RTL support
    var topStart: Anchor { get }
    var topEnd: Anchor { get }
    var centerStart: Anchor { get }
    var centerEnd: Anchor { get }
    var bottomStart: Anchor { get }
    var bottomEnd: Anchor { get }
}

/*
 UIView's Edges
 ======================
                   top
          +-------------------+
          |                   |
          |                   |
          |                   |
     left |                   | right
          |                   |
          |                   |
          |                   |
          |                   |
          +-------------------+
                  bottom
*/

/// UIViews's list of edges
public protocol EdgeList {
    var top: VerticalEdge { get }
    var left: HorizontalEdge { get }
    var bottom: VerticalEdge { get }
    var right: HorizontalEdge { get }

    // RTL support
    var start: HorizontalEdge { get }
    var end: HorizontalEdge { get }
}

/// PinLayout interface
public protocol PinLayout {
    //
    // MARK: Layout using distances from superview’s edges
    //
    @discardableResult func top() -> PinLayout
    @discardableResult func top(_ value: CGFloat) -> PinLayout
    @discardableResult func top(_ percent: Percent) -> PinLayout
    
    @discardableResult func left() -> PinLayout
    @discardableResult func left(_ value: CGFloat) -> PinLayout
    @discardableResult func left(_ percent: Percent) -> PinLayout
    
    @discardableResult func bottom() -> PinLayout
    @discardableResult func bottom(_ value: CGFloat) -> PinLayout
    @discardableResult func bottom(_ percent: Percent) -> PinLayout
    
    @discardableResult func right() -> PinLayout
    @discardableResult func right(_ value: CGFloat) -> PinLayout
    @discardableResult func right(_ percent: Percent) -> PinLayout
    
    @discardableResult func hCenter() -> PinLayout
    @discardableResult func hCenter(_ value: CGFloat) -> PinLayout
    @discardableResult func hCenter(_ percent: Percent) -> PinLayout
    
    @discardableResult func vCenter() -> PinLayout
    @discardableResult func vCenter(_ value: CGFloat) -> PinLayout
    @discardableResult func vCenter(_ percent: Percent) -> PinLayout

    // RTL support
    @discardableResult func start() -> PinLayout
    @discardableResult func start(_ value: CGFloat) -> PinLayout
    @discardableResult func start(_ percent: Percent) -> PinLayout
    @discardableResult func end() -> PinLayout
    @discardableResult func end(_ value: CGFloat) -> PinLayout
    @discardableResult func end(_ percent: Percent) -> PinLayout
    
    //
    // MARK: Layout using edges
    //
    @discardableResult func top(to edge: VerticalEdge) -> PinLayout
    @discardableResult func left(to edge: HorizontalEdge) -> PinLayout
    @discardableResult func bottom(to edge: VerticalEdge) -> PinLayout
    @discardableResult func right(to edge: HorizontalEdge) -> PinLayout
    // RTL support
    @discardableResult func start(to edge: HorizontalEdge) -> PinLayout
    @discardableResult func end(to edge: HorizontalEdge) -> PinLayout

    //
    // MARK: Layout using anchors
    //
    @discardableResult func topLeft(to anchor: Anchor) -> PinLayout
    @discardableResult func topLeft() -> PinLayout
    @discardableResult func topStart(to anchor: Anchor) -> PinLayout
    @discardableResult func topStart() -> PinLayout

    @discardableResult func topCenter(to anchor: Anchor) -> PinLayout
    @discardableResult func topCenter() -> PinLayout

    @discardableResult func topRight(to anchor: Anchor) -> PinLayout
    @discardableResult func topRight() -> PinLayout
    @discardableResult func topEnd(to anchor: Anchor) -> PinLayout
    @discardableResult func topEnd() -> PinLayout

    @discardableResult func centerLeft(to anchor: Anchor) -> PinLayout
    @discardableResult func centerLeft() -> PinLayout
    @discardableResult func centerStart(to anchor: Anchor) -> PinLayout
    @discardableResult func centerStart() -> PinLayout

    @discardableResult func center(to anchor: Anchor) -> PinLayout
    @discardableResult func center() -> PinLayout

    @discardableResult func centerRight(to anchor: Anchor) -> PinLayout
    @discardableResult func centerRight() -> PinLayout
    @discardableResult func centerEnd(to anchor: Anchor) -> PinLayout
    @discardableResult func centerEnd() -> PinLayout

    @discardableResult func bottomLeft(to anchor: Anchor) -> PinLayout
    @discardableResult func bottomLeft() -> PinLayout
    @discardableResult func bottomStart(to anchor: Anchor) -> PinLayout
    @discardableResult func bottomStart() -> PinLayout

    @discardableResult func bottomCenter(to anchor: Anchor) -> PinLayout
    @discardableResult func bottomCenter() -> PinLayout

    @discardableResult func bottomRight(to anchor: Anchor) -> PinLayout
    @discardableResult func bottomRight() -> PinLayout
    @discardableResult func bottomEnd(to anchor: Anchor) -> PinLayout
    @discardableResult func bottomEnd() -> PinLayout

    //
    // MARK: Layout using relative positioning
    //
    @discardableResult func above(of: UIView) -> PinLayout
    @discardableResult func above(of: [UIView]) -> PinLayout
    @discardableResult func above(of: UIView, aligned: HorizontalAlign) -> PinLayout
    @discardableResult func above(of: [UIView], aligned: HorizontalAlign) -> PinLayout
    
    @discardableResult func below(of: UIView) -> PinLayout
    @discardableResult func below(of: [UIView]) -> PinLayout
    @discardableResult func below(of: UIView, aligned: HorizontalAlign) -> PinLayout
    @discardableResult func below(of: [UIView], aligned: HorizontalAlign) -> PinLayout
    
    @discardableResult func left(of: UIView) -> PinLayout
    @discardableResult func left(of: [UIView]) -> PinLayout
    @discardableResult func left(of: UIView, aligned: VerticalAlign) -> PinLayout
    @discardableResult func left(of: [UIView], aligned: VerticalAlign) -> PinLayout
    
    @discardableResult func right(of: UIView) -> PinLayout
    @discardableResult func right(of: [UIView]) -> PinLayout
    @discardableResult func right(of: UIView, aligned: VerticalAlign) -> PinLayout
    @discardableResult func right(of: [UIView], aligned: VerticalAlign) -> PinLayout

    // RTL support
    @discardableResult func before(of: UIView) -> PinLayout
    @discardableResult func before(of: [UIView]) -> PinLayout
    @discardableResult func before(of: UIView, aligned: VerticalAlign) -> PinLayout
    @discardableResult func before(of: [UIView], aligned: VerticalAlign) -> PinLayout
    @discardableResult func after(of: UIView) -> PinLayout
    @discardableResult func after(of: [UIView]) -> PinLayout
    @discardableResult func after(of: UIView, aligned: VerticalAlign) -> PinLayout
    @discardableResult func after(of: [UIView], aligned: VerticalAlign) -> PinLayout

    //
    // MARK: justify / align
    //
    @discardableResult func justify(_: HorizontalAlign) -> PinLayout
    @discardableResult func align(_: VerticalAlign) -> PinLayout
    
    //
    // MARK: Width, height and size
    //
    @discardableResult func width(_ width: CGFloat) -> PinLayout
    @discardableResult func width(_ percent: Percent) -> PinLayout
    @discardableResult func width(of view: UIView) -> PinLayout
    @discardableResult func minWidth(_ width: CGFloat) -> PinLayout
    @discardableResult func minWidth(_ percent: Percent) -> PinLayout
    @discardableResult func maxWidth(_ width: CGFloat) -> PinLayout
    @discardableResult func maxWidth(_ percent: Percent) -> PinLayout
    
    @discardableResult func height(_ height: CGFloat) -> PinLayout
    @discardableResult func height(_ percent: Percent) -> PinLayout
    @discardableResult func height(of view: UIView) -> PinLayout
    @discardableResult func minHeight(_ height: CGFloat) -> PinLayout
    @discardableResult func minHeight(_ percent: Percent) -> PinLayout
    @discardableResult func maxHeight(_ height: CGFloat) -> PinLayout
    @discardableResult func maxHeight(_ percent: Percent) -> PinLayout
    
    @discardableResult func size(_ size: CGSize) -> PinLayout
    @discardableResult func size(_ sideLength: CGFloat) -> PinLayout
    @discardableResult func size(_ percent: Percent) -> PinLayout
    @discardableResult func size(of view: UIView) -> PinLayout
    
    @available(*, deprecated, message: "You should now use fitSize() instead.")
    @discardableResult func sizeToFit() -> PinLayout
    @discardableResult func fitSize() -> PinLayout

    //
    // MARK: Margins
    //
    @discardableResult func marginTop(_ value: CGFloat) -> PinLayout
    @discardableResult func marginLeft(_ value: CGFloat) -> PinLayout
    @discardableResult func marginBottom(_ value: CGFloat) -> PinLayout
    @discardableResult func marginRight(_ value: CGFloat) -> PinLayout
    // RTL support
    @discardableResult func marginStart(_ value: CGFloat) -> PinLayout
    @discardableResult func marginEnd(_ value: CGFloat) -> PinLayout
    
    @discardableResult func marginHorizontal(_ value: CGFloat) -> PinLayout
    @discardableResult func marginVertical(_ value: CGFloat) -> PinLayout

    /// Apply to all four margins (top, left, bottom, right)
    ///
    /// - Parameter value: <#value description#>
    /// - Returns: <#return value description#>
    @discardableResult func margin(_ value: CGFloat) -> PinLayout
    /// vertical | horizontal
    ///
    /// - Parameters:
    ///   - vertical: <#vertical description#>
    ///   - horizontal: <#horizontal description#>
    /// - Returns: <#return value description#>
    @discardableResult func margin(_ vertical: CGFloat, _ horizontal: CGFloat) -> PinLayout
    /// top | horizontal | bottom
    ///
    /// - Parameters:
    ///   - top: <#top description#>
    ///   - horizontal: <#horizontal description#>
    ///   - bottom: <#bottom description#>
    /// - Returns: <#return value description#>
    @discardableResult func margin(_ top: CGFloat, _ horizontal: CGFloat, _ bottom: CGFloat) -> PinLayout
    /// top | right | bottom | left
    ///
    /// - Parameters:
    ///   - top: <#top description#>
    ///   - left: <#left description#>
    ///   - bottom: <#bottom description#>
    ///   - right: <#right description#>
    /// - Returns: <#return value description#>
    @discardableResult func margin(_ top: CGFloat, _ left: CGFloat, _ bottom: CGFloat, _ right: CGFloat) -> PinLayout

    /// Normally if only either left or right has been specified, PinLayout will MOVE the view to apply left or right margins.
    /// This is also true even if the width has been set.
    /// Calling pinEdges() will force PinLayout to pin the four edges and then apply left and/or right margins, and this without
    /// moving the view.
    ///
    /// - Returns: PinLayout
    @discardableResult func pinEdges() -> PinLayout
}

/// Horizontal alignment used with relative positionning methods: above(of relativeView:, aligned:), below(of relativeView:, aligned:)
///
/// - left: left aligned
/// - center: center aligned
/// - right: right aligned
public enum HorizontalAlign: String {
    case left
    case center
    case right
    
    // RTL support
    case start
    case end
}

/// Vertical alignment used with relative positionning methods: left(of relativeView:, aligned:), right(of relativeView:, aligned:)
///
/// - top: top aligned
/// - center: center aligned
/// - bottom: bottom aligned
public enum VerticalAlign: String {
    case top
    case center
    case bottom
}

/// UIView's horizontal edges (left/right) definition
public protocol HorizontalEdge {
}

/// UIView's vertical edges (top/bottom) definition
public protocol VerticalEdge {
}
    
#else
    import AppKit
#endif
