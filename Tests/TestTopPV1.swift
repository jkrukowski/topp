@testable import TopP
import XCTest

internal final class TestTopP_Performance_V1: XCTestCase {
    internal func test_N32_000_P90() {
        let arr = Array.random(32_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N32_000_P95() {
        let arr = Array.random(32_000)
        let p: Float = 0.95
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N32_000_P99() {
        let arr = Array.random(32_000)
        let p: Float = 0.99
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func testN_65_000_P90() {
        let arr = Array.random(65_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N65_000_P95() {
        let arr = Array.random(65_000)
        let p: Float = 0.95
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N65_000_P99() {
        let arr = Array.random(65_000)
        let p: Float = 0.99
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func testN_128_000_P90() {
        let arr = Array.random(128_000)
        let p: Float = 0.90
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N128_000_P95() {
        let arr = Array.random(128_000)
        let p: Float = 0.95
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }

    internal func test_N128_000_P99() {
        let arr = Array.random(128_000)
        let p: Float = 0.99
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V1.topP(arr: arr, p: p)
        }
    }
}
