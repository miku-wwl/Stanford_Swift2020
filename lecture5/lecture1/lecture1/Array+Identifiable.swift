//
//  Array+Identifiable.swift
//  lecture1
//
//  Created by mac on 2021/1/29.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex (matching:Element) -> Int? {
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
