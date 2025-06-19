//
//  Students.swift
//  Testing Swift Chap 1
//
//  Created by Robert Welz on 19.06.25.
//

import Foundation

struct Student {
    var isAtSchool = false
    mutating func goToSchool() {
        isAtSchool = true
    }
    mutating func leaveSchool() {
        isAtSchool = false
    }
}
