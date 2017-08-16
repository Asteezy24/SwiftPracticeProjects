//
//  ViewController.swift
//  MagicGrid
//
//  Created by Alexander Stevens on 8/15/17.
//  Copyright © 2017 Alex Stevens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let numOfCellsWidth = 10
    var cells = [String: UIView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let width = view.frame.width / CGFloat(numOfCellsWidth)
        
        for j in 0...30 {
            
            for i in 0...numOfCellsWidth {
                
                let randCell = UIView(frame: CGRect(x: CGFloat(i) * width, y: CGFloat(j) * width, width: width, height: width))
                randCell.backgroundColor = randColor()
                randCell.layer.borderWidth = 0.5
                randCell.layer.borderColor = UIColor.black.cgColor
                view.addSubview(randCell)
                
                let key = "\(i)|\(j)"
                cells[key] = randCell
                
                
            }
            
        }
        
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handlePan)))
        
    }
    
    var selectedView: UIView? = nil
    
    func handlePan(gesture: UIGestureRecognizer){
        let location = gesture.location(in: view)
        let width = view.frame.width / CGFloat(numOfCellsWidth)
        
        let i = Int(location.x / width)
        let j = Int(location.y / width)
        print(i,j)
        
        let key = "\(i)|\(j)"
        
        guard let cellview = cells[key] else{return}
        
        if selectedView != cellview{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.selectedView?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        selectedView = cellview
        
        view.bringSubview(toFront: cellview)
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            
            cellview.layer.transform = CATransform3DMakeScale(3, 3, 3)
            
        }, completion: nil)
        
        if gesture.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: { 
                cellview.layer.transform = CATransform3DIdentity
            }, completion: { (_) in })
        }
        
        
    }
    
    fileprivate func randColor() -> UIColor{
        
        let randRed = Float(drand48())
        let randGreen = Float(drand48())
        let randBlue = Float(drand48())
        
        return UIColor(colorLiteralRed: randRed, green: randGreen, blue: randBlue, alpha: 1)
        
    }
    
}

