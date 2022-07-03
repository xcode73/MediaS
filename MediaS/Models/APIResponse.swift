//
//  SearchResult.swift
//  MediaS
//
//  Created by Nikolai Eremenko on 29.06.2022.
//

import Foundation

struct APIResponse: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
}

struct UnsplashPhoto: Decodable {
    let width: Int
    let height: Int
    let urls: [URLKind.RawValue: String]
    
    enum URLKind: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
}
