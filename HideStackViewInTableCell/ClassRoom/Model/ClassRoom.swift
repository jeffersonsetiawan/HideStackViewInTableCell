//
//  ClassRoom.swift
//  HideStackViewInTableCell
//
//  Created by Jefferson Setiawan on 26/06/18.
//  Copyright © 2018 Jefferson Setiawan. All rights reserved.
//

import Foundation

public struct ClassRoom {
    public let id: Int
    public let name: String
    public let isActive: Bool
    public let students: [Student]
}

public struct Student {
    public let id: Int
    public let name: String
}
