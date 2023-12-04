//
//  PediaDataSource.swift
//  ClassicMusic
//
//  Created by Arslan Toimbekov on 22.11.2023.
//

import Foundation
import UIKit

class PediaDataSource: NSObject, UICollectionViewDataSource {
    weak var view: PediaViewControllerProtocol!
    // Number of Cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    // Setup Data of Each Cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = view.collection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TitleCell
        view.presenter.loadCertainTitle(id: indexPath.row, for: cell)
        return cell
    }
    
}
