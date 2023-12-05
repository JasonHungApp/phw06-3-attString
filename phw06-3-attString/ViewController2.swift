//
//  ViewController2.swift
//  phw06-3-attString
//
//  Created by jasonhung on 2023/12/4.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var bunnyLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let imageContent = NSTextAttachment()
        imageContent.image = UIImage(named: "珍珠奶茶")
        imageContent.bounds = CGRect(x: 0, y: -8, width: 48, height: 48)
        
        let bunnyText = NSMutableAttributedString()
        bunnyText.append(NSMutableAttributedString(string: "(\\_/)\n"))
        bunnyText.append(NSMutableAttributedString(string: "(  •_•)\n"))
        bunnyText.append(NSMutableAttributedString(string: "/>"))
        bunnyText.append(NSMutableAttributedString(attachment: imageContent))
        bunnyText.append(NSMutableAttributedString(string: ">"))

        //字串內容
        bunnyLabel.attributedText = bunnyText
        //字體大小及排版
        bunnyLabel.font = UIFont.systemFont(ofSize: 48)
        bunnyLabel.textAlignment = .center
    }
}
