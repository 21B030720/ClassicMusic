//
//  DropDownCell.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 12.12.2023.
//

import UIKit

class DropDownCell: UITableViewCell {

    let label: BeautifulLabel = BeautifulLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        label.numberOfLines = 0
        label.backgroundColor = .clear
        label.layer.cornerRadius = 3
        label.layer.masksToBounds = true
        label.textAlignment = .center
        label.paddingTop = 10
        label.paddingLeft = 10
        label.paddingRight = 10
        label.paddingBottom = 10
        addSubview(label)
        label.snp.makeConstraints { make in
            make.top.right.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
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


@IBDesignable
class BeautifulLabel: UILabel {
    var textEdgeInsets = UIEdgeInsets.zero {
            didSet { invalidateIntrinsicContentSize() }
        }

        open override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
            let insetRect = bounds.inset(by: textEdgeInsets)
            let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
            let invertedInsets = UIEdgeInsets(
                                    top: -textEdgeInsets.top,
                                    left: -textEdgeInsets.left,
                                    bottom: -textEdgeInsets.bottom,
                                    right: -textEdgeInsets.right
                                )
            return textRect.inset(by: invertedInsets)
        }

        override func drawText(in rect: CGRect) {
            super.drawText(in: rect.inset(by: textEdgeInsets))
        }

        @IBInspectable
        var paddingLeft: CGFloat {
            set { textEdgeInsets.left = newValue }
            get { return textEdgeInsets.left }
        }

        @IBInspectable
        var paddingRight: CGFloat {
            set { textEdgeInsets.right = newValue }
            get { return textEdgeInsets.right }
        }

        @IBInspectable
        var paddingTop: CGFloat {
            set { textEdgeInsets.top = newValue }
            get { return textEdgeInsets.top }
        }

        @IBInspectable
        var paddingBottom: CGFloat {
            set { textEdgeInsets.bottom = newValue }
            get { return textEdgeInsets.bottom }
        }
}

