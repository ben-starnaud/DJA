import SwiftUI

struct MessagingView: View {
    @State private var searchText: String = ""
    @State private var messages: [Message] = [
        Message(id: 1, contactName: "John Doe", preview: "Hey, how are you?", timestamp: "Now"),
        Message(id: 2, contactName: "Jane Smith", preview: "See you tomorrow!", timestamp: "5 min ago"),
        // Add more sample messages here
    ]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                ZStack {
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.white.opacity(0.4)]), startPoint: .top, endPoint: .bottom)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: 150)
                    
                    VStack {
                        Text("Messaging")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.blue)
                            .shadow(color: .black.opacity(0.2), radius: 2, x: 1, y: 1)
                        
                        SearchBar(text: $searchText)
                            .padding(.horizontal)
                            .padding(.top, 10)
                    }
                }
                
                List {
                    Section(header: Text("Messages")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .padding(.top)) {
                        
                        ForEach(filteredMessages, id: \.id) { message in
                            NavigationLink(destination: ChatView(contactName: message.contactName)) {
                                MessageRow(message: message)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    var filteredMessages: [Message] {
        if searchText.isEmpty {
            return messages
        } else {
            return messages.filter { $0.contactName.contains(searchText) || $0.preview.contains(searchText) }
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
        
        func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = true
        }
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            searchBar.showsCancelButton = false
        }
        
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            searchBar.text = ""
            searchBar.showsCancelButton = false
            searchBar.endEditing(true)
            text = ""
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search messages"
        searchBar.backgroundImage = UIImage() // Removes the white border
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }
}

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(message.contactName)
                    .font(.headline)
                Text(message.preview)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(message.timestamp)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 5)
    }
}

struct Message: Identifiable {
    let id: Int
    let contactName: String
    let preview: String
    let timestamp: String
}

struct ChatView: View {
    let contactName: String
    @State private var messageText: String = ""
    @State private var messages: [String] = ["Hello! How are you?"]
    
    var body: some View {
        VStack {
            List {
                ForEach(messages, id: \.self) { message in
                    Spacer()
                    HStack {
                        if message.starts(with: "Me: ") {
                            Spacer()
                            Text(message)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                        } else {
                            Text(message)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                            Spacer()
                        }
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationBarTitle(contactName, displayMode: .inline)
    }
    
    private func sendMessage() {
        if !messageText.isEmpty {
            messages.append("Me: \(messageText)")
            messageText = ""
            // Add logic here to send the message to the backend
        }
    }
}

#Preview {
    MessagingView()
}

