//
//  WUBrowseViewController.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import UIKit
import Foundation

class WUBrowseViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource
{
	let kReuseCollectionViewCell = "WUBrowseGymCollectionViewCell"
	var navigator: AppNavigator
	var collectionView: UICollectionView!
	var gyms: Array<String>!

	init() {
		navigator = AppNavigator.init(navigationController: UINavigationController.init())
		super.init(nibName: nil, bundle: nil)
		self.gyms = ["Daan", "XinYi", "RenAi"]
	}

	init(navigator: AppNavigator) {
		self.navigator = navigator
		super.init(nibName: nil, bundle: nil)
		self.gyms = ["Daan", "XinYi", "RenAi"]
	}

	required init?(coder aDecoder: NSCoder) {
		navigator = AppNavigator.init(navigationController: UINavigationController.init())
		super.init(coder: aDecoder)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.navigationItem.title = "探索"
		self.view.backgroundColor = UIColor.init(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
		self.edgesForExtendedLayout = []
		self.view.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(tapAction)))
		self.setupCollectionView()
	}

	// MARK: - setup methods
	func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.itemSize = CGSize.init(width: 300, height: 200)
		layout.scrollDirection = .horizontal
		self.collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: layout)
		self.collectionView.backgroundColor = UIColor.clear
		self.collectionView.translatesAutoresizingMaskIntoConstraints = false
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		self.collectionView.register(WUBrowseGymCollectionViewCell.self, forCellWithReuseIdentifier: kReuseCollectionViewCell)
		self.collectionView.isScrollEnabled = true
		self.view.addSubview(self.collectionView)

		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "H:|-12-[collectionView]-12-|", options: [], metrics: nil, views: ["collectionView": collectionView]))
		NSLayoutConstraint.activate(NSLayoutConstraint.constraints(withVisualFormat: "V:|-24-[collectionView(200)]", options: [], metrics: nil, views: ["collectionView": collectionView]))
	}

	// MARK: - UICollectionViewDelegate methods


	// MARK: - UICollectionViewDataSource methods
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return gyms.count
	}

	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let gymTitle = self.gyms[indexPath.row]
		let cell: WUBrowseGymCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kReuseCollectionViewCell, for: indexPath) as! WUBrowseGymCollectionViewCell
		cell.configure(with: gymTitle)
		return cell
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


