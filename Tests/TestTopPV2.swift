@testable import TopP
import XCTest

internal final class TestTopP_Performance_V2: XCTestCase {
    internal func test_N16_000_P90() {
        let arr = Array.random(16_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.topP(arr: arr, p: p)
        }
    }

    internal func test_N32_000_P90() {
        let arr = Array.random(32_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.topP(arr: arr, p: p)
        }
    }

    internal func test_N64_000_P90() {
        let arr = Array.random(64_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.topP(arr: arr, p: p)
        }
    }

    internal func test_N128_000_P90() {
        let arr = Array.random(128_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.topP(arr: arr, p: p)
        }
    }
}
