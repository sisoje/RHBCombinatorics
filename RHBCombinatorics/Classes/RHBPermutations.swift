//
//  RHBPermutations.swift
//  Pods
//
//  Created by Lazar Otasevic on 1/21/17.
//
//


public func nextPermutation(permutation: [Int]) -> [Int]? {
    
    let splitIndexOptional = (1..<permutation.count).reversed().first {
        
        return permutation[$0-1] < permutation[$0]
    }
    guard let splitIndex = splitIndexOptional else {
        
        return nil
    }
    var prefixArray = permutation.prefix(splitIndex)
    var suffixArray = permutation.suffix(from: splitIndex)
    
    let swapElement = suffixArray.enumerated().reversed().first {
        
        return $1 > prefixArray.last!
    }!
    
    suffixArray[splitIndex+swapElement.offset] = prefixArray.last!
    prefixArray[splitIndex-1] = swapElement.element
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
