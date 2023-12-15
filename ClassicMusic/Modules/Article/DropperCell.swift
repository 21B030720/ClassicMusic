//
//  DropperCell.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 12.12.2023.
//

import UIKit

class DropperCell: UITableViewCell {
    
    let label: UILabel = UILabel()
    var isOpened: Bool = false
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.numberOfLines = 0
        label.backgroundColor = #colorLiteral(red: 0.8948080319, green: 0.8633477257, blue: 1, alpha: 1)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
