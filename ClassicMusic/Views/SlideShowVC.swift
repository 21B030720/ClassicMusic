//
//  SlideShowVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 25.10.2023.
//

import UIKit
import SnapKit

class SlideShowVC: UIViewController {
    let text: [String]
    let label: UILabel = UILabel()
    var counter: Int = 0
    
    init(text: String) {
        self.text = text.components(separatedBy: ".")
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        start()
    }
    
    func start() {
        DispatchQueue.main.async {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (_) in
                if(self.counter < self.text.count) {
                    self.label.text = self.text[self.counter]
                    self.counter += 1
                } else {
                    self.label.text = "Thanks For Your Attention!"
                    return
                }
                print(self.counter)
            }
            
        }
        
    }
    
    func setupUI() {
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .gray
        label.numberOfLines = 0
        
        label.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}
