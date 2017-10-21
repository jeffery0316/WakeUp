//
//  NetworkEnum.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/20.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation

enum WUNetworkStatus: Int {
	case Success = 201
	case ForceUpdate = 499
	case BadReqeust = 400
	case Unauthorized = 401
	case ForbiddenError = 403
	case NotFound = 404
	case InternalServerError = 500
	case CannotParseData = 1111, EmptyResponseData, ReqeustCancelled
}
