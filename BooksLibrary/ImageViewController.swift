import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var second_imageView:UIImageView!
    @IBOutlet weak var second_tvText:UILabel!
    var selectText = ""
    var selectImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        second_tvText.text = selectText
        second_imageView.image = selectImage
    }
}
