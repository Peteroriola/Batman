//
//  ViewController.swift
//  Batman
//
//  Created by Peter on 27/03/2021.
//

import UIKit
import Alamofire
import SwiftyJSON

//fileprivate let HOME_SECTION: [Int] = [0]
class AllBatmanMoviesHomeVC : UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let homeIdentifierCell = "homeIdentifierCell"
    var batmanModel =  [BatmanModel]()
    
    
    
    lazy var collectionView: UICollectionView = {
          let collectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: self.makeLayout())
          collectionView.backgroundColor = UIColor.clear
          collectionView.delegate = self
          collectionView.dataSource = self
          collectionView.translatesAutoresizingMaskIntoConstraints = false
          return collectionView
      }()
    
    func makeLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
                let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0)))
                item.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 0, bottom: 0, trailing: 0)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),  heightDimension: .estimated(400))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 40, trailing: 5)
                      
                return section
                
        
        }
        
        return layout
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


        navigationItem.titleView = navbarTitle(title: "Batman Movies")
        colorNavigationBar(navigationController: self.navigationController)
        view.backgroundColor = .white
        
        collectionView.register(AllBatmanMoviesHomeViewCell.self, forCellWithReuseIdentifier: homeIdentifierCell)
        collectionView.showsVerticalScrollIndicator = false
        view.addSubview(collectionView)
        collectionView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 15, height: 0, width: 0)
        getAllBatmanMovies()
    }

   
    

    
    func getAllBatmanMovies() {

            let urlString = BASEURL
            let url  = URL.init(string: urlString)
            START_PAGE_LOADING(viewcontroller: self)
        AF.request(url!, method: .get, encoding: JSONEncoding.default).responseJSON { response in
            switch response.result {
            case .success(let value):
                let batmanData : JSON = JSON(value)
                self.updateBatmanData(json : batmanData)
              //  print(batmanData)
                CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller: self)
            case .failure(let error):
                CLEAR_PAGE_LOADING_AND_TOASTS(viewcontroller: self)
                print(error)
            }
            
            
        }
    }
    
        func  updateBatmanData(json : JSON) {
            
               if let title = json["Title"].string {
                let year = json["Year"].stringValue
                let rated = json["Rated"].stringValue
                
                let released = json["Released"].stringValue
                let runtime = json["Runtime"].stringValue
                
                let genre = json["Genre"].stringValue
                let director = json["Director"].string
                
                let writer = json["Writer"].stringValue
                let actors = json["Actors"].stringValue
                
                let plot = json["Plot"].stringValue
                let language = json["Language"].stringValue
                
                let country = json["Country"].stringValue
                
                let awards = json["Awards"].stringValue
                let poster = json["Poster"].stringValue
                
                let imdbRating = json["imdbRating"].stringValue
                let imdbVotes = json["imdbVotes"].stringValue
                
                let imdbID = json["imdbID"].stringValue
                
                let type = json["Type"].stringValue
                let dvd = json["DVD"].stringValue
                
                let boxOffice = json["BoxOffice"].stringValue
                let production = json["Production"].stringValue
                
                let data = BatmanModel(title: title, year: year, rated: rated, released: released, runtime: runtime, genre: genre, director: director, writer: writer, actors: actors, plot: plot, language: language, country: country, awards: awards, poster: poster, imdbRating: imdbRating, imdbVotes: imdbVotes, imdbID: imdbID, type: type, dvd: dvd, boxOffice: boxOffice, production: production)
        
                batmanModel.append(data)
                print(batmanModel)
    }
            collectionView.reloadData()
            
}
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
          return 1
      }

   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
     
    return batmanModel.count
    
   }
   

   func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: homeIdentifierCell, for: indexPath) as? AllBatmanMoviesHomeViewCell else {fatalError("Unable to deque cell2")}
    
    cell.titleLabel.text = "Title: \(batmanModel[indexPath.row].title ?? "")"
    cell.yearOfProductionLabel.text = "Year: \(batmanModel[indexPath.row].year ?? "")"
    cell.directorLabel.text = "Director: \(batmanModel[indexPath.row].director ?? "")"
    cell.moviePosterImage.loadImage(urlstring: batmanModel[indexPath.row].poster ?? "")
    
    return cell
  
   }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let batmanDetailsVC = BatmanDetailsVC()
        batmanDetailsVC.passedDetailsArray = batmanModel
        self.navigationController?.pushViewController(batmanDetailsVC, animated: true)
        print("Image tapped ")
    }
    

    
}

