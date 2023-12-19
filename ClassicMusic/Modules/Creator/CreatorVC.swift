//
//  CreatorVC.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 17.12.2023.
//

import UIKit

class CreatorVC: UIViewController {

    private lazy var creatorView: CreatorView = CreatorView()
    lazy var dataSource: CreatorDataSource = CreatorDataSource()
    
    override func loadView() {
        creatorView.viewController = self
        view = creatorView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        creatorView.setupUI()
        self.title = "Creator"
        // Do any additional setup after loading the view.
    }
    
    func addCell() {
        dataSource.number += 1
        creatorView.table.beginUpdates()
        creatorView.table.insertRows(at: [IndexPath.init(row: dataSource.number-1, section: 0)], with: .automatic)
        creatorView.table.endUpdates()
        print("New Cell is Added")
    }
    
    func upload(imageName: String, name: String, readingContent: [[String]], musicContent: [[String]]) {
        creatorView.imageView.loadImageUsingCache(withUrl: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")
        let article = ArticleData(
            image: nil,
            imageURL: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg",
            name: name,
            like: false,
            readingContent: readingContent,
            musicContent: musicContent)
        print("New Article", article)
        Data.upload(article: article)
//        print(Data.articleData)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CreatorVC: UITextViewDelegate, UITableViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            if textView == creatorView.imageTextView {
                if let _ = textView.text, textView.text.trimmingCharacters(in: .whitespaces) != "" {
                    let bestForm = textView.text.trimmingCharacters(in: .whitespacesAndNewlines)
    //                creatorView.imageView.loadImageUsingCache(withUrl: bestForm)
                    creatorView.imageView.loadImageUsingCache(withUrl: "https://buffer.com/cdn-cgi/image/w=1000,fit=contain,q=90,f=auto/library/content/images/size/w1200/2023/10/free-images.jpg")
                    print("<", bestForm, ">")
                }
            } else {print("It is not imageTextView")}
            return false
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    
}
