//
//  WURootViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import UIKit
import Foundation

class WURootViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.gray
		self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
	}

	// MARK: - action methods
	@objc func tapAction() {
		let gymListVC = WUGymListViewController.init()
		self.navigationController?.pushViewController(gymListVC, animated: true)
	}

	func _crawlData(data: Data, response: HTTPURLResponse) {

		// suppose to do data transformation and parse web to get essential data
		let transformer = XMLTransformer.init(data: data)
		//		do {
		//			let tree = try transformer.transform()
		//			for node in tree?.nodes {
		//				if
		//			}
		//		}
		//		catch {
		//
		//		}
	}
}

