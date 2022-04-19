
import UIKit
import SnapKit

//MARK: - Just configuring a CollectionView

class MyFriendsViewController: UIViewController {
    
    private let viewModel = MyFriendsViewModel()
    
    private let collectionView: UICollectionView = {
        
        let collectionViewLayOut = UICollectionViewFlowLayout()
        collectionViewLayOut.scrollDirection = .vertical
        collectionViewLayOut.minimumLineSpacing = 8
        collectionViewLayOut.minimumInteritemSpacing = 8

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayOut)
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collectionView.register(MyFriendsCollectionViewCell.self,
                                forCellWithReuseIdentifier: MyFriendsCollectionViewCell.identifier)
        return collectionView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .secondaryToDark
        collectionView.dataSource = self
        collectionView.delegate = self
        layout()
        
        configureNavigationBar()
    }
    
    private func layout(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    //Navigation Bar Configuration
    private func configureNavigationBar(){
        navigationItem.backButtonTitle = "Back"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapRightBarItem))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.circle"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapLeftBarItem))
    }
    
    @objc private func didTapLeftBarItem(){
        let addNewFriendVC = AddNewFriendViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(addNewFriendVC, animated: true)
    }
    
    @objc private func didTapRightBarItem(){
        print("didTapRightBarItem")
    }

}



//MARK: - Cell Configuration and Count

extension MyFriendsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFriendsCollectionViewCell.identifier,
                                                      for: indexPath) as! MyFriendsCollectionViewCell
        cell.configure(user: viewModel.users[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.users.count
    }
}



//MARK: - Setting Size for Item

extension MyFriendsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: ((view.frame.size.width - 40)/2), height: (view.frame.size.width - 40)/1.9)
    }
}
