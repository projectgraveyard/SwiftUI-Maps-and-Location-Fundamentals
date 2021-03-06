import SwiftUI
import MapKit

struct MapView: View {
  @State private var region: MKCoordinateRegion
  @Environment(\.presentationMode) private var presentationMode
  
  init(location: Place) {
    _region = State(initialValue: location.region)
  }
  
    var body: some View {
      ZStack {
        Map(coordinateRegion: $region)
        VStack {
          HStack {
            Button(action: {presentationMode.wrappedValue.dismiss()}) {
              Image(systemName: "xmark.circle")
                .imageScale(.large)
            }
            Spacer()
          }
          .padding()
          Spacer()
        }
      }
      .edgesIgnoringSafeArea(.all)
      .navigationBarHidden(true)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
      MapView(location: MapDirectory().places[0])
    }
}
