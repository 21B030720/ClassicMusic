//
//  CreatorCell.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 17.12.2023.
//

import UIKit

class CreatorCell: UITableViewCell, UITextViewDelegate {
    
    lazy var titleText: UITextView = UITextView()
    lazy var contentText: UITextView = UITextView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI() {
        contentView.addSubview(titleText)
        titleText.backgroundColor = #colorLiteral(red: 0.9659504294, green: 0.9420133829, blue: 0.7663749456, alpha: 0.8470588235)
        titleText.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
            
        }
        contentView.addSubview(contentText)
        contentText.backgroundColor = #colorLiteral(red: 0.9661505818, green: 0.9471688867, blue: 0.9467640519, alpha: 0.8470588235)
        contentText.snp.makeConstraints { make in
            make.top.equalTo(titleText.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been emplemented")
    }
}
