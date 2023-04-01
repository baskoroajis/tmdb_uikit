//
//  MovieListViewController.swift
//  IMDBUIkit
//
//  Created by Baskoro on 17/03/23.
//

import Foundation
import UIKit


class MovieListViewController:UIViewController  {
    
    @IBOutlet weak var tableView:UITableView!
    
    private let apiService = ApiCall.shared
    
    private var movies:Movies?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: nil, action: nil)
        
//        UIBarButtonItem(title: "Test", style: .plain, target: nil, action: nil)
        print("set navigation!" , self.navigationItem.leftBarButtonItem)
        
        tableView.register(UINib(nibName: "MovieListItemCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        
        apiService.getMovies(endPoint: .discover) { (result:Result<Movies, ApiError>) in
            
            switch result{
            case .success(let response):
                self.movies = response
                self.tableView.reloadData()
            case .failure(let error):
                print("error ", error)
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
}


extension MovieListViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListItemCell
        if (movies?.results != nil){
            let data = self.movies?.results[indexPath.item]
            cell.setData(data: data!)
        }
       
        return cell;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var movieDetailViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MovieDetailController") as! MovieDetailViewController
        if (movies?.results != nil){
            movieDetailViewController.setData(movie: (self.movies?.results[indexPath.item])!)
        }
        
//
//        var backIcon = UIBarButtonItem()
//        movieDetailViewController.navigationItem.leftBarButtonItem = bac
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
    
}
