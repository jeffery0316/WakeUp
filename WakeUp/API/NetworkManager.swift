//
//  NetworkManager.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/20.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation

class NetworkManager
{
	static public let sharedAPI = NetworkManager()
	private let session: URLSession
	private var dataTask: URLSessionTask?

	init() {
		let config = URLSessionConfiguration.ephemeral
		config.timeoutIntervalForRequest = 30
		config.timeoutIntervalForResource = 86400
		config.httpMaximumConnectionsPerHost = 20

		session = URLSession.init(configuration: config, delegate: nil, delegateQueue: OperationQueue())
		//		self._connectURL(url: "sssc.com.tw") { (data, response) in
		//			self._crawlData(data: data!, response: response!)
		//		}
	}

	func _connectURL(url: String, completion: @escaping (Data?, HTTPURLResponse?) -> Void) {
		dataTask?.cancel()

		if var urlComponents = URLComponents(string: url) {
			urlComponents.query = ""

			guard let urlStr = urlComponents.url else {
				return
			}

			dataTask = session.dataTask(with: urlStr) {data, response, error in
				defer {
					self.dataTask = nil
				}

				if let error = error {
					print(error.localizedDescription)
				}
				else if let data = data, let response = response as? HTTPURLResponse {
					DispatchQueue.main.async {
						completion(data, response)
					}
				}
			}
		}

		dataTask?.resume()
	}
}
