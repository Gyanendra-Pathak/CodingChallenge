//
//  TableViewCell.swift
//  CodingChallenge
//
//  Created by Gyanendra Kumar Pathak on 19/08/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    var heightThumbnail:Int!
    var widthThumbnail:Int!

    let imageViewAuthor:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        return imageView
    }()
    
    
    let labelTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(Constant.kSytemFont))
        label.textColor =  .black
        label.clipsToBounds = true
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = Constant.kMultipleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageViewScore:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "Score")
        return imageView
    }()
    
    
    let labelScore:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(Constant.kSytemFont))
        label.textColor =  .darkGray
        label.clipsToBounds = true
        label.numberOfLines = Constant.kSingleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let imageViewComment:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        imageView.clipsToBounds = true
        imageView.image = UIImage.init(named: "Comment")
        return imageView
    }()
    
    
    let labelComment:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: CGFloat(Constant.kSytemFont))
        label.textColor =  .darkGray
        label.clipsToBounds = true
        label.numberOfLines = Constant.kSingleLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    let viewBorder:UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(labelTitle)
        self.contentView.addSubview(imageViewAuthor)
        self.contentView.addSubview(imageViewScore)
        self.contentView.addSubview(labelScore)
        self.contentView.addSubview(imageViewComment)
        self.contentView.addSubview(labelComment)
        self.contentView.addSubview(viewBorder)
        self.setConstraint()
    }
    
    func setConstraint(){
        labelTitle.topAnchor.constraint(equalTo:self.contentView.topAnchor, constant:CGFloat(Constant.kSingleLine)).isActive = true
        labelTitle.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelTitle.bottomAnchor.constraint(equalTo:imageViewAuthor.topAnchor, constant:-CGFloat(Constant.kVerticalSpacing)).isActive = true
        
        imageViewAuthor.topAnchor.constraint(equalTo:labelTitle.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewAuthor.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        imageViewAuthor.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        imageViewAuthor.bottomAnchor.constraint(equalTo:imageViewScore.topAnchor, constant:-CGFloat(Constant.kVerticalSpacing)).isActive = true
        
        imageViewScore.topAnchor.constraint(equalTo:imageViewAuthor.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewScore.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        imageViewScore.trailingAnchor.constraint(equalTo:self.labelScore.leadingAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewScore.bottomAnchor.constraint(lessThanOrEqualTo:self.viewBorder.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        imageViewScore.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageViewScore.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        labelScore.topAnchor.constraint(equalTo:self.imageViewAuthor.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelScore.leadingAnchor.constraint(equalTo:self.imageViewScore.trailingAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        //labelScore.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(250)).isActive = true
        labelScore.bottomAnchor.constraint(lessThanOrEqualTo:self.viewBorder.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelScore.widthAnchor.constraint(equalToConstant: 80.0).isActive = true
        labelScore.heightAnchor.constraint(equalToConstant: 20.0).isActive = true

        imageViewComment.topAnchor.constraint(equalTo:imageViewAuthor.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        //imageViewComment.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(Constant.kFixPadding)).isActive = true
        imageViewComment.trailingAnchor.constraint(equalTo:labelComment.leadingAnchor, constant:-CGFloat(Constant.kVerticalSpacing)).isActive = true
        imageViewComment.bottomAnchor.constraint(lessThanOrEqualTo:self.viewBorder.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        imageViewComment.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
        imageViewComment.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        labelComment.topAnchor.constraint(equalTo:self.imageViewAuthor.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelComment.leadingAnchor.constraint(equalTo:self.imageViewComment.trailingAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        labelComment.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelComment.bottomAnchor.constraint(lessThanOrEqualTo:self.viewBorder.bottomAnchor, constant:-CGFloat(Constant.kFixPadding)).isActive = true
        labelComment.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
        labelComment.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        
        viewBorder.topAnchor.constraint(equalTo:self.labelComment.bottomAnchor, constant:CGFloat(Constant.kVerticalSpacing)).isActive = true
        viewBorder.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:CGFloat(0.0)).isActive = true
        viewBorder.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:CGFloat(0.0)).isActive = true
        viewBorder.bottomAnchor.constraint(lessThanOrEqualTo:self.contentView.bottomAnchor, constant:CGFloat(0.0)).isActive = true
        viewBorder.heightAnchor.constraint(equalToConstant: 10.0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }

}
