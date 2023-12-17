//
//  TrackCell.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 15.12.2023.
//

import UIKit

class TrackCell: UITableViewCell {
    lazy var image: UIImageView = UIImageView()
    lazy var name: UILabel = UILabel()
    lazy var author: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        image.image = UIImage(named: "Beethoven.jpg")
        name.text = "Beethoven"
        author.text = "Beethoven2"
        setupUI()
    }
    
    func setupUI() {
        self.addShadow(to: [.top, .bottom, .left, .right], radius: 1.0, width: UIScreen.main.bounds.width, height: 70)
        addSubview(image)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        image.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.width.equalTo(50)
        }
        addSubview(name)
        name.backgroundColor = .clear
        name.font = name.font.withSize(20)
        name.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        addSubview(author)
        author.backgroundColor = .clear
        author.font = author.font.withSize(12)
        author.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-15)
            make.leading.equalTo(image.snp.trailing).offset(20)
            make.width.equalToSuperview()
            make.height.equalTo(20)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
