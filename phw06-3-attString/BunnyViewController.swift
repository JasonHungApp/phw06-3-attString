//
//  bunnyViewController.swift
//  phw06-3-attString
//
//  Created by jasonhung on 2023/12/4.
//

import UIKit

class BunnyViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var emojiTextField: UITextField!
    @IBOutlet weak var bunnyLabel: UILabel!
    @IBOutlet weak var locationSegmentedControl: UISegmentedControl!
    
    var emojiSize = 26.0
    var emojiLocation = 0.0

    var imageSize = 26.0
    var imageLocation = -4.0
    
    var bunnySymbol = BunnySymbol(emojiContent: NSMutableAttributedString(string: "❤️"))
    var bunnyImage = BunnyImage(imageContent: NSTextAttachment(image: UIImage(named: "愛心")!))
    var bunnyLoveImage = BunnyLoveImage(love1ImageContent: NSTextAttachment(image: UIImage(named: "珍珠奶茶")!), love2ImageContent: NSTextAttachment(image: UIImage(named: "芒果冰")!), love3ImageContent: NSTextAttachment(image: UIImage(named: "大同電鍋")!))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        backgroundView.layer.cornerRadius = 20
        
        //兔兔label
        bunnyLabel.backgroundColor = UIColor.systemGray5
        bunnyLabel.layer.cornerRadius = 20
        bunnyLabel.clipsToBounds = true
        bunnyLabel.numberOfLines = 0
        bunnyLabel.font = UIFont.systemFont(ofSize: 26)
        bunnyLabel.textAlignment = .center
        
        margeBunny()
        
    }
    
    func margeBunny(){
        let bunnySay : NSMutableAttributedString = bunnySymbol.makeBunny()
        let bunnySay2 : NSMutableAttributedString = bunnyLoveImage.makeBunny()
        bunnySay.append(bunnySay2)
        bunnyLabel.attributedText = bunnySay
    }
     
    @IBAction func emojiInputEditChanged(_ sender: UITextField) {
        if emojiTextField.attributedText != NSAttributedString("") {
            let fontSize: CGFloat = emojiSize
            bunnySymbol.emojiContent = NSMutableAttributedString(attributedString: emojiTextField.attributedText!)
            
            if let length = emojiTextField.attributedText?.length {
                bunnySymbol.emojiContent.addAttributes([.font: UIFont.systemFont(ofSize: fontSize)], range: NSRange(location: 0, length: length))
            }
            view.endEditing(true)

        } else {
            bunnySymbol.emojiContent = NSMutableAttributedString(string: "❤️")
        }

        updateBunny()
    }
    @IBAction func emojiImputTouchDown(_ sender: UITextField) {
        view.endEditing(true)

    }
    

    @IBAction func ImageButton(_ sender: UIButton) {
        view.endEditing(true)

        if let titleLabel = sender.titleLabel?.text {
            print(titleLabel)
            //var bunnySymbol = BunnyImage(imageContent: NSTextAttachment(image: UIImage(named: titleLabel)!))
            updateBunny(imageName:titleLabel)
        }
    }
    
    fileprivate func updateBunny() {
        margeBunny()
    }
    
    fileprivate func updateBunny(imageName: String) {
        bunnyLabel.text = ""
        
        switch locationSegmentedControl.selectedSegmentIndex {
        case 0: bunnyLoveImage.love1ImageContent.image = UIImage(named: imageName)
        case 1: bunnyLoveImage.love2ImageContent.image = UIImage(named: imageName)
        case 2: bunnyLoveImage.love3ImageContent.image = UIImage(named: imageName)
        default: break
        }
        
        margeBunny()
    }
    
    
    @IBAction func convertToImageButtonTapped(_ sender: UIButton) {
        if let image = convertLabelToImage() {
            // 在這裡，你可以使用 image，例如顯示在一個 UIImageView 中，或者保存到相冊中
            // 這邊僅簡單地在控制台中印出 image
            print("Converted Image:", image)
            
            shareImageUsingSystemShareSheet(image: image)
        }
    }
    
    func convertLabelToImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bunnyLabel.bounds.size, false, 0.0)
        defer {
            UIGraphicsEndImageContext()
        }

        if let context = UIGraphicsGetCurrentContext() {
            bunnyLabel.layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext()
        }

        return nil
    }

    func shareImageUsingSystemShareSheet(image: UIImage) {
            let shareItems: [Any] = [image]

            let activityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)

            // 排除一些不需要的分享選項
            activityViewController.excludedActivityTypes = [
                .addToReadingList,
                .assignToContact,
                .openInIBooks,
                .postToFacebook,
                .postToFlickr,
                .postToVimeo,
                .postToWeibo,
                .postToTwitter,
                .print,
                .saveToCameraRoll
            ]

            // 在 iPad 上，我們需要設置 popoverPresentationController
            if let popoverController = activityViewController.popoverPresentationController {
                popoverController.sourceView = self.view
                popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverController.permittedArrowDirections = []
            }

            // 顯示分享視窗
            present(activityViewController, animated: true, completion: nil)
        }

}
