import UIKit
import XCTest
import RHBCombinatorics

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChooseNKSums() {
        
        for N in 2...10 {
            
            for K in 2...N {
                
                let summed = (0...N-K).reduce(0) {
                    
                    $0 + choose(N: N - $1 - 1, K: K - 1)
                }
                let summed1 = (K-1...N-1).reduce(0) {
                    
                    $0 + choose(N: $1, K: K - 1)
                }
                XCTAssert(summed == summed1)
                XCTAssert(summed == choose(N: N, K: K))
            }
        }
    }
    
    func testFactoriel() {
        
        // This is an example of a functional test case.
        XCTAssert(1 == factoriel(N: 0))
        XCTAssert(1 == factoriel(N: 1))
        XCTAssert(2 == factoriel(N: 2))
        XCTAssert(6 == factoriel(N: 3))
        XCTAssert(factoriel(N: 20) == 2432902008176640000)
        (1...20).forEach {
            
            XCTAssert(factoriel(N: $0-1)*$0 == factoriel(N: $0))
        }
    }
    
    func testChoose() {
        
        (1...100).forEach {
            
            XCTAssert(choose(N:$0, K: $0) == 1)
            XCTAssert(choose(N:$0+1, K: $0) == $0+1)
        }
        XCTAssert(choose(N: 49, K:6) == 13983816)
        XCTAssert(choose(N: 42, K:5) == 850668)
    }
    
    func verifyCombinations(_ combinations:RHBCombinations, results:[[Int]]) {
        
        XCTAssert(results.count == combinations.count)
        for combinationIndex in 0..<combinations.count {
            
            let calculatedCombination = combinations[combinationIndex]
            let givenCombination = results[combinationIndex]
            XCTAssert(calculatedCombination == givenCombination)
        }
    }
    
    func testCombinationsExamples() {
        
        verifyCombinations(RHBCombinations(N: 4, K: 2), results:[[0,1],[0,2],[0,3],[1,2],[1,3],[2,3]])
        verifyCombinations(RHBCombinations(N: 2, K: 1), results:[[0],[1]])
        verifyCombinations(RHBCombinations(N: 3, K: 1), results:[[0],[1],[2]])
        verifyCombinations(RHBCombinations(N: 3, K: 2), results:[[0,1],[0,2],[1,2]])
        verifyCombinations(RHBCombinations(N: 4, K: 3), results:[[0,1,2],[0,1,3],[0,2,3],[1,2,3]])
    }
    
    func testCombinationsNN() {

        (1...100).forEach {
            verifyCombinations(RHBCombinations(N: $0, K: $0), results: [Array(0..<$0)])
        }
    }
    
    func testCombinationsLoop43() {
        
        let combinatons = RHBCombinations(N: 4, K: 3)
        for combinationIndex in 0..<combinatons.count {
            
            let combination = combinatons[combinationIndex]
            print(combinationIndex, combination)
        }
    }
    
    func testPerformanceExample() {
        
        // This is an example of a performance test case.
        self.measure() {

            let combinatons = RHBCombinations(N: 12, K: 6)
            for combinationIndex in 0..<combinatons.count {
                
                let combination = combinatons[combinationIndex]
                XCTAssert(combination.count == combinatons.K)
                combination.forEach {
                    
                    XCTAssert($0 < combinatons.N)
                }
                XCTAssert(combination.sorted() == combination)
                XCTAssert(Set(combination).sorted() == combination)
            }
        }
    }
}
