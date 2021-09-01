//
//  FeedImageView.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 27/08/21.
//

import UIKit

class FeedImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        self.clipsToBounds = true
    }
    
    func setImage(imageName: String) {
        self.image = UIImage.init(named: imageName)
    }
}
