

import UIKit

class ViewController: UIViewController, CHTCollectionViewDelegateWaterfallLayout {

    @IBOutlet weak var collectionView: UICollectionView!

    let cellIdentifier = "Cell"
    let model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        model.buildDataSource()

        //Layout setup
        setupCollectionView()
        
        //Register nibs
        registerNibs()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - CollectionView UI Setup
    func setupCollectionView(){
        
        // Create a waterfall layout
        let layout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        layout.columnCount = 3
        layout.headerHeight = 0
        layout.footerHeight = 0
        //        layout.itemRenderDirection = CHTCollectionViewWaterfallLayoutItemRenderDirection.CHTCollectionViewWaterfallLayoutItemRenderDirectionLeftToRight
        
        // Collection view attributes
        self.collectionView.autoresizingMask = [.FlexibleHeight, .FlexibleWidth]
        self.collectionView.alwaysBounceVertical = true
        
        // Add the waterfall layout to your collection view
        self.collectionView.collectionViewLayout = layout
    }
    
    // Register CollectionView Nibs
    func registerNibs(){
        
        let nib:UINib = UINib(nibName:cellIdentifier, bundle: nil)
        self.collectionView.registerNib(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.images.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return (indexPath.row == 1) ? CGSizeMake(self.view.frame.size.width / 2 - 12, 180) : CGSizeMake(self.view.frame.size.width / 3 - 12, 100)
        // create a cell size from the image size, and return the size
        let imageSize = model.images[indexPath.row].size
        print("imageSize:\(imageSize)")
        
        return imageSize
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell : Cell = collectionView.dequeueReusableCellWithReuseIdentifier(cellIdentifier, forIndexPath: indexPath) as! Cell
        
        cell.image.image = model.images[indexPath.row]
        return cell
    }
    
}
