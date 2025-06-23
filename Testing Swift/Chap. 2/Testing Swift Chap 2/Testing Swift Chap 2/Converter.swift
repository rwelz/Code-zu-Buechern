//
//  Converter.swift
//  Testing Swift Chap 2
//
//  Created by Robert Welz on 23.06.25.
//

import Foundation

struct Converter {
//    func convertToCelsius(fahrenheit: Double) -> Double {
//        (fahrenheit - 32) * 5 / 9
//    }

    // We’ve written tests for our temperature converter, so we’re now in a position to do some
    // refactoring: we’re going to ditch our custom Fahrenheit to Celsius converter and replace it with
    // the one from Foundation.

    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit:
                                        UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
    // click to run the tests against this new code. Chances are you’ll find it’s
    // failing, and you’ll see messages like this:
    // • Expectation failed: (celsius → 2.2168933355715126e-12) == (0 → 0.0)
    // • Expectation failed: (celsius → 100.00000000000301) == (100 → 100.0)
    // the natural variance in accuracy of floating point numbers: the official solution for this
    // – for now at least – is to bring in another Apple
    // framework called Swift Numerics, which allows us to test for approximate equality.
    // See page 40 for more.
}
