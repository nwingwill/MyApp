//
//  DisplayableProtocol.swift
//  MyApp
//
//  Created by nwing on 12/10/22.
//

import Foundation

protocol DisplayableProtocol {
    var titleLabelText: String { get }
    var subtitleLabelText: String { get }
    var item1: (label: String, value: String) { get }
    var listTitle: String { get }
    var itemImage: String {get}
    var listItems: [Int] { get }
    var idItem: String { get }
//    var listItems: [Int] { get }
}
