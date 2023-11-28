@testable import TopP
import XCTest

internal final class TestTopK: XCTestCase {
    private let accuracy: Float = 0.00001

    internal func testV1() {
        let result1 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.99)
        XCTAssertEqual(result1.indexes, [9, 8, 7, 6, 5])
        XCTAssertEqual(result1.probs, [0.63640857, 0.23412164, 0.08612853, 0.031684916, 0.011656229], accuracy: accuracy)
        XCTAssertEqual(result1.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result2 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.95)
        XCTAssertEqual(result2.indexes, [9, 8, 7])
        XCTAssertEqual(result2.probs, [0.6652409, 0.24472845, 0.090030566], accuracy: accuracy)
        XCTAssertEqual(result2.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result3 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.6321493)
        XCTAssertEqual(result3.indexes, [9, 8])
        XCTAssertEqual(result3.probs, [0.7310586, 0.26894143], accuracy: accuracy)
        XCTAssertEqual(result3.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result4 = V1.topP(arr: [], p: 0.99)
        XCTAssertTrue(result4.indexes.isEmpty)
        XCTAssertTrue(result4.probs.isEmpty)
    }

    internal func testV2() {
        let result1 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.99)
        XCTAssertEqual(result1.indexes, [9, 8, 7, 6, 5])
        XCTAssertEqual(result1.probs, [0.63640857, 0.23412164, 0.08612853, 0.031684916, 0.011656229], accuracy: accuracy)
        XCTAssertEqual(result1.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result2 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.95)
        XCTAssertEqual(result2.probs, [0.6652409, 0.24472845, 0.090030566], accuracy: accuracy)
        XCTAssertEqual(result2.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result3 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.6321493)
        XCTAssertEqual(result3.indexes, [9, 8])
        XCTAssertEqual(result3.probs, [0.7310586, 0.26894143], accuracy: accuracy)
        XCTAssertEqual(result3.probs.reduce(0, +), 1.0, accuracy: accuracy)

        let result4 = V2.topP(arr: [], p: 0.99)
        XCTAssertTrue(result4.indexes.isEmpty)
        XCTAssertTrue(result4.probs.isEmpty)
    }
}