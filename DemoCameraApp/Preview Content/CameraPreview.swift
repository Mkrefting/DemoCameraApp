//
//  CameraPreview.swift
//  DemoCameraApp
//
//  Created by Max Krefting on 13/02/2021.
//

import SwiftUI
import AVFoundation
import UIKit

struct CameraPreview: UIViewRepresentable {
    class VideoPreviewView: UIView {
        override class var layerClass: AnyClass {
             AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            //as! - force downcast layer to type AVCaptureViewPreviewLayer (force unwraps result)
            //if not sure if will succeed, use optional downcast 'as?' - will return optional or nil
            //downcasting = make type/instance into its lowest type (i.e. the bottom of class hierarchy
            return layer as! AVCaptureVideoPreviewLayer
        }
    }
    
    let session: AVCaptureSession

    func makeUIView(context: Context) -> VideoPreviewView {
        let view = VideoPreviewView()
        view.backgroundColor = .black
        view.videoPreviewLayer.cornerRadius = 0
        view.videoPreviewLayer.session = session
        view.videoPreviewLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.videoPreviewLayer.connection?.videoOrientation = .landscapeRight
        return view
    }
    
    func updateUIView(_ uiView: VideoPreviewView, context: Context) {
        // Able to change videoPreviewLayer.connection?.videoOrientation?:
            //let deviceOrientation = UIDevice.current.orientation
            //guard let newVideoOrientation = AVCaptureVideoOrientation(deviceOrientation: deviceOrientation) else {return view}
            //view.videoPreviewLayer.connection?.videoOrientation = newVideoOrientation
    }
    
}
struct CameraPreview_Previews: PreviewProvider {
    static var previews: some View {
        CameraPreview(session: AVCaptureSession())
            .frame(height: 300)
    }
}
