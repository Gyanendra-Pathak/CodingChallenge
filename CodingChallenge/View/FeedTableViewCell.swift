//
//  TableViewCell.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import UIKit
import SDWebImage

class FeedTableViewCell: UITableViewCell {
    let imageViewFeed = FeedImageView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let labelTitle = FeedLabel.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let imageViewScore = FeedImageView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let labelScore = FeedLabel.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let imageViewComment = FeedImageView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let labelComment = FeedLabel.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    let viewBorder = BorderView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    let noImage = UIImage(named: Constant.kNoImage)
    
    internal var aspectConstraint : NSLayoutConstraint? {
        didSet {
            if oldValue != nil {
                imageViewFeed.removeConstraint(oldValue!)
            }
            if aspectConstraint != nil {
                imageViewFeed.addConstraint(aspectConstraint!)
            }
        }
    }
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        aspectConstraint = nil
    }
    
    func setCustomImage(childData: ChildData) {
        var aspect:Double!
        if childData.thumbnailWidth! == 1 && childData.thumbnailHeight! == 1 {
            aspect = Double((noImage?.size.width)!) / Double((noImage?.size.height)!)
        }
        else {
            aspect = Double(childData.thumbnailWidth!) / Double(childData.thumbnailHeight!)
        }
        
        let constraint = NSLayoutConstraint(item: imageViewFeed, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: imageViewFeed, attribute: NSLayoutConstraint.Attribute.height, multiplier: CGFloat(aspect), constant: 0.0)
        constraint.priority = UILayoutPriority(rawValue: 999)
        aspectConstraint = constraint
    }
    
    func configureCell(childData: ChildData) {
        self.setCustomImage(childData: childData)
        if let url : String = childData.thumbnail {
            print("thumbnail =\(url)")
            let fileUrl : NSURL = NSURL(string: url as String)!
            self.imageViewFeed.sd_setImage(with: fileUrl as URL, placeholderImage: noImage, options: SDWebImageOptions(rawValue: 1), completed: nil)
        }
        else{
            self.imageViewFeed.image = noImage
        }
        
        if let title = childData.title {
            self.labelTitle.text = title
        }else{
            self.labelTitle.text = Constant.kNoTitle
        }
        
        if let score = childData.score {
            self.labelScore.text = "\(self.suffixNumber(number: score))"
        }
        if let commentCount = childData.numComments {
            self.labelComment.text = "\(self.suffixNumber(number: commentCount))"
        }
    }
    
    func suffixNumber(number: Int) -> String {
        var num:Double = Double(number)
        let sign = ((num < 0) ? "-" : "" )
        num = fabs(num)
        if (num < 1000.0){
            return "\(sign)\(num)"
        }
        let exp:Int = Int(log10(num) / 3.0 ) //log10(1000))
        let units:[String] = ["K", "M", "G", "T", "P", "E"]
        let roundedNum:Double = round(10 * num / pow(1000.0,Double(exp))) / 10
        return "\(sign)\(roundedNum)\(units[exp-1])"
    }
    
    func addSubViews() {
        self.contentView.addSubview(labelTitle)
        self.contentView.addSubview(imageViewFeed)
        self.contentView.addSubview(imageViewScore)
        self.contentView.addSubview(labelScore)
        self.contentView.addSubview(imageViewComment)
        self.contentView.addSubview(labelComment)
        self.contentView.addSubview(viewBorder)
    }
    
    func setConstraints() {
        setTitleLabelContraints()
        setimageViewFeedConstraints()
        setScoreConstraints()
        setCommentConstraints()
        setViewBorderConstraints()
    }
    
    func setTitleLabelContraints() {
        labelTitle.numberOfLines = Constant.kMultipleLine
        labelTitle.lineBreakMode = .byWordWrapping
        
        labelTitle.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: CGFloat(Constant.kSingleLine)).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo: imageViewFeed.topAnchor, constant: -CGFloat(Constant.kVerticalSpacing)).isActive = true
    }
    
    func setimageViewFeedConstraints() {
        imageViewFeed.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewFeed.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(Constant.kFixPadding)).isActive = true
        imageViewFeed.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        imageViewFeed.bottomAnchor.constraint(equalTo: imageViewScore.topAnchor, constant: -CGFloat(Constant.kVerticalSpacing)).isActive = true
    }
    
    func setScoreConstraints() {
        imageViewScore.setImage(imageName: "Score")
        imageViewScore.topAnchor.constraint(equalTo: imageViewFeed.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewScore.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(Constant.kFixPadding)).isActive = true
        imageViewScore.bottomAnchor.constraint(lessThanOrEqualTo: self.viewBorder.bottomAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        imageViewScore.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageViewScore.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        
        labelScore.topAnchor.constraint(equalTo: self.imageViewFeed.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelScore.leadingAnchor.constraint(equalTo: self.imageViewScore.trailingAnchor, constant: CGFloat(0.0)).isActive = true
        labelScore.bottomAnchor.constraint(lessThanOrEqualTo: self.viewBorder.bottomAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        labelScore.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        labelScore.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    func setCommentConstraints() {
        imageViewComment.setImage(imageName: "Comment")
        imageViewComment.topAnchor.constraint(equalTo: imageViewFeed.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewComment.trailingAnchor.constraint(equalTo: labelComment.leadingAnchor, constant: -CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewComment.bottomAnchor.constraint(lessThanOrEqualTo: self.viewBorder.bottomAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        imageViewComment.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageViewComment.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        labelComment.topAnchor.constraint(equalTo: self.imageViewFeed.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelComment.leadingAnchor.constraint(equalTo: self.imageViewComment.trailingAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelComment.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        labelComment.bottomAnchor.constraint(lessThanOrEqualTo: self.viewBorder.bottomAnchor, constant: -CGFloat(Constant.kFixPadding)).isActive = true
        labelComment.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        labelComment.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
    }
    
    func setViewBorderConstraints() {
        viewBorder.topAnchor.constraint(equalTo: self.labelComment.bottomAnchor, constant: CGFloat(Constant.kVerticalSpacing)).isActive = true
        viewBorder.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: CGFloat(0.0)).isActive = true
        viewBorder.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: CGFloat(0.0)).isActive = true
        viewBorder.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: CGFloat(0.0)).isActive = true
        viewBorder.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
    }
}
