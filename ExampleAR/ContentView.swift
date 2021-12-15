//
//  ContentView.swift
//  ExampleAR
//
//  Created by Romy Ilano on 12/14/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
      
//        let cloneBox = boxAnchor.clone(recursive: true)
        let cloneBox = ModelEntity(mesh: MeshResource.generateBox(size: 0.05), materials: [SimpleMaterial(color: .red, isMetallic: true)])
        
        let cameraAnchor = AnchorEntity(.camera)
        cameraAnchor.addChild(cloneBox)
        arView.scene.addAnchor(cameraAnchor)
        
        cloneBox.transform.translation = [0, 0, -0.5]
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func handleTap(_ entity: Entity?) {
        
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
