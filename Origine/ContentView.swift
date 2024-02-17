import SwiftUI

@available(iOS 17.0, *)
struct OnboardingView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    @State private var navigateToLogin = false  // Nouvelle propriété d'état

    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $pageIndex) {
                    ForEach(pages.indices, id: \.self) { index in
                        VStack {
                            Spacer()
                            PageSlidingView(page: pages[index])
                            Spacer()
                            if index == pages.indices.last {
                                
                                
                                NavigationLink(
                                    destination: LoginView(),
                                    isActive: $navigateToLogin,
                                    label: {
                                        Button("Start", action: {
                                            // Handle sign-up action
                                          
                                            navigateToLogin = true  // Activer la transition
                                        })
                                        .buttonStyle(.bordered)
                                    }
                                )
                            } else {
                                Button("Next", action: {
                                    incrementPage()
                                })
                            }
                            Spacer()
                        }
                    }
                }
                .animation(.easeInOut, value: pageIndex)
                .tabViewStyle(.page)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .onAppear {
                    dotAppearance.currentPageIndicatorTintColor = .black
                    dotAppearance.pageIndicatorTintColor = .gray
                }
            }
        }
    }

    func incrementPage() {
        if pageIndex < pages.indices.last! {
            pageIndex += 1
        }
    }

    func goToZero() {
        pageIndex = 0
    }
}

@available(iOS 17.0, *)
struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var showOnboarding = true

    var body: some View {
        Group {
            if showOnboarding {
                // Affichez l'OnboardingView avant la LoginView
                OnboardingView()
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name("NavigateToLoginView")), perform: { _ in
                        self.showOnboarding = false
                    })
            } else if let userSession = viewModel.userSession {
                // L'utilisateur est connecté, affichez la TabView
                TabView {
                    Home()
                        .tabItem {
                            Label("Home", systemImage: "house.fill")
                        }
                    Search()
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass.circle.fill")
                        }
                    Message()
                        .tabItem {
                            Label("Message" , systemImage: "message.fill")
                        }
                    Actualités()
                        .tabItem {
                            Label("Actualités" , systemImage: "bell.fill")
                        }
                    Profil()
                        .tabItem {
                            Label("Profil", systemImage: "person.fill")
                        }
                }
            } else {
                // L'utilisateur n'est pas connecté, affichez la LoginView
                LoginView()
            }
        }
    }
}

@available(iOS 17.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
