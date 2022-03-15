import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var main_tView: UITableView!
    var list = [String]()
    var image = [UIImage]()
    var chosseName = ""
    var chosseImage = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        main_tView.delegate = self
        main_tView.dataSource = self
        
        //List Book Data
        list.append("Damascus")
        list.append("Riyadh")
        list.append("Amman")
        list.append("Dubai")
        image.append(UIImage(named: "damascus.jpg")!)
        image.append(UIImage(named: "riyadh.jpg")!)
        image.append(UIImage(named: "amma.jpg")!)
        image.append(UIImage(named: "dubai.jpg")!)
        
        navigationItem.title = "Land Marks"
    }
    //Table View Delete
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            list.remove(at: indexPath.row)
            image.remove(at: indexPath.row)
            main_tView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    //Table View Rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = list[indexPath.row]
        return cell
    }
    //Table View Count Array
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    //Table Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosseName = list[indexPath.row]
        chosseImage = image[indexPath.row]
        performSegue(withIdentifier: "toImageView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toImageView"){
            let destination = segue.destination as? ImageViewController
            destination?.selectText = chosseName
            destination?.selectImage = chosseImage
        }
    }
}

