//
//  AppDelegate.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		let homeVC = WURootViewController.init()
		let mapVC = WUMapViewController.init()
		let settingVC = WUSettingViewController.init()

		let tabBarController = UITabBarController.init()
		tabBarController.tabBar.barTintColor = UIColor.yellow

		tabBarController.viewControllers = [homeVC, mapVC, settingVC]
		let tabBar = tabBarController.tabBar
		let tabBarHome = tabBar.items![0]
		tabBarHome.image = UIImage(named: "tab_gym")

		let tabBarMap = tabBar.items![1]
		tabBarMap.image = UIImage(named: "tab_map")

		let tabBarSetting = tabBar.items![2]
		tabBarSetting.image = UIImage(named: "tab_settings")

		window?.rootViewController = tabBarController
		return true
	}
}

