//
//  MovieDetailViewController.swift
//  IMDBUIkit
//
//  Created by Baskoro on 26/03/23.
//

import UIKit

class MovieDetailViewController:UIViewController {
    
    @IBOutlet weak var scrollviewWidthConstraint:NSLayoutConstraint!
    @IBOutlet weak var scrollviewHeightConstraint:NSLayoutConstraint!
    @IBOutlet weak var imagePoster:UIImageView!
    @IBOutlet weak var overviewText:UILabel!
    @IBOutlet weak var castingListCollection:UICollectionView!
//    @IBOutlet weak var btnSave:UIButton!
    
    private var movieData:Movie?
    
    @IBAction func onPressSaveButton(_ sender:UIButton){
        print("button save tapped! ")
        LocalStorage.saveObjectItem()
       
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("UIScreen.main.bounds.width ", UIScreen.main.bounds.width)
        print("UIScreen.main.bounds.height ", UIScreen.main.bounds.height)
        scrollviewWidthConstraint.constant =  UIScreen.main.bounds.width
        
        scrollviewHeightConstraint.constant = 900
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let windowWidth = UIScreen.main.bounds.width
        let windowHeight = UIScreen.main.bounds.height

        if windowWidth > scrollviewWidthConstraint.constant {
            scrollviewWidthConstraint.constant = windowWidth
        }

        if windowHeight > scrollviewHeightConstraint.constant {
            scrollviewHeightConstraint.constant = windowHeight
        }
        
        

//        print("asadsa ", self.navigationController?.navigationItem.title)
        castingListCollection.register(UINib(nibName: "MovieDetailCastCellItem", bundle: nil), forCellWithReuseIdentifier: "castItem")
        
//        scrollviewWidthConstraint
        
        LocalStorage.fetchData()
        
        if (movieData != nil){
            imagePoster.loadFrom(URLAddress: ImageUrl.getPosterImageUrl(posterPath: movieData?.posterPath))
            overviewText.text = self.movieData?.overview
        }
    }
    
    func setData(movie:Movie){
        self.movieData = movie
    }
    
}


extension MovieDetailViewController:UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("tesss!")
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellItem = collectionView.dequeueReusableCell(withReuseIdentifier: "castItem", for: indexPath) as! MovieDetailCastCellItem
        
        return cellItem
    }
    
//    collectionviewheight
    
}
