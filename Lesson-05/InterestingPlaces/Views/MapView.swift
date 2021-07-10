import SwiftUI
import MapKit

struct MapView: View {

  let location: Place
  let places: [Place]

  @State private var region: MKCoordinateRegion
  @Environment(\.presentationMode) private var presentationMode

  init(location: Place, places: [Place]) {
    self.location = location
    self.places = places
    _region = State(initialValue: location.region)
  }

  var body: some View {
    ZStack {
      Map(coordinateRegion: $region, annotationItems: places) { item in
        MapAnnotation(coordinate: item.location.coordinate) {
          VStack {
            Circle()
              .fill(Color.red)
            Text(item.name)
              .fontWeight(.bold)
          }
        }
      }
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
      }
    }
    .edgesIgnoringSafeArea(.all)
    .navigationBarHidden(true)
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(
      location: MapDirectory().places[0],
      places: MapDirectory().places
    )
  }
}
