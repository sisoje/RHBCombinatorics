//
//  ViewController.swift
//  RHBCombinatorics
//
//  Created by Lazar Otasevic on 08/13/2016.
//  Copyright (c) 2016 Lazar Otasevic. All rights reserved.
//

import UIKit
import RHBCombinatorics

class ViewController: UIViewController {

    let powerball = RHBCombinations(N: 69, K: 5)
    var buttons:Array<UIButton>?
    
    func randomize() {
        
        let random = arc4random_uniform(UInt32(self.powerball.count))
        let combo = self.powerball[Int(random)]
        (0..<powerball.K).forEach {
            
            let num = String(combo[$0] + 1)
            let button = self.buttons?[$0]
            button?.setTitle(num, for: UIControlState.normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let viewframe = self.view.frame
        var size = viewframe.size
        size.width /= CGFloat(self.powerball.K)
        size.height = size.width
        
        let h = (viewframe.size.height - size.height) / 2
        
        self.buttons = (0..<self.powerball.K).map {
            
            let point = CGPoint(x: CGFloat($0)*size.width, y: h)
            let frame = CGRect(origin: point, size: size).insetBy(dx: 5, dy: 5)
            let button = UIButton(frame: frame)
            button.backgroundColor = UIColor.red
            button.tintColor = UIColor.yellow
            button.layer.cornerRadius = size.width/2.25
            return button
        }
        
        self.buttons?.forEach {
            
            self.view.addSubview($0)
        }

        var rrect = CGRect(x: 0, y: h, width: viewframe.size.width, height: size.height)
        rrect.origin.y += size.height
        rrect = rrect.insetBy(dx: 5, dy: 5)
        
        let button = UIButton(frame: rrect)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("GENERATE POWERBALL", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        button.addTarget(self, action: #selector(self.randomize), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
        
        self.randomize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

