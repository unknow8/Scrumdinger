//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Ao Li on 2021-10-10.
//

import Foundation
import SwiftUI

struct DetailView: View{
    let scrum: DailyScrum
    @State private var isPresented = false
    var body: some View{
        List{
            Section(header: Text("Meeting Info")){
                NavigationLink(destination: MeetingView()){
                    Label("Start Meeting", systemImage: "timer")
                        .accessibilityLabel(Text("Start meeting"))
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                
                HStack{
                    Label("Length", systemImage: "clock")
                        .accessibilityLabel(Text("Meeting length"))
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                HStack{
                    Label("Color", systemImage: "paintpalette")
                    Spacer()
                    Image(systemName: "checkmark.circle.fill")
                }
            }
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees, id: \.self){ attendee in
                    Label(attendee, systemImage: "person")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationBarItems(trailing: Button("Edit"){
            isPresented = true
        })
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented){
            NavigationView{
                EditView()
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                                            isPresented = false
                                        }, trailing: Button("Done") {
                                            isPresented = false
                                        })
            }
        }
    }
}

struct DetailView_Preview: PreviewProvider{
    static var previews: some View{
        NavigationView{
            DetailView(scrum: DailyScrum.data[0])
        }
    }
}
