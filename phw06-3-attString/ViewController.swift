//
//  ViewController.swift
//  phw06-3-attString
//
//  Created by jasonhung on 2023/12/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bunnyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var bunnyText = AttributedString()
        bunnyText += "(\\_/)\n"
        bunnyText += "(  •_•)\n"
        bunnyText += "/>❤️>"
        
        //字串內容
        bunnyLabel.attributedText = NSAttributedString(bunnyText)
        //字體大小及排版
        bunnyLabel.font = UIFont.systemFont(ofSize: 48)
        bunnyLabel.textAlignment = .center
    }
}

