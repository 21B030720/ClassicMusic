//
//  CreatorView.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 17.12.2023.
//

import UIKit

class CreatorView: UIView {
    lazy var originalHeightOfTextView = 50
    lazy var nameTextView: UITextView! = {
        let content = UITextView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.sizeToFit()
        content.backgroundColor = #colorLiteral(red: 0.5955511533, green: 0.9481025338, blue: 0.8467716451, alpha: 1)
        content.layer.cornerRadius = 5
        content.layer.shadowColor = #colorLiteral(red: 0.3089223697, green: 0.325166965, blue: 0.9481025338, alpha: 1)
        content.layer.shadowPath = UIBezierPath(rect: content.bounds).cgPath
        content.layer.shouldRasterize = true
        content.layer.shadowOpacity = 0.7
        content.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        content.layer.shadowRadius = 10
        content.textContainer.maximumNumberOfLines = 0
        content.font = .systemFont(ofSize: 30)
        return content
    }()
    lazy var imageTextView: UITextView! = {
        let content = UITextView()
        content.translatesAutoresizingMaskIntoConstraints = false
        content.sizeToFit()
        content.backgroundColor = #colorLiteral(red: 0.5955511533, green: 0.9481025338, blue: 0.8467716451, alpha: 1)
        content.layer.cornerRadius = 5
        content.layer.shadowColor = #colorLiteral(red: 0.3089223697, green: 0.325166965, blue: 0.9481025338, alpha: 1)
        content.layer.shadowPath = UIBezierPath(rect: content.bounds).cgPath
        content.layer.shouldRasterize = true
        content.layer.shadowOpacity = 0.7
        content.layer.shadowOffset = CGSize(width: 20.0, height: 20.0)
        content.layer.shadowRadius = 10
        content.textContainer.maximumNumberOfLines = 0
        content.font = .systemFont(ofSize: 30)
        return content
    }()
    lazy var textField: UITextField = UITextField()
    let uploadButton: UIButton = {
        let content = UIButton()
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "arrow.up.circle", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.backgroundColor = .clear
        return content
    }()
    let addButton: UIButton = {
        let content = UIButton()
        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 32, weight: .medium, scale: .default)
        let colorConfig = UIImage.SymbolConfiguration(paletteColors: [#colorLiteral(red: 0.2036997477, green: 0.03813213533, blue: 0.1600830025, alpha: 1)])
        content.setImage(UIImage(systemName: "plus.app", withConfiguration: colorConfig.applying(sizeConfig)), for: .normal)
        content.backgroundColor = .clear
        content.addTarget(self, action: #selector(addCell), for: .touchUpInside)
        return content
    }()
    
    lazy var imageView: UIImageView = UIImageView()
    lazy var table: UITableView = UITableView()
    
    weak var viewController: CreatorVC!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.983993113, green: 0.8692041636, blue: 0.8665704131, alpha: 1)
//        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.983993113, green: 0.8692041636, blue: 0.8665704131, alpha: 1)
//        UINavigationBar.appearance().tintColor = #colorLiteral(red: 0.983993113, green: 0.8692041636, blue: 0.8665704131, alpha: 1)
//        UINavigationBar.appearance().backgroundColor = #colorLiteral(red: 0.983993113, green: 0.8692041636, blue: 0.8665704131, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        let screenHeight = UIScreen.main.bounds.height
        let window = UIApplication.shared.keyWindow
        let topPadding = window?.safeAreaInsets.top
        let bottomPadding = window?.safeAreaInsets.bottom
        
        addSubview(nameTextView)
        nameTextView.smartInsertDeleteType = .no
        nameTextView.autocapitalizationType = .none
        nameTextView.allowsEditingTextAttributes = true
        nameTextView.isEditable = true
        nameTextView.delegate = viewController.self
        nameTextView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset((topPadding ?? 0) + 100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(originalHeightOfTextView)
        }
        
        addSubview(imageTextView)
        imageTextView.smartInsertDeleteType = .no
        imageTextView.autocapitalizationType = .none
        imageTextView.allowsEditingTextAttributes = true
        imageTextView.isEditable = true
        imageTextView.delegate = viewController.self
        imageTextView.snp.makeConstraints { make in
            make.top.equalTo(nameTextView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(originalHeightOfTextView)
        }
        
        addSubview(imageView)
        imageView.backgroundColor = .gray
        imageView.snp.makeConstraints { make in
            make.top.equalTo(imageTextView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(200)
        }
        uploadButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: uploadButton)
        
        addSubview(table)
        table.delegate = viewController.self
        table.dataSource = viewController.dataSource
        table.register(CreatorCell.self, forCellReuseIdentifier: "cell")
        table.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().offset(-50)
            make.height.equalTo(200)
        }
        addSubview(addButton)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(table.snp.top)
            make.leading.equalTo(table.snp.trailing)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
//        keyboardLayoutGuide.followsUndockedKeyboard = true
//        let keyboardHider = UITapGestureRecognizer(target: self, action: #selector(hideAction))
//        addGestureRecognizer(keyboardHider)
    }
    
    @objc func hideAction() {endEditing(true)}
    
    @objc func upload() {
        guard let _ = imageTextView.text else {
            print("empty Image Name")
            return
        }
        guard let _ = nameTextView.text else {
            print("empty Image Name")
            return
        }
        var sendingReadingContent: [[String]] = []
        for cell in viewController.dataSource.array as! [CreatorCell] {
            sendingReadingContent.append([cell.titleText.text, cell.contentText.text])
        }
        viewController.upload(
            imageName: imageTextView.text!,
            name: nameTextView.text!,
            readingContent: sendingReadingContent,
            musicContent: [
                [
                    "name",
                    "author",
                    "tanya",
                    ""
                ],
                [
                    "name",
                    "author",
                    "airplane_graveyard",
                    ""
                ],
                [
                    "name",
                    "author",
                    "our_summer",
                    ""
                ],
            ]
        )
//        print(textView.text!)
    }
    @objc func addCell() {
        viewController.addCell()
    }
    
    

}
