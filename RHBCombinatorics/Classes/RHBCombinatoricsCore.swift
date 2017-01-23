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

