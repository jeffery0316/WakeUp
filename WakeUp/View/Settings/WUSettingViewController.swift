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
	init() {
		super.init(nibName: nil, bundle: nil)
		let navController = UINavigationController.init()
		let appNavigator = AppNavigator.init(navigationController: navController)
		appNavigator.run()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
