//
//  PopularContentViewController.swift
//  VIPER-practice
//
//  Created by Bahadır Enes Atay on 2.04.2021.
//

import UIKit

class PopularContentViewController: UIViewController {
    
    var presenter: ViewToPresenterDelegate?
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var posterArray: [UIImage]?
    private var activityIndicator: UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator = UIActivityIndicatorView()
        presenter?.startTofetchPopularTVContent()
        setNavigationBar()
        createUI()
    }
    

    
    @IBAction func gridTapped(_ sender: UIBarButtonItem) {
        guard presenter != nil else { return }
        let actionSheet = presenter!.createActionSheet(didSelected: {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            self.setNavigationTitle()
        })
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        activityIndicator?.showActivityIndicator(superView: self.view)
        let index = sender.selectedSegmentIndex
        presenter?.currentSegment(index: index)
        setNavigationTitle()
        activityIndicator?.hideActivityIndicator()
    }

    private func setNavigationBar() {
        ///left bar button image
        var image: UIImage!
        if #available(iOS 13.0, *) {
            image = UIImage(systemName: "rectangle.grid.2x2.fill")
        } else {}
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(gridTapped(_:)))
        
        let tintColor = UIColor(red: 232/255, green: 92/255, blue: 74/255, alpha: 1)
        self.navigationController?.navigationBar
            .tintColor = tintColor
        self.navigationController?.navigationBar
            .barTintColor = .white
        self.navigationController?.navigationBar
            .setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar
            .shadowImage = UIImage()
        self.navigationController?.navigationBar
            .isTranslucent = false
        ///set navigation bar layer
        self.navigationController?.navigationBar.layer
            .masksToBounds = false
        self.navigationController?.navigationBar.layer
            .shadowColor = UIColor.black.cgColor
        self.navigationController?.navigationBar.layer
            .shadowOpacity = 0.3
        self.navigationController?.navigationBar.layer
            .shadowOffset = CGSize(width: 0, height: 2.0)
        self.navigationController?.navigationBar.layer
            .shadowRadius = 2
        ///add attribute to text of navigation bar title
        let textAttributes = [
            NSAttributedString.Key.foregroundColor : tintColor,
        ]
        navigationController?.navigationBar.titleTextAttributes = textAttributes as [NSAttributedString.Key : Any]
    }
    
    private func setNavigationTitle() {
        let itemCount = self.getItemCount()
        self.navigationItem.title = "\(itemCount)" + " " + "Items"
    }
    
    let headerId = "headerId"
    let entityCellId = "entityCellId"
    private func createUI() {
        collectionView.register(PopularContentCell.self, forCellWithReuseIdentifier: entityCellId)
        collectionView.register(PopularContentCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


extension PopularContentViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getItemCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: entityCellId, for: indexPath) as!
            PopularContentCell
        
        cell.imageView.image = posterArray?[indexPath.row]
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (view.frame.width-50)/2
        return CGSize(width: cellWidth, height: cellWidth*2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 20, bottom: 20, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! PopularContentCollectionViewHeader
        headerView.segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        return headerView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if let cell = collectionView.cellForItem(at: indexPath) as? CategoryCell {
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    }
}

extension PopularContentViewController: PresenterToViewDelegate {
    func onPopularContentResponseSuccess(results: [Result]) {
        posterArray = [UIImage]()
        let utilities = Utilities()
        DispatchQueue.main.async {
            self.activityIndicator?.showActivityIndicator(superView: self.view)
        }
        for result in results {
            guard let posterPath = result.posterPath else { activityIndicator?.hideActivityIndicator()
                return }
            let urlString = imageBaseUrl.appending(posterPath)
            utilities.getImage(from: URL(string: urlString)!) { (image, error) in
                guard let poster = image, error == nil else { self.activityIndicator?.hideActivityIndicator()
                    return }
                self.posterArray?.append(poster)
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    self.setNavigationTitle()
                    self.activityIndicator?.hideActivityIndicator()
                }
            }
            
        }
    }
    
    func onPopularContentResponseFailed(error: String) {
        print("error")
    }
    
    
    func getItemCount() -> Int {
        if presenter?.selectedCount != nil {
            return (presenter?.selectedCount)!
        } else {
            guard posterArray != nil else { return 0 }
            if posterArray!.count > 4 {
                return 4
            } else {
                return posterArray!.count
            }
        }
    }
}
