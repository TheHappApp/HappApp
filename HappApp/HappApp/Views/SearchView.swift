//
//  SearchView.swift
//  HappApp
//
//  Created by Turner White on 9/29/22.
//

import SwiftUI
import UIKit

struct SearchView: View {
    @StateObject private var vm = SearchViewModel()
    var body: some View {
        VStack {
            
            Text("Happening Near You")
                .font(.title)
                .bold()
            HStack {
                VStack {
                    NavigationLink {
                        ConcertListView(vm:vm)
                    }
                label: {RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                        .frame(width: 75, height: 50)
                        .overlay {
                            Text("🎵")
                            
                        }
                }
                    Text("Concerts")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        EventListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🎭")
                            }
                    }
                    
                    Text("Events")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        PartyListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🍾")
                            }
                    }
                    
                    Text("Parties")
                }
                .padding()
            }
            .padding()
            
            HStack {
                VStack {
                    NavigationLink {
                        CompanyListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("👨🏼‍💻")
                            }
                    }
                    
                    Text("Company")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        ClubListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("📝")
                            }
                    }
                    
                    Text("Clubs")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        SpeakerListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🎤")
                            }
                    }
                    
                    Text("Speakers")
                }
                .padding()
            }
            .padding()
            
            HStack {
                VStack {
                    NavigationLink {
                        SportListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🏈")
                            }
                    }
                    
                    Text("Sports")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        FoodListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🍕")
                            }
                    }
                    
                    Text("Food")
                }
                .padding()
                
                VStack {
                    NavigationLink {
                        ReligiousListView(vm:vm)
                    } label: {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.909))
                            .frame(width: 75, height: 50)
                            .overlay {
                                Text("🙏🏻")
                            }
                    }
                    
                    Text("Religious")
                }
                .padding()
            }
            .padding()
        }.onAppear{
            vm.getAllEventLists()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

