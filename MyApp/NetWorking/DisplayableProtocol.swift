//
//  DisplayableProtocol.swift
//  MyApp
//
//  Created by nwing on 12/10/22.
//

import Foundation

protocol DisplayableProtocol {
    var titleLabelText: String { get } //mainTitleLabel
    var subtitleLabelText: String { get } //subtitleLabel
    var item1: (label: String, value: String) { get } //itemElementLabel
    var listTitle: String { get } //descriptionLabel
    var itemImage: String {get} //itemImage
    var listItems: [Int] { get } //listIds
    var idItem: String { get }
//    var listItems: [String] { get }
}
