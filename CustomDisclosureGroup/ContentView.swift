import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                DisclosureView()
            }
            .navigationBarTitle(Text("Custom DisclosureGroup"), displayMode: .inline)
        }
    }
}

struct DisclosureView: View {
    
    @State var disclosure : [DisclosureGroupStruct] = [
        DisclosureGroupStruct(question: "What is your name?", answer: "Mr. John Doe"),
        // If you need to expand a certain group then you have to assign "isExpanded" true.
        DisclosureGroupStruct(question: "How old are you?", answer: "25 years old", isExpanded: true),
        
        DisclosureGroupStruct(question: "Where do you live in?", answer: "I live in an anonymous place. I hope you don't know about this place."),
    ]
    
    var body: some View {
        
        VStack(spacing:5){
            ForEach(0..<disclosure.count){ index in
                VStack(alignment: .trailing){
                    HStack{
                        Text(disclosure[index].question)
                            .font(.system(size: 17, weight: .semibold))
                            .fixedSize(horizontal: false, vertical: true)
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .font(.system(size: 14, weight: .regular))
                            .opacity(0.7)
                            .rotationEffect(disclosure[index].isExpanded ? .degrees(90) : .degrees(0))
                    }
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(5)
                    
                    if disclosure[index].isExpanded {
                        
                            Text(disclosure[index].answer)
                                .font(.system(size: 14, weight: .semibold))
                                .fixedSize(horizontal: false, vertical: true)
                                .padding(.bottom, 15)
                                .padding(.horizontal)
                        
                    }
                }
                .onTapGesture {
                    withAnimation{
                        disclosure[index].isExpanded.toggle()
                        
                    }
                }
            }
        }
        .opacity(0.8)
        .padding()
        
    }
}

struct DisclosureGroupStruct: Identifiable {
    var id = UUID()
    var question: String
    var answer: String
    var isExpanded = false
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
