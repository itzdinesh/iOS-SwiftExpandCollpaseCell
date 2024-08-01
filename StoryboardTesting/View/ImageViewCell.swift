//
//  ImageViewCell.swift
//  StoryboardTesting
//
//  Created by Cynotecck on 17/04/24.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageBgView: UIView!
    override func awakeFromNib() {
            super.awakeFromNib()
            
        lbl.numberOfLines = 0
//            imageBgView.layer.cornerRadius = 8
            imageBgView.layer.masksToBounds = false
//        imageBgView.layer.shadowColor = UIColor.black.cgColor
//               imageBgView.layer.shadowOpacity = 0.3
//               imageBgView.layer.shadowOffset = CGSize(width: 0, height: 2)
//               imageBgView.layer.shadowRadius = 4
//               imageBgView.layer.shouldRasterize = true
//               imageBgView.layer.rasterizationScale = UIScreen.main.scale
//        
        }
    
}
