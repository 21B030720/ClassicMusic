//
//  CreatorDataSource.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 17.12.2023.
//

import Foundation
import UIKit

class CreatorDataSource: NSObject, UITableViewDataSource {
    var array: [CreatorCell] = []
    var models: [String] = []
    var number: Int = 2
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return number
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CreatorCell
        array.append(cell)
        return cell
    }
    
    
}
