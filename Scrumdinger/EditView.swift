//
//  EditView.swift
//  Scrumdinger
//
//  Created by Ao Li on 2021-10-14.
//

import Foundation
import SwiftUI

struct EditView: View{
    @State private var scrumData: DailyScrum.Data = DailyScrum.Data()
    @State private var newAttendee = ""
    var body: some View{
        List{
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0){
                        Text("Length")
                    }
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                }
                ColorPicker("Color", selection: $scrumData.color)
            }
            Section(header: Text("Attendees")){
                ForEach(scrumData.attendees, id: \.self){ attendee in
                    Text(attendee)
                }
                .onDelete {
                    indices in scrumData.attendees.remove(atOffsets: indices)
                }
                HStack{
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation{
                            scrumData.attendees.append(newAttendee)
                            newAttendee = ""
                        }
                    }){
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(newAttendee.isEmpty)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
    }
}

struct EditView_Preview: PreviewProvider{
    static var previews: some View{
        EditView()
    }
}
