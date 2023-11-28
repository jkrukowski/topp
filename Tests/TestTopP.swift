@testable import TopP
import XCTest

internal final class TestTopK: XCTestCase {
    private let accuracy: Float = 0.00001

    internal func testV1() {
        let result1 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.99)
        XCTAssertEqual(result1.indexes, [9, 8, 7, 6, 5])
        XCTAssertEqual(result1.probs, [0.6321493, 0.23255473, 0.085552104, 0.031472858, 0.011578218], accuracy: accuracy)

        let result2 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.95)
        XCTAssertEqual(result2.indexes, [9, 8, 7])
        XCTAssertEqual(result2.probs, [0.6321493, 0.23255473, 0.085552104], accuracy: accuracy)

        let result3 = V1.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.6321)
        XCTAssertEqual(result3.indexes, [9])
        XCTAssertEqual(result3.probs, [0.6321493], accuracy: accuracy)

        let result4 = V1.topP(arr: [], p: 0.99)
        XCTAssertTrue(result4.indexes.isEmpty)
        XCTAssertTrue(result4.probs.isEmpty)
    }

    internal func testV2() {
        let result1 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.99)
        XCTAssertEqual(result1.indexes, [9, 8, 7, 6, 5])
        XCTAssertEqual(result1.probs, [0.6321493, 0.23255473, 0.085552104, 0.031472858, 0.011578218], accuracy: accuracy)

        let result2 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.95)
        XCTAssertEqual(result2.indexes, [9, 8, 7])
        XCTAssertEqual(result2.probs, [0.6321493, 0.23255473, 0.085552104], accuracy: accuracy)

        let result3 = V2.topP(arr: (0 ..< 10).map { Float($0) }, p: 0.6321)
        XCTAssertEqual(result3.indexes, [9])
        XCTAssertEqual(result3.probs, [0.6321493], accuracy: accuracy)

        let result4 = V2.topP(arr: [], p: 0.99)
        XCTAssertTrue(result4.indexes.isEmpty)
        XCTAssertTrue(result4.probs.isEmpty)
    }
}