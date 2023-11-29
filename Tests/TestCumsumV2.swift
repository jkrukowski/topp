@testable import TopP
import XCTest

internal final class TestCumsum_Performance_V2: XCTestCase {
    internal func test_cumsum_N16_000() {
        let arr = Array.random(16_000)
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.cumsum(arr)
        }
    }

    internal func test_cumsum_N32_000() {
        let arr = Array.random(32_000)
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.cumsum(arr)
        }
    }

    internal func test_cumsum_N64_000() {
        let arr = Array.random(64_000)
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.cumsum(arr)
        }
    }

    internal func test_cumsum_N128_000() {
        let arr = Array.random(128_000)
        measure(metrics: Self.defaultMetrics, options: Self.defaultOptions) {
            _ = V2.cumsum(arr)
        }
    }
}
