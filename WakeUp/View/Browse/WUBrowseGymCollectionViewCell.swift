//
//  WUBrowseGymCollectionViewCell.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/21.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit

final class WUBrowseGymCollectionViewCell: UICollectionViewCell
{
	var titleLabel: UILabel!
	var timeLabel: UILabel!
	var imageView: UIView!

	override func prepareForReuse() {
		super.prepareForReuse()
	}

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.translatesAutoresizingMaskIntoConstraints = false
		self.titleLabel = UILabel.init()
		self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(titleLabel)

		self.timeLabel = UILabel.init()
		self.timeLabel.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(timeLabel)

		self.imageView = UIView.init()
		self.imageView.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(imageView)

		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|[imageView]-8-[titleLabel]-4-[timeLabel]-|", options: [], metrics: nil, views: ["titleLabel": titleLabel, "timeLabel": timeLabel, "imageView": imageView]))
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|[imageView]|", options: [], metrics: nil, views: ["imageView": imageView]))
		NSLayoutConstraint.activate([NSLayoutConstraint.init(item: self.imageView, attribute: .left, relatedBy: .equal, toItem: self.titleLabel, attribute: .left, multiplier: 1.0, constant: 0.0)])
		NSLayoutConstraint.activate([NSLayoutConstraint.init(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: self.timeLabel, attribute: .left, multiplier: 1.0, constant: 0.0)])
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with gymTitle: String) {
		self.titleLabel.text = gymTitle
		self.timeLabel.text = "2017/10/22"
		self.imageView.backgroundColor = UIColor.yellow
	}
}
