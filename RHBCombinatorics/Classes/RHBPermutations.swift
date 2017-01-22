//
//  RHBPermutations.swift
//  Pods
//
//  Created by Lazar Otasevic on 1/21/17.
//
//


public func nextPermutation(permutation: [Int]) -> [Int]? {
    
    let N = permutation.count
    let splitIndex_ = (1..<N).reversed().first {
        
        return permutation[$0-1] < permutation[$0]
    }
    guard let splitIndex = splitIndex_ else {
        
        return nil
    }
    
    let indexForSwap1 = splitIndex-1
    let indexForSwap2 = (splitIndex..<N).reversed().first {
        
        return permutation[$0] > permutation[indexForSwap1]
    }!
    
    var suffixArray = permutation.suffix(from: splitIndex)
    suffixArray[indexForSwap2] = permutation[indexForSwap1]
    
    var prefixArray = permutation.prefix(splitIndex)
    prefixArray[indexForSwap1] = permutation[indexForSwap2]
    
    return prefixArray + suffixArray.reversed()
}

public struct RHBPermutationIterator : IteratorProtocol {
    
    var permutation:[Int]?
    init(N: Int) {
        
        self.permutation = Array(0..<N)
    }
    public mutating func next() -> [Int]? {
        
        guard let result = self.permutation else {
            
            return nil
        }
        self.permutation = nextPermutation(permutation: result)
        return result
    }
}

public struct RHBPermutations : Sequence {
    
    public let N:Int
    public let count: Int
    
    public var endIndex: Int {
        
        return self.count
    }
    
    public var startIndex: Int {
        
        return 0
    }
    
    public func index(after i: Int) -> Int {
        
        return i + 1
    }
    
    public func makeIterator() -> RHBPermutationIterator {
        
        return RHBPermutationIterator(N: self.N)
    }
    
    public init(N:Int) {
        
        self.N = N
        self.count = factoriel(N: N)
    }
}
