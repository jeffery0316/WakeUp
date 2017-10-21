//
//  XMLTransformer.swift
//  WakeUp
//
//  Created by JefferyKao on 2017/10/19.
//  Copyright © 2017年 kkbox. All rights reserved.
//

import Foundation

class XMLTransformer: NSObject {

	private let parser: XMLParser
	private var stack = [Node]()
	private var tree: Node?

	init(data: Data) {
		parser = XMLParser(data: data)
		super.init()
		parser.delegate = self
	}
}

extension XMLTransformer {

	func transform() throws -> Node? {
		parser.parse()
		if let e = parser.parserError {
			throw e
		}
		assert(stack.isEmpty)
		assert(tree != nil)
		return tree
	}

}

extension XMLTransformer: XMLParserDelegate {

	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
		guard let tag = Tag(rawValue: elementName) else {
			return
		}
		let node = Node(tag: tag, attributes: attributeDict, nodes: [])
		stack.append(node)
	}

	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
		guard let tag = Tag(rawValue: elementName) else {
			return
		}
		let lastElement = stack.removeLast()
		assert(lastElement.tag == tag)
		if let last = stack.last {
			last.nodes += [lastElement]
		} else {
			tree = lastElement
		}
	}
}

extension XMLTransformer {

	enum Tag: String {
		case document
		case objects
		case tableViewCell, tableViewCellContentView
		case subviews
		case mapView
		case constraints, constraint
		case connections, outlet
	}
}

extension XMLTransformer {

	class Node {

		let tag: Tag
		let attributes: [String : String]
		var nodes: [Node]

		init(tag: Tag, attributes: [String : String], nodes: [Node] = []) {
			self.tag = tag
			self.attributes = attributes
			self.nodes = nodes
		}
	}
}
