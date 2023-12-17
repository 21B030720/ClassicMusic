//
//  MusicPlayerDataSource.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 15.12.2023.
//

import Foundation
import UIKit

class MusicPlayerDataSource: NSObject, UITableViewDataSource {
    var dataSource: [[String]]!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TrackCell
        cell.image.image = UIImage(named: dataSource[indexPath.row][0])
        cell.name.text = dataSource[indexPath.row][1]
        cell.author.text = dataSource[indexPath.row][2]
        cell.clipsToBounds = true
        cell.backgroundColor = #colorLiteral(red: 0.6980392157, green: 0.5960784314, blue: 0.5960784314, alpha: 1)
        print(dataSource[indexPath.row][0], dataSource[indexPath.row][1], dataSource[indexPath.row][2])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
}
