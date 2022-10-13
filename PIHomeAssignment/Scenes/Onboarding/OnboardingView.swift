//
//  OnboardingView.swift
//  PIHomeAssignment
//
//  Created by Svyat Zubyak on 13.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    let pages = [
        OnboardingPageView(image: R.image.onboarding_icon_page_1.swiftUI, title: R.string.localizable.onboarding_title1(), subtitle: R.string.localizable.onboarding_subtitle1()),
        OnboardingPageView(image: R.image.onboarding_icon_page_2.swiftUI, title: R.string.localizable.onboarding_title2(), subtitle: R.string.localizable.onboarding_subtitle2()),
        OnboardingPageView(image: R.image.onboarding_icon_page_3.swiftUI, title: R.string.localizable.onboarding_title3(), subtitle: R.string.localizable.onboarding_subtitle3())
    ]
    
    @State private var currentPageIndex = 0
    
    var isLastPagePresented: Bool {
        currentPageIndex + 1 == pages.count
    }
    
    func continueButtonAction() {
        if isLastPagePresented {
            OnboardingPresentationManager.shared.isOnboardingPresented = true
        } else {
            currentPageIndex += 1
        }
    }
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            R.color.midnight_express.swiftUI
            
            TabView(selection: $currentPageIndex) {
                ForEach(0..<pages.count, id: \.self) { index in
                    pages[index].tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            .animation(.default, value: currentPageIndex)
            
            Button(action: continueButtonAction) {
                Text(R.string.localizable.onboarding_continue())
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .semibold))
            }
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(Gradients.pink)
            .cornerRadius(28)
            .padding(.horizontal, 40)
            .padding(.bottom, 119)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
