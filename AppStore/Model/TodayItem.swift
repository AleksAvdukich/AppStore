//
//  TodayItem.swift
//  AppStore
//
//  Created by Aleksandr Avdukich on 22/10/2019.
//  Copyright © 2019 Aleksandr Avdukich. All rights reserved.
//

import UIKit

struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    let cellType: CellType
    
    enum CellType: String {
        case single, multiple
    }
}
