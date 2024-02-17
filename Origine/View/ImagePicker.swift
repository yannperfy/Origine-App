//
//  ImagePicker.swift
//  Origine
//
//  Created by Yann Perfy on 01/11/2023.
//


import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var avatarImage: UIImage
   
    
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
     let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing  = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    func makeCoordinator() -> Coordinator {
        return Coordinator(imagePicker: self)
    }
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let imagePicker: ImagePicker
        init(imagePicker: ImagePicker) {
            self.imagePicker = imagePicker
        }
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    // show error or alert
                    return
                }

                
                imagePicker.avatarImage = compressedImage
            } else {
                // re turn error alert
            }
            picker.dismiss(animated: true)
        }
    }
    
}
