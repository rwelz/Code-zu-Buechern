//
//  ConverterTests.swift
//  Testing Swift Chap 2Tests
//
//  Created by Robert Welz on 23.06.25.
//

import Testing
import Numerics
@testable import Testing_Swift_Chap_2

struct ConverterTests {
    // naive first test version
    //    @Test func fahrenheitToCelsius() {
    //        let sut = Converter()
    //        //you'll see the term sut a lot in unit tests. It’s short for “system under test” and its used
    //        // to refer to whatever object you are testing in the code so it can be identified at a glance. To the
    //        // best of my knowledge, this term was first introduced by Gerard Meszaros.
    //        let input1 = 32.0
    //        let output1 = sut.convertToCelsius(fahrenheit: input1)
    //        #expect(output1 == 0)
    //        let input2 = 212.0
    //        let output2 = sut.convertToCelsius(fahrenheit: input2)
    //        #expect(output2 == 100)
    //    }

    // now with correct annotations
    //    @Test func fahrenheitToCelsius() {
    //        // given
    //        let sut = Converter()
    //        let input1 = 32.0
    //        // when
    //        let output1 = sut.convertToCelsius(fahrenheit: input1)
    //        // then
    //        #expect(output1 == 0)
    //        // given
    //        let input2 = 212.0
    //        // when
    //        let output2 = sut.convertToCelsius(fahrenheit: input2)
    //        // then
    //        #expect(output2 == 100)
    //    }

    // better two tests instead of one:
    @Test func check32FahrenheitIsZeroCelsius() {
        // given
        let sut = Converter()
        let input = 32.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        //#expect(celsius == 0)
        // now with the swift-numerics package:
        #expect(celsius.isApproximatelyEqual(to: 0, absoluteTolerance:
                                                0.000001))
    }
    // This tolerance is really useful when working with numbers that have recurring digits.
    //For example, 1/3 as a decimal is 0.333333333 recurring.
    
    @Test func check212FahrenheitIs100Celsius() {
        // given
        let sut = Converter()
        let input = 212.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        //#expect(celsius == 100)
        // now with the swift-numerics package:
        #expect(celsius.isApproximatelyEqual(to: 100,
                                             absoluteTolerance: 0.000001))
    }

    @Test func check100FahrenheitIs37Celsius() {
        // given
        let sut = Converter()
        let input = 100.0
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        // then
        #expect(celsius.isApproximatelyEqual(to: 37.777777,
                                             absoluteTolerance: 0.000001))
    }
        // @Test func <#test function name#>() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        // }

}
