//
//  ViewController.swift
//  DiscoveryStoryBoard
//
//  Created by Cluzel Killian on 05/09/2023.
//

import UIKit

class ViewController: UIViewController {
    var imageViews: [UIImageView] = []
    @IBOutlet weak var Imag1: UIImageView!
    @IBOutlet weak var Imag2: UIImageView!
    @IBOutlet weak var Imag3: UIImageView!
    @IBOutlet weak var Imag4: UIImageView!
    @IBOutlet weak var Imag5: UIImageView!
    @IBOutlet weak var Imag6: UIImageView!
    @IBOutlet weak var Imag7: UIImageView!
    @IBOutlet weak var Imag8: UIImageView!
    @IBOutlet weak var Refresh: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showImage();
        Refresh.addTarget(self, action: #selector(showImage), for: .touchUpInside)
    }
    
    @objc func showImage()
    {
        imageViews = [Imag1, Imag2, Imag3, Imag4, Imag5, Imag6, Imag7, Imag8]
        
        for (index, imageView) in imageViews.enumerated() {
            if let imageUrl = generateRandomImageUrl(index) {
                if let imageData = try? Data(contentsOf: imageUrl),
                    let image = UIImage(data: imageData) {
                    imageView.image = image
                }
            }
        }
    }
    
    func generateRandomImageUrl(_ index: Int) -> URL? {
        let randomWidth = Int.random(in: 100...400) // Largeur aléatoire entre 100 et 400
        let randomHeight = Int.random(in: 100...400) // Hauteur aléatoire entre 100 et 400
        let imageUrlString = "https://picsum.photos/\(randomWidth)/\(randomHeight)"
        return URL(string: imageUrlString)
    }


}

