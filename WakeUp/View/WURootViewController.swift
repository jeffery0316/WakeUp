//
//  WURootViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import UIKit
import Foundation

class WURootViewController: UIViewController
{
	var navigator: AppNavigator

	init() {
		navigator = AppNavigator.init(navigationController: UINavigationController.init())
		super.init(nibName: nil, bundle: nil)
	}

	init(navigator: AppNavigator) {
		self.navigator = navigator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		navigator = AppNavigator.init(navigationController: UINavigationController.init())
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = UIColor.gray
		self.edgesForExtendedLayout = []
		self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
	}

	// MARK: - action methods
	@objc func tapAction() {
		let gymListVC = WUGymListViewController.init(navigator: navigator)
		navigator.pushToViewController(viewController: gymListVC)
	}

	func _crawlData(data: Data, response: HTTPURLResponse) {

		// suppose to do data transformation and parse web to get essential data
		let _ = XMLTransformer.init(data: data)
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

