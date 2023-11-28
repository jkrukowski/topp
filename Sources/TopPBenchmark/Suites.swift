import Benchmark
import TopP

let settings: BenchmarkSetting = Iterations(1_000)

// V1

internal let v1Benchmarks = BenchmarkSuite(name: "V1", settings: settings) { suite in
    let arr1 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.90") {
        _ = V1.topP(arr: arr1, p: 0.90)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.95") {
        _ = V1.topP(arr: arr2, p: 0.95)
    }

    let arr3 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.99") {
        _ = V1.topP(arr: arr3, p: 0.99)
    }

    let arr5 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.90") {
        _ = V1.topP(arr: arr5, p: 0.90)
    }

    let arr6 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.95") {
        _ = V1.topP(arr: arr6, p: 0.95)
    }

    let arr7 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.99") {
        _ = V1.topP(arr: arr7, p: 0.99)
    }

    let arr9 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.90") {
        _ = V1.topP(arr: arr9, p: 0.90)
    }

    let arr10 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.95") {
        _ = V1.topP(arr: arr10, p: 0.95)
    }

    let arr11 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.99") {
        _ = V1.topP(arr: arr11, p: 0.99)
    }
}

// V2

internal let v2Benchmarks = BenchmarkSuite(name: "V2", settings: settings) { suite in
    let arr1 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.90") {
        _ = V2.topP(arr: arr1, p: 0.90)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.95") {
        _ = V2.topP(arr: arr2, p: 0.95)
    }

    let arr3 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.99") {
        _ = V2.topP(arr: arr3, p: 0.99)
    }

    let arr5 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.90") {
        _ = V2.topP(arr: arr5, p: 0.90)
    }

    let arr6 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.95") {
        _ = V2.topP(arr: arr6, p: 0.95)
    }

    let arr7 = Array.random(65_000)
    suite.benchmark("n=65_000, p=0.99") {
        _ = V2.topP(arr: arr7, p: 0.99)
    }

    let arr9 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.90") {
        _ = V2.topP(arr: arr9, p: 0.90)
    }

    let arr10 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.95") {
        _ = V2.topP(arr: arr10, p: 0.95)
    }

    let arr11 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.99") {
        _ = V2.topP(arr: arr11, p: 0.99)
    }
}

public let allBenchmarks = [
    v1Benchmarks,
    v2Benchmarks
]
