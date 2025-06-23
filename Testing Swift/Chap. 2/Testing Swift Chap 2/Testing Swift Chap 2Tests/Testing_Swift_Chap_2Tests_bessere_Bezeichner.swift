//
//  Testing_Swift_Chap_2Tests_bessere_Bezeichner.swift
//  Testing Swift Chap 2
//
//  Created by Robert Welz on 19.06.25.
//

import Testing
@testable import Testing_Swift_Chap_2

struct Testing_Swift_Chap_2Tests_bessere_Bezeichner {

    // MARK: - GIVEN state, WHEN action, THEN expectation

    // TODO: ab Xcode 17:
    // Leerzeichen in Funktionsnamen (mit backticks) sind laut chatgpt durch swift.org
    // seit swift 5.10 zwar erlaubt, aber seitens Apples noch nicht implementiert.
    // Da ich aber keine Refernz dazu finde (der Link von ChatGPT funktioniert nicht https://github.com/apple/swift-evolution/blob/main/proposals/0390-package-testing.md)
    // könnte es sich um ene Halluzination von ChatGPT handeln
    // Hacking with swift meint dazu, Leerzeichen mit bezeichnern sind erst ab Xcode 17 erlaubt.

    //@Test
    //func `GIVEN a new student WHEN initialized THEN is not at school`() async throws {
    //    let student = Student()
    //    #expect(student.isAtSchool == false)
    //}

    @Test
    func `GIVEN_a_student_at_home_WHEN_going_to_school_THEN_is_at_school`() async throws {
        var student = Student()
        student.goToSchool()
        #expect(student.isAtSchool == true)
    }

    @Test
    func `GIVEN_a_student_at_school_WHEN_leaving_school_THEN_is_no_longer_at_school`() async throws {
        var student = Student()
        student.goToSchool()
        student.leaveSchool()
        #expect(student.isAtSchool == false)
    }
}

