//
//  ArticleDataSource.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 12.12.2023.
//

import Foundation
import UIKit


class ArticleDataSource: NSObject, UITableViewDataSource {
    var dataSource = [["aaa", "aa"], ["bbb", "cccc"], ["kkkk", "kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"], ["bbb", "cccc"]]
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DropperCell
//        cell.label.text = dataSource[indexPath.row][0]
//        return cell
        if self.dataSource[indexPath.row][1] == "is not openable" {
            var cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! DropDownCell
            cell.label.text = self.dataSource[indexPath.row][0]
            return cell
        }
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DropperCell
        cell.label.text = self.dataSource[indexPath.row][0]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
}
