//
//  FocusSession.swift
//  ForestClone
//
//  Created by Christian Leovido on 18/06/2020.
//  Copyright © 2020 Accent IT Services. All rights reserved.
//

import Foundation

typealias Seconds = Int

struct FocusSession {
    var tree: TreeSpecimen = TreeSpecimen(name: "tree",
                                          description: "Some description",
                                          cost: 0,
                                          image: "tree-1",
                                          states: [])
    var sessionStarted: Bool = false
    var time: Seconds = 600
    let date: Date = Date()
}
