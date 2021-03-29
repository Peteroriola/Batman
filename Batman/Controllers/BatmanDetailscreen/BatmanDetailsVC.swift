//
//  BatmanDetailsVC.swift
//  Batman
//
//  Created by Peter on 28/03/2021.
//

import UIKit

class BatmanDetailsVC: UIViewController {

    //Declare Variables and Methods
    var passedDetailsArray = [BatmanModel]()

    
    lazy var scrollView: UIScrollView = {
              let view = UIScrollView()
              view.translatesAutoresizingMaskIntoConstraints = false
              view.contentSize.height = 800
              view.backgroundColor = .white
              return view
          }()
    
    var pictureContainer : UIView = {
            let view = UIView()
              view.backgroundColor =  UIColor.systemBlue
              view.translatesAutoresizingMaskIntoConstraints = false
              return view
          
      }()

        let pictureContainerImageView: CustomImageView = {
        let iv = CustomImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            iv.contentMode = .scaleToFill

        return iv
        }()
    
    let favouriteButton: UIButton = {
        let button = UIButton(type: .custom)
        
        let image = UIImage(named: "Unselected") as UIImage?
        //let newImage = image?.withTintColor(UIColor.red)
        button.setImage(image, for: .normal)
        let newImage = UIImage(named: "Selected") as UIImage?
        button.setImage(newImage, for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top:0, left: 0, bottom: 0, right:30)
        button.titleEdgeInsets = UIEdgeInsets(top:0, left: 0, bottom:0, right:15)
        
        button.addTarget(self, action: #selector(handleFavouriteButton), for: .touchUpInside)
        return button
    }()
    

    
    @objc func handleFavouriteButton() {

        favouriteButton.isSelected = !favouriteButton.isSelected
        
        if favouriteButton.isSelected == true {
            UserDefaults.standard.setfavourite(value: true)
        }else if favouriteButton.isSelected == false  {
           
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.isfavourite.rawValue)
            let newImage = UIImage(named: "Unselected") as UIImage?
          
            favouriteButton.setImage(newImage, for: .normal)
            
        }


    }
        var titleLabel : UILabel = {
        let label = UILabel()

        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
        }()


        var yearOfProductionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()
        
        var  directorLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()

    
        var ratedLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()
        
        var  releasedLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()

    
        var runtimeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()
        
        var  genreLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
        }()

        var writerLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  actorsLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var plotLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  languageLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()

        var countryLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  awardsLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()

        var imdbRatingLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  imdbVotesLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()

        var typeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  dvdLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
    
        var boxOfficeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()
        
        var  productionLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        return label
        }()


    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Navigation bar Manipulation
        navigationItem.titleView = navbarTitle(title: "Movie Details")
        colorNavigationBar(navigationController: self.navigationController)
        view.backgroundColor = .white
        
        //Add scroll to Main View
        view.addSubview(scrollView)
        
        //scrollView layout
        scrollView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)
        
        [titleLabel, favouriteButton, pictureContainer, directorLabel, yearOfProductionLabel, ratedLabel, releasedLabel, runtimeLabel, genreLabel, writerLabel, actorsLabel, plotLabel, languageLabel, imdbRatingLabel, imdbVotesLabel, typeLabel, dvdLabel, boxOfficeLabel, productionLabel,countryLabel, awardsLabel].forEach{scrollView.addSubview($0)}
        
        [pictureContainerImageView].forEach{ pictureContainer.addSubview($0) }
        
        //Favurite button Maniputation
        let isFavouriteSeletced = UserDefaults.standard.getfavourite()
        let newImage = UIImage(named: "Selected") as UIImage?
        if isFavouriteSeletced == true {
            favouriteButton.setImage(newImage, for: .normal)
        }
        
        setupLayout()
        topimageSetup()
        populateDetalsField()
    }
    
    //MARK: ---- Populate Labels
    func populateDetalsField() {
        
        for details in passedDetailsArray {
        
            titleLabel.text = "Title: \(details.title ?? "")"
            directorLabel.text = "Director: \(details.director ?? "")"
            yearOfProductionLabel.text = "Year: \(details.year ?? "")"
            let image = "\(details.poster ?? "")"
            pictureContainerImageView.loadImage(urlstring: image)
            ratedLabel.text = "Rated: \(details.rated ?? "")"
            releasedLabel.text = "Released: \(details.released ?? "")"
            runtimeLabel.text = "Runtime: \(details.runtime ?? "")"
            genreLabel.text = "Genre: \(details.genre ?? "")"
            writerLabel.text = "Writer: \(details.writer ?? "")"
            actorsLabel.text = "Actors: \(details.actors ?? "")"
            plotLabel.text = "Plot: \(details.plot ?? "")"
            languageLabel.text = "Language: \(details.language ?? "")"
            countryLabel.text = "Country: \(details.country ?? "")"
            awardsLabel.text = "Awards: \(details.awards ?? "")"
            imdbRatingLabel.text = "imdb Rating: \(details.imdbRating ?? "")"
            imdbVotesLabel.text = "imdb Votes: \(details.imdbVotes ?? "")"
            typeLabel.text = "Type: \(details.type ?? "")"
            dvdLabel.text = "DVD: \(details.dvd ?? "")"
            boxOfficeLabel.text = "Box Office: \(details.boxOffice ?? "")"
            productionLabel.text = "production: \(details.production ?? "")"
    }
    }
    
    //MARK: ----- Layout 
    func setupLayout() {
     let width = view.frame.width

    titleLabel.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 40, width: width - 100)

    favouriteButton.anchor(top: scrollView.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 40, width: 60)
        
    directorLabel.anchor(top: titleLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 20, paddingRight: 10, height: 20, width: width - 100)

    pictureContainer.anchor(top: directorLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right:scrollView.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 500, width: width)

    yearOfProductionLabel.anchor(top: pictureContainer.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)

    ratedLabel.anchor(top: yearOfProductionLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)

    releasedLabel.anchor(top: ratedLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)

    runtimeLabel.anchor(top: releasedLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)
        
    genreLabel.anchor(top: runtimeLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)
        
        
    writerLabel.anchor(top: genreLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 60, width: width - 60)
            
    actorsLabel.anchor(top: writerLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 40, width: width - 60)
        

    plotLabel.anchor(top: actorsLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 80, width: width - 60)
            
        languageLabel.anchor(top: plotLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
        
    countryLabel.anchor(top: languageLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
                
    awardsLabel.anchor(top: countryLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 40, width: width - 60)
        
        
        imdbRatingLabel.anchor(top: awardsLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
                    
        imdbVotesLabel.anchor(top: imdbRatingLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
        
        
        typeLabel.anchor(top: imdbVotesLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
                    
        dvdLabel.anchor(top: typeLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
        
        
        boxOfficeLabel.anchor(top: dvdLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 60)
                    
        productionLabel.anchor(top: boxOfficeLabel.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 40, paddingRight: 20, height: 50, width: width - 60)
    }
    
    func topimageSetup() {
          
        pictureContainerImageView.anchor(top: pictureContainer.topAnchor , left: pictureContainer.leftAnchor, bottom: pictureContainer.bottomAnchor, right:pictureContainer.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)


        }
}
