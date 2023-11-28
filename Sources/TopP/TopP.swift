import Accelerate
import Foundation

internal func softmax(_ x: [Float]) -> [Float] {
    var x = x
    let len = vDSP_Length(x.count)

    // Find the maximum value in the input array.
    var max: Float = 0
    vDSP_maxv(x, 1, &max, len)

    // Subtract the maximum from all the elements in the array.
    // Now the highest value in the array is 0.
    max = -max
    vDSP_vsadd(x, 1, &max, &x, 1, len)

    // Exponentiate all the elements in the array.
    var count = Int32(x.count)
    vvexpf(&x, x, &count)

    // Compute the sum of all exponentiated values.
    var sum: Float = 0
    vDSP_sve(x, 1, &sum, len)

    // Divide each element by the sum. This normalizes the array contents
    // so that they all add up to 1.
    vDSP_vsdiv(x, 1, &sum, &x, 1, len)

    return x
}

public enum V1 {
    public static func cumsum(_ arr: [Float]) -> [Float] {
        guard !arr.isEmpty else {
            return []
        }
        return arr.dropFirst().reduce(into: [arr[0]]) {
            $0.append($0.last! + $1)
        }
    }

    public static func topP(arr: [Float], p: Float) -> (indexes: [Int], probs: [Float]) {
        guard !arr.isEmpty else {
            return (indexes: [], probs: [])
        }

        let arr = softmax(arr)
        var arrIndices = arr.enumerated().map { (index: $0, element: $1) }
        arrIndices.sort { $0.element > $1.element }

        let cumsum = cumsum(arrIndices.map(\.element))
        var sliceIndex = cumsum.count - 1
        for (index, element) in cumsum.enumerated() where element > p {
            sliceIndex = index
            break
        }

        return (arrIndices[0 ... sliceIndex].map(\.index), arrIndices[0 ... sliceIndex].map(\.element))
    }
}

public enum V2 {
    public static func cumsum(_ arr: [Float]) -> [Float] {
        guard !arr.isEmpty else {
            return []
        }
        let arrCount = vDSP_Length(arr.count)
        var weight: Float = 1.0
        var result: [Float] = Array(repeating: 0.0, count: arr.count)
        var firstItem = arr[0]
        vDSP_vrsum(arr, 1, &weight, &result, 1, arrCount)
        vDSP_vsadd(result, 1, &firstItem, &result, 1, arrCount)
        return result
    }

    public static func topP(arr: [Float], p: Float) -> (indexes: [Int], probs: [Float]) {
        guard !arr.isEmpty else {
            return (indexes: [], probs: [])
        }

        let arr = softmax(arr)
        var arrIndices = arr.enumerated().map { (index: $0, element: $1) }
        arrIndices.sort { $0.element > $1.element }

        let cumsum = cumsum(arrIndices.map(\.element))
        var sliceIndex = cumsum.count - 1
        for (index, element) in cumsum.enumerated() where element > p {
            sliceIndex = index
            break
        }

        return (arrIndices[0 ... sliceIndex].map(\.index), arrIndices[0 ... sliceIndex].map(\.element))
    }
}
