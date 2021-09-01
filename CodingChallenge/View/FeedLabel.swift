//
//  FeedLabel.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 27/08/21.
//

import UIKit

class FeedLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        self.font = UIFont.systemFont(ofSize: CGFloat(Constant.kSytemFont))
        self.textColor =  .black
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
