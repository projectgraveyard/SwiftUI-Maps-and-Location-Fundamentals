import SwiftUI
import MapKit

struct MapView: View {

  let location: Place
  let places: [Place]

  @State private var region: MKCoordinateRegion
  @State private var mapType: MKMapType = .standard
  @Environment(\.presentationMode) private var presentationMode

  init(location: Place, places: [Place]) {
    self.location = location
    self.places = places
    _region = State(initialValue: location.region)
  }

  var body: some View {
    ZStack {
      MapViewUI(location: location, mapViewType: mapType)
      VStack {
        HStack {
          Button {
            presentationMode.wrappedValue.dismiss()
          } label: {
            Image(systemName: "xmark.circle.fill")
              .imageScale(.large)
          }
          Spacer()
        }
        .padding()
        Spacer()
        Picker("", selection: $mapType) {
          Text("Standard").tag(MKMapType.standard)
          Text("Satellite").tag(MKMapType.satellite)
          Text("Hybrid").tag(MKMapType.hybrid)
        }
        .pickerStyle(SegmentedPickerStyle())
        .offset(y: -28)
      }
    }
    .edgesIgnoringSafeArea(.all)
    .navigationBarHidden(true)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(location: MapDirectory().places[0], places: MapDirectory().places)
  }
}
