//
//  Bunny.swift
//  Bunny
//
//  Created by jasonhung on 2023/12/4.
//


import Foundation
import UIKit

struct BunnySymbol {
    let ear : NSMutableAttributedString = NSMutableAttributedString("(\\_/)\n")
    let face : NSMutableAttributedString = NSMutableAttributedString("(  •_•)\n")
    let actionleft : NSMutableAttributedString = NSMutableAttributedString("/>")
    var emojiContent : NSMutableAttributedString
    let actionRight : NSMutableAttributedString = NSMutableAttributedString(">\n\n")

    func makeBunny() -> NSMutableAttributedString {
        var bunnyText = NSMutableAttributedString()
        bunnyText.append(ear)
        bunnyText.append(face)
        bunnyText.append(actionleft)
        bunnyText.append(emojiContent)
        bunnyText.append(actionRight)
        
        return bunnyText
    }
}

struct BunnyImage {
    let ear : NSMutableAttributedString = NSMutableAttributedString(string: "(\\_/)\n")
    let face : NSMutableAttributedString = NSMutableAttributedString(string: "(  •_•)\n")
    let actionleft : NSMutableAttributedString = NSMutableAttributedString(string: "/>")
    var imageContent : NSTextAttachment
    let actionRight : NSMutableAttributedString = NSMutableAttributedString(string: ">\n\n")

    func makeBunny() -> NSMutableAttributedString {
        let bunnyText = NSMutableAttributedString()
        bunnyText.append(ear)
        bunnyText.append(face)
        bunnyText.append(actionleft)
        bunnyText.append(NSMutableAttributedString(attachment: imageContent))
        bunnyText.append(actionRight)
        
        return bunnyText
    }
}

//兔兔說：我最喜歡台灣的三個東西：第1個是❤️，第2個是❤️，第3個是❤️。
struct BunnyLoveImage {
    
    var imageSize = 26.0
    var imageLocation = -4.0
    
    let BunnySay : NSMutableAttributedString = NSMutableAttributedString(string: "兔兔說：我最喜歡台灣的三個東西：")
    let love1 : NSMutableAttributedString = NSMutableAttributedString(string: "第1個是")
    var love1ImageContent : NSTextAttachment
    let love2 : NSMutableAttributedString = NSMutableAttributedString(string: "，第2個是")
    var love2ImageContent : NSTextAttachment
    let love3 : NSMutableAttributedString = NSMutableAttributedString(string: "，第3個是")
    var love3ImageContent : NSTextAttachment
    let end : NSMutableAttributedString = NSMutableAttributedString(string: "。")

    func makeBunny() -> NSMutableAttributedString {
        
        let bunnyText = NSMutableAttributedString()
        bunnyText.append(BunnySay)
        bunnyText.append(love1)
        love1ImageContent.bounds = CGRect(x: 0, y: imageLocation, width: imageSize, height: imageSize)
        bunnyText.append(NSMutableAttributedString(attachment: love1ImageContent))
        bunnyText.append(love2)
        love2ImageContent.bounds = CGRect(x: 0, y: imageLocation, width: imageSize, height: imageSize)
        bunnyText.append(NSMutableAttributedString(attachment: love2ImageContent))
        bunnyText.append(love3)
        love3ImageContent.bounds = CGRect(x: 0, y: imageLocation, width: imageSize, height: imageSize)
        bunnyText.append(NSMutableAttributedString(attachment: love3ImageContent))
        bunnyText.append(end)

        return bunnyText
    }
}


  
