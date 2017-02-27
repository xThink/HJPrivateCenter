//
//  HJNewsTableViewCell.swift
//  HJPrivateCenter
//
//  Created by HeJun<mail@hejun.org> on 27/02/2017.
//  Copyright © 2017 HeJun. All rights reserved.
//

import UIKit
import SnapKit

class HJNewsTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let nameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30))
		nameLabel.text = "\(arc4random())"
		
		self.contentView.addSubview(nameLabel)
		nameLabel.snp.makeConstraints { (make) -> Void in
			make.size.equalToSuperview()
			make.left.top.equalToSuperview()
		}
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
