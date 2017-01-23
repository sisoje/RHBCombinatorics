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
    let extraballCount = 26
    var labels:Array<UILabel>?
    
    func randomize() {
        
        let random = arc4random_uniform(UInt32(self.powerball.count))
        let combination = self.powerball[Int(random)]
        labels?.prefix(powerball.K).enumerated().forEach {
            
            $1.text = String(combination[$0] + 1)
        }
        labels?.last?.text = String(arc4random_uniform(UInt32(self.extraballCount))+1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let viewframe = self.view.frame
        var size = viewframe.size
        let spacing = size.height/150
        size.width /= CGFloat(self.powerball.K+1)
        size.height = size.width
        
        let h = (viewframe.size.height - size.height) / 2
        
        self.labels = (0...self.powerball.K).map {
            
            let point = CGPoint(x: CGFloat($0)*size.width, y: h)
            let frame = CGRect(origin: point, size: size).insetBy(dx: spacing, dy: spacing)
            let label = UILabel(frame: frame)
            label.textAlignment = NSTextAlignment.center
            label.clipsToBounds = true
            label.layer.cornerRadius = frame.width/2
            label.layer.borderWidth = spacing
            label.layer.borderColor = UIColor.darkGray.cgColor
            return label
        }
        
        self.labels?.prefix(self.powerball.K).forEach {
            
            $0.backgroundColor = UIColor.white
            $0.tintColor = UIColor.black
        }
        self.labels?.last?.backgroundColor = UIColor.red
        self.labels?.last?.tintColor = UIColor.white
        
        self.labels?.forEach {
            
            self.view.addSubview($0)
        }

        var rrect = CGRect(x: 0, y: h, width: viewframe.size.width, height: size.height)
        rrect.origin.y += size.height
        rrect = rrect.insetBy(dx: spacing, dy: spacing)
        
        let button = UIButton(frame: rrect)
        button.backgroundColor = UIColor.darkGray
        button.setTitle("PLAY", for: UIControlState.normal)
        button.setTitleColor(UIColor.red, for: UIControlState.highlighted)
        button.addTarget(self, action: #selector(self.randomize), for: UIControlEvents.touchUpInside)
        button.layer.cornerRadius = spacing
        self.view.addSubview(button)
        
        self.randomize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

