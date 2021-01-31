//
//  Array+only.swift
//  lecture1
//
//  Created by mac on 2021/1/29.
//  Copyright © 2021 Weilai Wang. All rights reserved.
//

import Foundation

extension Array{
    var only:Element?{
        count == 1 ? first :nil
    }
}
