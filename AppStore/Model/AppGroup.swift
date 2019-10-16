//
//  AppGroup.swift
//  AppStore
//
//  Created by Aleksandr Avdukich on 10/10/2019.
//  Copyright © 2019 Aleksandr Avdukich. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
