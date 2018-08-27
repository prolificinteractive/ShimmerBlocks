//
//  ShimmerContainerView.swift
//  TheWing
//
//  Created by Jonathan Samudio on 8/3/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit
import Shimmer
import PureLayout

public class ShimmerContainer {

    // MARK: - Private Properties

    private weak var parentView: UIView?

    private var shimmeringViews = [UIView: UIView]()

    // MARK: - Initialization

    /// Initializes the shimmer container class.
    ///
    /// - Parameter parentView: Parent view to apply the shimmer with.
    public init(parentView: UIView?) {
        self.parentView = parentView
    }

    // MARK: - Public Functions

    /// Generates a shimmer view with the given parameters.
    ///
    /// - Parameters:
    ///   - image: Optional image to use.
    ///   - backgroundColor: Background color of the shimmer block.
    /// - Returns: Shimmering view.
    public static func generateShimmerView(image: UIImage? = nil, backgroundColor: UIColor) -> UIView {
        let shimmerView = FBShimmeringView()
        var contentView = UIView()

        if let image = image {
            let imageView =  UIImageView(image: image)
            imageView.contentMode = .center
            contentView = imageView
        } else {
            contentView.backgroundColor = backgroundColor
        }

        shimmerView.contentView = contentView
        contentView.autoPinEdgesToSuperviewEdges()
        shimmerView.isShimmering = true
        return shimmerView
    }

    /// Enables the shimmer with the given parameters.
    ///
    /// - Parameters:
    ///   - enable: Enables the views to shimmer.
    ///   - shimmerData: Shimmer data used to apply the shimmer.
    public func applyShimmer(enable: Bool, with shimmerData: [ShimmerData]) {
        if enable {
            applyShimmer(with: shimmerData)
        } else {
            shimmeringViews.forEach {
                $0.key.alpha = 1
                $0.value.removeFromSuperview()
            }
            shimmeringViews.removeAll()
        }
    }

}

// MARK: - Private Functions
private extension ShimmerContainer {

    func applyShimmer(with shimmerData: [ShimmerData]) {
        for data in shimmerData {
            guard let subView = data.view, shimmeringViews[subView] == nil else {
                continue
            }

            subView.alpha = 0
            subView.isHidden = false

            let containerView = setupContainerView(data: data)
            parentView?.addSubview(containerView)
            setupContainerConstraints(containerView: containerView, data: data, subView: subView)
            shimmeringViews[subView] = containerView
        }
    }

    func setupContainerView(data: ShimmerData) -> UIView {
        var containerView: UIView
        let sectionSubviews = setupSectionSubviews(data: data)

        if sectionSubviews.count <= 1, let sectionView = sectionSubviews.first {
            containerView = sectionView
        } else {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = data.sectionSpacing
            sectionSubviews.forEach { stackView.addArrangedSubview($0) }
            containerView = stackView
        }
        return containerView
    }

    func setupContainerConstraints(containerView: UIView, data: ShimmerData, subView: UIView) {
        containerView.autoPinEdge(.leading, to: .leading, of: subView)
        containerView.autoPinEdge(.top, to: .top, of: subView)

        if data.matchViewDimensions {
            containerView.autoPinEdge(.trailing, to: .trailing, of: subView)
            containerView.autoPinEdge(.bottom, to: .bottom, of: subView)
        }
    }

    func setupSectionSubviews(data: ShimmerData) -> [UIView] {
        guard data.matchViewDimensions == false else {
            return [ShimmerContainer.generateShimmerView(image: data.image, backgroundColor: data.backgroundColor)]
        }

        var sections = [UIView]()
        for section in data.sections {
            let view = ShimmerContainer.generateShimmerView(image: data.image, backgroundColor: data.backgroundColor)
            view.autoSetDimension(.height, toSize: section.height)
            view.autoSetDimension(.width, toSize: section.width)
            sections.append(view)
        }
        return sections
    }

}
