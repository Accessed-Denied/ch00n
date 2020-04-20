//
//  CustomTabBarView.swift
//  UrbanKiddie
//
//  Created by Rohit Saini on 10/08/18.
//  Copyright © 2018 Appknit. All rights reserved.
//

import UIKit
//MARK:- Custom Delegate Method for Selecting Tab Bar Button
protocol CustomTabBarViewDelegate
{
    func tabSelectedAtIndex(index:Int)
}

class CustomTabBarView: UIView {
    
    @IBOutlet weak var Btn1: UIButton!
    @IBOutlet weak var Btn2: UIButton!
    @IBOutlet weak var Btn3: UIButton!
    @IBOutlet weak var Btn4: UIButton!
 //   @IBOutlet weak var Btn5: UIButton!
    
    @IBOutlet weak var Lbl1: UILabel!
    @IBOutlet weak var Lbl2: UILabel!
    @IBOutlet weak var Lbl3: UILabel!
    @IBOutlet weak var Lbl4: UILabel!
  //  @IBOutlet weak var Lbl5: UILabel!
    
    var lastIndex : NSInteger!
    var delegate:CustomTabBarViewDelegate? // delegate variable
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    convenience init(frame: CGRect, title: String) {
        self.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func initialize()
    {
        lastIndex = 0
    }
    
    
    @IBAction func tabBtnClicked(_ sender: Any)
      {
        let btn: UIButton? = (sender as? UIButton)
        lastIndex = (btn?.tag)!-1

          resetAllButton()
          selectTabButton()
        
      }
    
    //MARK:- Reset All Button
    func resetAllButton()
    {
        Btn1.isSelected = false
        Btn2.isSelected = false
        Btn3.isSelected = false
        Btn4.isSelected = false
        
        
        
        Lbl1.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        Lbl2.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        Lbl3.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        Lbl4.textColor = #colorLiteral(red: 0.5960784314, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
    }
    
    
    //MARK:- Select Tab Button
    func selectTabButton()
    {
        switch lastIndex {
        case 0:
            Btn1.isSelected = true
            Lbl1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           
            break
        case 1:
            Btn2.isSelected = true
            Lbl2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
           
            break
        case 2:
            Btn3.isSelected = true
            Lbl3.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        case 3:
            Btn4.isSelected = true
            Lbl4.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        default:
            break
            
        }
        delegate?.tabSelectedAtIndex(index: lastIndex)//Delegate Method
    }
    
    //MARK:- Select Tab Button
    func selectNotificatoinTabButton(index: Int)
    {
        switch index {
        case 0:
            Btn1.isSelected = true
            Lbl1.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        case 1:
            Btn2.isSelected = true
            Lbl2.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        case 2:
            Btn3.isSelected = true
            Lbl3.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        case 3:
            Btn4.isSelected = true
            Lbl4.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            
            break
        
        default:
            break
            
        }
        delegate?.tabSelectedAtIndex(index: index)//Delegate Method
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
