//
//  InfoTableViewCell.swift
//  ShimmerBlocks_Example
//
//  Created by Jonathan Samudio on 8/27/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import ShimmerBlocks

final class InfoTableViewCell: UITableViewCell {

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    private lazy var shimmerContainer = ShimmerContainer(parentView: self)

    private lazy var shimmerData: [ShimmerData] = {
        let titleSections = ShimmerSection.generate(minWidth: 50, height: 21, totalWidth: 150, maxNumberOfSections: 3)
        return [ShimmerData(titleLabel, sectionSpacing: 6, sections: titleSections),
                ShimmerData(infoImageView, matchViewDimensions: true),
                ShimmerData(descriptionLabel, matchViewDimensions: true)]
    }()

    func isLoading(_ loading: Bool) {
        shimmerContainer.applyShimmer(enable: loading, with: shimmerData)
    }

}
