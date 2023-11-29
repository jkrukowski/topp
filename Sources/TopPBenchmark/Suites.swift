import Benchmark
import TopP

let settings: BenchmarkSetting = Iterations(1_000)

// V1

internal let v1Benchmarks = BenchmarkSuite(name: "V1", settings: settings) { suite in
    let arr1 = Array.random(16_000)
    suite.benchmark("n=16_000, p=0.90") {
        _ = V1.topP(arr: arr1, p: 0.90)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.90") {
        _ = V1.topP(arr: arr2, p: 0.90)
    }

    let arr3 = Array.random(64_000)
    suite.benchmark("n=64_000, p=0.90") {
        _ = V1.topP(arr: arr3, p: 0.90)
    }

    let arr4 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.90") {
        _ = V1.topP(arr: arr4, p: 0.90)
    }
}

internal let cumsumV1Benchmarks = BenchmarkSuite(name: "cumsum V1", settings: settings) { suite in
    let arr1 = Array.random(16_000)
    suite.benchmark("n=16_000") {
        _ = V1.cumsum(arr1)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000") {
        _ = V1.cumsum(arr2)
    }

    let arr3 = Array.random(64_000)
    suite.benchmark("n=64_000") {
        _ = V1.cumsum(arr3)
    }

    let arr4 = Array.random(128_000)
    suite.benchmark("n=128_000") {
        _ = V1.cumsum(arr4)
    }
}

// V2

internal let v2Benchmarks = BenchmarkSuite(name: "V2", settings: settings) { suite in
    let arr1 = Array.random(16_000)
    suite.benchmark("n=16_000, p=0.90") {
        _ = V2.topP(arr: arr1, p: 0.90)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000, p=0.90") {
        _ = V2.topP(arr: arr2, p: 0.90)
    }

    let arr3 = Array.random(64_000)
    suite.benchmark("n=64_000, p=0.90") {
        _ = V2.topP(arr: arr3, p: 0.90)
    }

    let arr4 = Array.random(128_000)
    suite.benchmark("n=128_000, p=0.90") {
        _ = V2.topP(arr: arr4, p: 0.90)
    }
}

internal let cumsumV2Benchmarks = BenchmarkSuite(name: "cumsum V2", settings: settings) { suite in
    let arr1 = Array.random(16_000)
    suite.benchmark("n=16_000") {
        _ = V2.cumsum(arr1)
    }

    let arr2 = Array.random(32_000)
    suite.benchmark("n=32_000") {
        _ = V2.cumsum(arr2)
    }

    let arr3 = Array.random(64_000)
    suite.benchmark("n=64_000") {
        _ = V2.cumsum(arr3)
    }

    let arr4 = Array.random(128_000)
    suite.benchmark("n=128_000") {
        _ = V2.cumsum(arr4)
    }
}

public let allBenchmarks = [
    v1Benchmarks,
    cumsumV1Benchmarks,
    v2Benchmarks,
    cumsumV2Benchmarks
]
