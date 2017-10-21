//
//  WUSettingViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/21.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit

final class WUSettingViewController: UIViewController
{
	var navigator: AppNavigator

	init() {
		let navController = UINavigationController.init()
		navigator = AppNavigator.init(navigationController: navController)
		super.init(nibName: nil, bundle: nil)
	}

	init(navigator: AppNavigator) {
		self.navigator = navigator
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.navigationItem.title = "設定"
		self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
	}
}
