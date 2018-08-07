//
//  ShimmerData.swift
//  TheWing
//
//  Created by Jonathan Samudio on 8/3/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

final class ShimmerData {

    // MARK: - Public Properties

    /// View to add shimmer overlay to.
    weak var view: UIView?

    /// Spacing between each section.
    let sectionSpacing: CGFloat

    /// Sets the container view size to match the provided view's size.
    let matchViewDimensions: Bool

    /// Image to apply to the overlay instead of using a blocked section.
    let image: UIImage?

    /// Sections to display over the provided view.
    let sections: [ShimmerSection]

    /// Background color of the overlay sections. Does not overlay the image.
    let backgroundColor: UIColor

    // MARK: - Initialization

    init(_ view: UIView?,
         sectionSpacing: CGFloat = 6,
         maxNumberOfSections: Int = 3,
         matchViewDimensions: Bool = false,
         image: UIImage? = nil,
         sections: [ShimmerSection] = [],
         backgroundColor: UIColor = UIColor.lightGray) {

        self.view = view
        self.sectionSpacing = sectionSpacing
        self.matchViewDimensions = matchViewDimensions
        self.image = image
        self.sections = sections
        self.backgroundColor = backgroundColor
    }

}
