//
//  OnboardingView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    let pages = [
        OnboardingPageView(image: R.image.onboarding_1.swiftUI, title: R.string.localizable.onboarding_title1(), subtitle: R.string.localizable.onboarding_subtitle1()),
        OnboardingPageView(image: R.image.onboarding_2.swiftUI, title: R.string.localizable.onboarding_title2(), subtitle: R.string.localizable.onboarding_subtitle2()),
        OnboardingPageView(image: R.image.onboarding_3.swiftUI, title: R.string.localizable.onboarding_title3(), subtitle: R.string.localizable.onboarding_subtitle3())
    ]
    
    @State private var currentPageIndex = 0
    
    var isLastPagePresented: Bool {
        currentPageIndex + 1 == pages.count
    }
    
    func nextButtonAction() {
        if isLastPagePresented {
            UserAuthenticationManager.shared.isOnboardingPresented = true
        } else {
            self.currentPageIndex += 1
        }
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            HStack {
                
                Spacer()
                
                Button(R.string.localizable.onboarding_skip()) {
                    UserAuthenticationManager.shared.isOnboardingPresented = true
                }
                .foregroundColor(R.color.dodger_blue.swiftUI)
                .font(.body)
                .disabled(isLastPagePresented)
                .opacity(isLastPagePresented ? 0 : 1)
                .animation(.default)
            }
            .padding(24)
            
            TabView(selection: $currentPageIndex) {
                ForEach(0..<pages.count, id: \.self) { index in
                    pages[index].tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .animation(.default, value: currentPageIndex)
            
            HStack {
                
                PageControlRepresentation(numberOfPages: pages.count, currentPage: $currentPageIndex)
                    .frame(width: 46, height: 20)
                
                Spacer()
                
                Button(isLastPagePresented ? R.string.localizable.onboarding_start() : R.string.localizable.onboarding_next()) {
                    nextButtonAction()
                }
                .foregroundColor(R.color.dodger_blue.swiftUI)
                .font(.body)
            }
            .padding(24)
        }
        .edgesIgnoringSafeArea(.horizontal)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
