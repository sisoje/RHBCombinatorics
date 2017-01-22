import UIKit
import XCTest
import RHBCombinatorics

class TestsCombinations: XCTestCase {
    
    let combinatonsForPerformance = RHBCombinations(N: 15, K: 6)
    let combinationsForPrinting = RHBCombinations(N: 4, K: 3)

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFactoriel() {
        
        // This is an example of a functional test case.
        XCTAssert(1 == factoriel(N: 0))
        XCTAssert(1 == factoriel(N: 1))
        XCTAssert(2 == factoriel(N: 2))
        XCTAssert(6 == factoriel(N: 3))
#if arch(x86_64) || arch(arm64)
        XCTAssert(factoriel(N: 20) == 2432902008176640000)
#endif
        (1...10).forEach {
            
            XCTAssert(factoriel(N: $0-1)*$0 == factoriel(N: $0))
        }
    }
    
    func testChoose() {
        
        for N in 2...10 {
            
            for K in 2...N {
                
                let summed = (0...N-K).reduce(0) {
                    
                    $0 + choose(N: N - $1 - 1, K: K - 1)
                }
                XCTAssert(summed == choose(N: N, K: K))
            }
        }
        (1...100).forEach {
            
            XCTAssert(choose(N:$0, K: $0) == 1)
        }
        (1...100).forEach {
            
            XCTAssert(choose(N:$0+1, K: $0) == $0+1)
        }
        XCTAssert(choose(N: 49, K:6) == 13983816)
        XCTAssert(choose(N: 42, K:5) == 850668)
    }
    
    func testCombinations() {
        
        XCTAssert(RHBCombinations(N: 2, K: 1).elementsEqual([[0],[1]], by: ==))
        XCTAssert(RHBCombinations(N: 3, K: 1).elementsEqual([[0],[1],[2]], by: ==))
        XCTAssert(RHBCombinations(N: 3, K: 2).elementsEqual([[0,1],[0,2],[1,2]], by: ==))
        XCTAssert(RHBCombinations(N: 4, K: 3).elementsEqual([[0,1,2],[0,1,3],[0,2,3],[1,2,3]], by: ==))
        XCTAssert(RHBCombinations(N: 4, K: 2).elementsEqual([[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]], by: ==))
        (1...100).forEach {
            XCTAssert(RHBCombinations(N: $0, K: $0).elementsEqual([Array(0..<$0)], by: ==))
        }
    }
    
    func testCombinationsIterate() {
        
        let combinatons = self.combinationsForPrinting
        combinatons.forEach { print($0) }
    }

    func testCombinationsLoopByIndex() {
        
        let combinatons = self.combinationsForPrinting
        (0..<combinatons.count).forEach {
            
            print($0, combinatons[$0])
        }
    }
    
    func testEqualityIndexedAndIterated() {
        
        let combinatons = self.combinatonsForPerformance
        var index = 0
        combinatons.forEach {
            
            let combination = combinatons[index]
            XCTAssert(combination == $0)
            index += 1
        }
        XCTAssert(index == combinatons.count)
    }
    
    func testPerformanceIndexed() {
        
        let combinatons = self.combinatonsForPerformance
        self.measure() {

            (0..<combinatons.count).forEach {
                
                XCTAssert(combinatons[$0].count == combinatons.K)
            }
        }
    }
    
    func testPerformanceIterated() {
        
        let combinatons = self.combinatonsForPerformance
        self.measure() {
            
            combinatons.forEach {
                
                XCTAssert($0.count == combinatons.K)
            }
        }
    }
}
