//
//  ViewController.swift
//  Lesson12UIKit
//
//  Created by Misha Abaiev on 29.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let images = ["Image1", "Image2", "Image"]
        let titles = (1...25).map { "Item \($0)" }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
             layout.minimumInteritemSpacing = 0
             layout.minimumLineSpacing = 0
         }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width / 2 // Половина ширини екрану
        let height = width + 30 // Довільна висота
        return CGSize(width: width, height: height)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCollectionViewCell
        
        let imageName = images[indexPath.item % images.count] // Циклічний вибір зображень
        cell.imageView.image = UIImage(named: imageName)
        cell.titleLabel.text = titles[indexPath.item]
        
        return cell
        
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

