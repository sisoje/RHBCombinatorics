public func factoriel(N: Int) -> Int {
    
    assert(N >= 0)
    
    return (1...max(1,N)).reduce(1) {
        
        $0 * $1
    }
}

public func choose(N: Int, K: Int) -> Int {
    
    assert(K > 0)
    assert(N >= K)
    
    return (1...K).reduce(1) {
        
        $0 * (N - K + $1) / $1
    }
}

public func firstElementInCombination(index:Int, N:Int, K:Int) -> (element:Int, countLow:Int) {
    
    if K == 1 {
        
        return (index, index)
    }
    
    let NK = N - K
    let K1 = K - 1
    var sum = 0
    var combinationCountForCurrentElement = choose(N: N, K: K1)
    for element in 0..<NK {
        
        let divider = N - element
        let multiplicator = divider - K1
        combinationCountForCurrentElement *= multiplicator
        combinationCountForCurrentElement /= divider
        sum += combinationCountForCurrentElement
        if (sum > index) {
            
            return (element, sum - combinationCountForCurrentElement)
        }
    }
    
    return (NK, sum)
}

public func nextCombination(combination: [Int], N: Int) -> [Int]? {
    
    let foundElementOptional = combination.enumerated().reversed().first {
        
        return $1 < N-combination.count+$0
    }
    guard let foundElement = foundElementOptional else {
        
        return nil
    }
    return combination.prefix(foundElement.offset) + Array(foundElement.element+1...foundElement.element+combination.count-foundElement.offset)
}

public struct RHBCombinationIterator : IteratorProtocol {
    
    let N:Int
    var combination:[Int]?
    init(N: Int, K: Int) {
        
        self.N = N
        self.combination = Array(0..<K)
    }
    public mutating func next() -> [Int]? {

        guard let result = self.combination else {
            
            return nil
        }
        self.combination = nextCombination(combination: result, N: self.N)
        return result
    }
}

public struct RHBCombinations : Sequence, Collection {
    
    public let N:Int
    public let K:Int
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
    
    public func makeIterator() -> RHBCombinationIterator {
        
        return RHBCombinationIterator(N: self.N, K: self.K)
    }
    
    public init(N:Int, K:Int) {
        
        self.N = N
        self.K = K
        self.count = choose(N: N, K: K)
    }
    
    public func combinationAt(index:Int) -> [Int] {
        
        assert(index >= 0)
        assert(index < self.count)
        
        var elementsLeft = N
        var combinationIndex = index
        
        return (0..<K).map {
            
            let firstElement = firstElementInCombination(index:combinationIndex, N: elementsLeft, K: K - $0)
            combinationIndex -= firstElement.countLow
            elementsLeft -= firstElement.element + 1
            return (N - 1 - elementsLeft)
        }
    }
    
    public subscript(index:Int) -> [Int] {
        
        return combinationAt(index:index)
    }
}


