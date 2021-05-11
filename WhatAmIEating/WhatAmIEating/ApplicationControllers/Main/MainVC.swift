
import UIKit
import JGProgressHUD

class MainVC: UIViewController {
    
    var coordinator: HomeCoordinator?
    private var mainView = MainView()
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    private func setImagePickerController() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    private func analyzeImage() {
        let image = mainView.imageView.image
        let analyzedText = ImageAnalyzer().recognizeText(image: image)
        
        let symbols = ImageAnalyzer().findESymbolsRegex(text: analyzedText)
        var additives: [Additive] = []
        
 //       print(symbols.description)
        
        // mock
        //let symbols = ["E101", "E150d"]
        
        for symbol in symbols {
            DbManager.shared.fetchSingleAdditive(id: symbol) { additive in
                print(additive?.eNumber)
                guard let additive = additive else {
                    return
                }
                additives.append(additive)
            }
        }

        let vc = AfterAnalyzeVC(additives: additives)
        vc.title = "Składniki E"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.mainView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DbManager.shared.fetchAllAdditives { additives in
            print("ALL: \(additives?.first?.eNumber)")
        }
    }
    
}

// MARK: - MainViewDelegate
extension MainVC: MainViewDelegate {
    func didChooseButtonClicked() {
        setImagePickerController()
    }
    
    func didAnalyzeButtonClicked() {
        analyzeImage()
    }
}

// MARK: - UIImagePickerControllerDelegate
extension MainVC: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            setImagePickerController()
            mainView.setImage(image: image)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UINavigationControllerDelegate
extension MainVC: UINavigationControllerDelegate {
    
}
