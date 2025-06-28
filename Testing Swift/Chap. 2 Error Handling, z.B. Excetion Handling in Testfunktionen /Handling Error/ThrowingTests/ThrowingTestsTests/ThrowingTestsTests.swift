//
//  ThrowingTestsTests.swift
//  ThrowingTestsTests
//
//  Created by Robert Welz on 27.06.25.
//

import Testing
@testable import ThrowingTests

struct ThrowingTestsTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }
}

@Test func playingBioBlitzThrows() {
    let game = Game(name: "BioBlitz")
    do {
        try game.play()
        Issue.record("BioBlitz has not been purchased.")
    } catch {
    }
}

@Test func playingBioBlitzThrows2() {
    let game = Game(name: "BioBlitz")
    do {
        try game.play()
        Issue.record()
    } catch GameError.notPurchased {
        // success!
    } catch {
        Issue.record()
    }
}

@Test func playingBlastazapThrows() {
    let game = Game(name: "Blastazap")
    #expect(throws: Error.self) {
        try game.play()
    }
}

@Test func playingBlastazapThrows2() {
    let game = Game(name: "Blastazap")
    #expect(throws: GameError.notInstalled) {
        try game.play()
    }
}
//
@Test func playingOddOneOutDoesntThrow() {
let game = Game(name: "Odd One Out")
#expect(throws: Never.self) {
try game.play()
}
}

// Das ist die Iideale Lösung:

@Test func patchMatchThrows() throws {
    let game = Game(name: "Patch Match")
    try game.play()
}

extension GameError: @retroactive CustomTestStringConvertible {
    public var testDescription: String {
        switch self {
        case .notPurchased:
            "This game has not been purchased."
        case .notInstalled:
            "This game is not currently installed."
        case .parentalControlsDisallowed:
            "This game has been blocked by parental controls."
        }
    }
}


// Swift Testing provides one extra useful option for code with errors, which is the
// withKnownIssue() function. This expects an error to be thrown and will in fact fail your test if
// the error isn't thrown.
//@Test func loadNames() async {
//    let viewModel = ViewModel()
//    await withKnownIssue("Names can sometimes come back with too few values") {
//        try await viewModel.loadNames()
//        #expect(viewModel.names.isEmpty == false, "Names should be full of values.")
//    }
//}

// This has a variation that is particularly useful while you're debugging networking code, which
// is the isIntermittent parameter – setting that to true will tell Swift to pass the test if no error is
// thrown, but mark an expected failure if an error is thrown

//@Test func loadNames() async {
//    let viewModel = ViewModel()
//    await withKnownIssue("Names can sometimes come back with too few values", isIntermittent: true) {
//        try await viewModel.loadNames()
//        #expect(viewModel.names.isEmpty == false, "Names should be www.hackingwithswift.com Unit Testing full of values.")
//    }
//}

