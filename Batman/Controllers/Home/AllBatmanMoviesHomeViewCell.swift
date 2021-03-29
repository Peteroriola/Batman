//
//  AllBatmanMoviesHomeViewCell.swift
//  Batman
//
//  Created by Peter on 27/03/2021.
//

import UIKit

class AllBatmanMoviesHomeViewCell: UICollectionViewCell {
    
    
    //Creat Cell items
        var container : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 8
        view.layer.shadowOpacity = 0.4
        view.layer.shadowRadius = 4
        view.layer.shadowOffset = CGSize(width: 0, height:0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view

        }()

        var moviePosterImage : CustomImageView = {
        let imageView = CustomImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.contentMode = .scaleAspectFit
        return imageView

        }()


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
            //label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            return label
            }()
            
            var  directorLabel : UILabel = {
            let label = UILabel()
            label.numberOfLines = 0
            //label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            return label
            }()


         override init(frame: CGRect) {
             super.init(frame: frame)
          
            self.contentView.addSubview(self.container)
            self.container.addSubview(moviePosterImage)
            self.container.addSubview(titleLabel)
            self.container.addSubview(yearOfProductionLabel)
            self.container.addSubview(directorLabel)
             
            
          
          setupAnchor()
          
        }
           
    //Configure cell layout
        fileprivate func setupAnchor() {
                let width = frame.width
         
        container.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, height: 0, width: 0)

        moviePosterImage.anchor(top: container.topAnchor, left: container.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, height: 50, width: width - 60)
                moviePosterImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
                
        titleLabel.anchor(top: moviePosterImage.bottomAnchor, left: container.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 40, width: width - 60)

        yearOfProductionLabel.anchor(top: titleLabel.bottomAnchor, left: container.leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 20, height: 30, width: width - 100)


        directorLabel.anchor(top: yearOfProductionLabel.bottomAnchor, left: container.leftAnchor, bottom: container.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 10, paddingBottom: 20, paddingRight: 10, height: 20, width: width - 100)
                
        }
            

            
            required init?(coder: NSCoder) {
                fatalError("init(coder:) has not been implemented")
            }

        }
