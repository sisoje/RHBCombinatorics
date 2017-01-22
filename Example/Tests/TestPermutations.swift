//
//  TestPermutations.swift
//  RHBCombinatorics
//
//  Created by Lazar Otasevic on 1/21/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import XCTest
import RHBCombinatorics

class TestPermutations: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        
        RHBPermutations(N: 3).enumerated().forEach { print($0, $1) }
    }
    
    func testPermutations() {
        
        XCTAssert(RHBPermutations(N:1).elementsEqual([[0]], by: ==))
        XCTAssert(RHBPermutations(N:2).elementsEqual([[0,1],[1,0]], by: ==))
        XCTAssert(RHBPermutations(N:3).elementsEqual([[0,1,2],[0,2,1],[1,0,2],[1,2,0],[2,0,1],[2,1,0]], by: ==))
    }

    func testPermutationIterationValidity() {
        
        (1...6).forEach {
            
            let perm = RHBPermutations(N: $0)
            var i=0
            perm.forEach {
                
                XCTAssert($0.count == perm.N)
                XCTAssert(Set($0).count == perm.N)
                i += 1
            }
            XCTAssert(i == perm.count)
        }
    }
    
    func testPermutationPerformance() {
        
        let perm = RHBPermutations(N:7)
        self.measure {
            
            perm.forEach {
                
                XCTAssert($0.count == perm.N)
            }
        }
    }
    
}
