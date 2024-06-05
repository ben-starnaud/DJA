import SwiftUI

struct MessagingView: View {
    @State private var searchText: String = ""

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    Color.gray
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 90)
                    
                    Text("Messages")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.yellow)
                }
                
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                    .padding(.top)
                Spacer()
                Text("You have 0 new messages").font(.subheadline).bold()
                Spacer()
            
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
}

struct SearchBar: UIViewRepresentable {
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

#Preview {
    MessagingView()
}

