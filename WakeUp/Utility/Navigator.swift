//
//  Navigator.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/21.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation
import UIKit

protocol Navigator {}

protocol GymNavigator: Navigator {
	func viewController(_ viewController: UIViewController, didShowInfo gym: String)
}

protocol GymListNavigator: Navigator {
	func viewController(_ viewController: UIViewController, didSelectGym gym: String)
}

final class AppNavigator: Navigator {
	fileprivate let navigationController: UINavigationController

	init(navigationController: UINavigationController) {
		self.navigationController = navigationController
	}

	func pushToViewController(viewController: UIViewController) {
		navigationController.pushViewController(viewController, animated: true)
	}
}

extension AppNavigator: GymNavigator {
	func viewController(_ viewController: UIViewController, didShowInfo gym: String) {
		let infoVC = WUGymInfoViewController.init(navigator: self)
		navigationController.present(infoVC, animated: true, completion: nil)
	}
}

extension AppNavigator: GymListNavigator {
	func viewController(_ viewController: UIViewController, didSelectGym gym: String) {
		let gymVC = WUGymViewController.init(navigator: self)
		navigationController.pushViewController(gymVC, animated: true)
	}
}
