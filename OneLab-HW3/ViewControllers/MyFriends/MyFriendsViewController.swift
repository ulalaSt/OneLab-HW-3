
import UIKit

class MyFriendsViewController: UIViewController {
    private let viewModel = MyFriendsViewModel()
    
    private var collectionView: UICollectionView = {
        
        let collViewLayOut = UICollectionViewFlowLayout()
        collViewLayOut.scrollDirection = .vertical
        collViewLayOut.minimumLineSpacing = 8
        collViewLayOut.minimumInteritemSpacing = 8
        
        let collView = UICollectionView(frame: .zero, collectionViewLayout: collViewLayOut)
        collView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        collView.register(MyFriendsCollectionViewCell.self, forCellWithReuseIdentifier: MyFriendsCollectionViewCell.identifier)
        return collView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "MyFriendsBackground")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureNavigation()
        layout()
    }
    private func configureNavigation(){
        let rightBar = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(didTapRightButton))
        let leftBar = UIBarButtonItem(image: UIImage(systemName: "plus.circle"), style: .plain, target: self, action: #selector(didTapLeftButton))
        
        navigationItem.rightBarButtonItem = rightBar
        navigationItem.leftBarButtonItem = leftBar
        navigationItem.backButtonTitle = "Back"
    }
    private func layout(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
        }
    }
    @objc private func didTapLeftButton(){
        let addNewFriendVC = AddNewFriendViewController(nibName: nil, bundle: nil)
        navigationController?.pushViewController(addNewFriendVC, animated: true)
    }
    
    @objc private func didTapRightButton(){
        print("didTapRightButton")
    }
}

extension MyFriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFriendsCollectionViewCell.identifier, for: indexPath) as! MyFriendsCollectionViewCell
        cell.configure(user: viewModel.users[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((view.frame.size.width - 40)/2), height: (view.frame.size.width - 40)/1.9)
    }
}
