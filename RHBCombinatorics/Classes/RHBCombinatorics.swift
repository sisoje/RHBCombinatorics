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

func firstElementInCombination(index:Int, N:Int, K:Int) -> (element:Int, countLow:Int) {
    
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

open class RHBCombinations {

    open let N:Int
    open let K:Int
    open let count:Int

    public init(N:Int, K:Int) {
        
        self.N = N
        self.K = K
        self.count = choose(N: N, K: K)
    }
    
    func combinationAt(index:Int) -> [Int] {
        
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
    
    open subscript(index:Int) -> [Int] {
        
        return combinationAt(index:index)
    }
}

