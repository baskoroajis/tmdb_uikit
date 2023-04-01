//
//  Extension.swift
//  IMDBUIkit
//
//  Created by Baskoro on 25/03/23.
//

import UIKit

extension UIImageView {
    func loadFrom(URLAddress: String) {
        
        guard let url = URL(string: URLAddress) else{
            return
        }

        URLSession.shared.dataTask(with: url) {[weak self]  (data, response, error) in
              // Error handling...
              guard let imageData = data else { return }

              DispatchQueue.main.async {
                  self?.image = UIImage(data: imageData)
              }
            }.resume()

    }
}
