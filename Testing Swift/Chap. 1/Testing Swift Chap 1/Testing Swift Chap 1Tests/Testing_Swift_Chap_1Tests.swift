//
//  Testing_Swift_Chap_1Tests.swift
//  Testing Swift Chap 1Tests
//
//  Created by Robert Welz on 19.06.25.
//

// Foundation muss manchmal händisch hinzugefügt werden.
//import Foundation
import Testing
@testable import Testing_Swift_Chap_1

struct Testing_Swift_Chap_1Tests {

    @Test func studentStartsAtHome() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.

        let student = Student()

        #expect(student.isAtSchool == false, "some desciptive but optional message")
    }

    @Test func studentGoesToSchool() async throws {
        // Given
        var student = Student()

        // When
        student.goToSchool()

        // Then
        #expect(student.isAtSchool == true)
    }

    @Test func studentLeavesSchool() async throws {
        // Given
        var student = Student()

        // When
        student.goToSchool()

        student.leaveSchool()

        // Then
        #expect(student.isAtSchool == false)
    }
}

// I’ve added two empty lines in there. That’s not an accident! One of the smartest
// test practices you can adopt is the Arrange, Act, Assert paradigm, which is where you break
// down your tests into three states:
// 1. You’re putting things into place ready for the test.
// 2. You’re executing the code you want to test.
// 3. You’re evaluating the results of that test.

// This is commonly phrased as “given, when, then” and it’s very common to see those terms
// added as comments in tests, like in the @Test func studentGoesToSchool().

// Keep the
// structure of arrange, act, assert is a good idea. This means you should avoid asserting
// something, then doing some more acting, then asserting again – it creates confusion when your
// tests fail, and massively increases your chance of your tests not being isolated.

