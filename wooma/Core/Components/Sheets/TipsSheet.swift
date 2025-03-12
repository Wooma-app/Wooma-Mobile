import SwiftUI

// Renamed from PhotoTipsSheet to TipsSheet to be more generic
struct TipsSheet: View {
    @Binding var isShowing: Bool
    let spaceName: String
    let sheetType: TipsSheetType // New property to determine the type of tips to show
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottom) {
                // Background overlay
                if isShowing {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            isShowing = false
                        }
                }
                
                // Sheet content
                VStack(spacing: 0) {
                    // Handle indicator
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 40, height: 5)
                        .cornerRadius(2.5)
                        .padding(.top, 12)
                        .padding(.bottom, 16)
                    
                    // Close button
                    HStack {
                        Button(action: {
                            isShowing = false
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 24))
                                .foregroundColor(.green)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    
                    // Title (changes based on sheet type)
                    Text(sheetType.title)
                        .font(.custom("SofiaSans-Bold", size: 28))
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal, 24)
                        .padding(.top, 8)
                        .padding(.bottom, 16)
                    
                    // Content in a ScrollView
                    ScrollView {
                        VStack(alignment: .leading, spacing: 16) {
                            // Content changes based on sheet type
                            if sheetType == .photo {
                                // Photo tips sections
                                TipSectionView(title: "General", tips: [
                                    Tip(icon: "🌟", title: "Stand in each corner—", description: "Capture walls, floors, ceilings, and key features like windows and doors."),
                                    Tip(icon: "📸", title: "Take more than you think you need—", description: "Up to 25 photos per space ensures nothing is missed."),
                                    Tip(icon: "🖼️", title: "Frame the whole room—", description: "Use wide shots to give a clear view of the layout and condition.")
                                ])
                                
                                TipSectionView(title: "Lighting", tips: [
                                    Tip(icon: "☀️", title: "Use natural light where possible—", description: "Open curtains and blinds to let in daylight for clearer shots."),
                                    Tip(icon: "💡", title: "Turn on all lights—", description: "Light up dim corners to ensure everything is visible."),
                                    Tip(icon: "🌙", title: "Avoid taking photos at night—", description: "Natural light will show true colours and textures better.")
                                ])
                                
                                TipSectionView(title: "Positioning", tips: [
                                    Tip(icon: "↔️️", title: "Keep your camera level—", description: "Straight angles avoid distortion and show the room as it really is."),
                                    Tip(icon: "⬆️", title: "Capture ceilings and floors—", description: "Don't skip areas that often show wear, like skirting boards or flooring."),
                                    Tip(icon: "🔍", title: "Focus on key features—", description: "Include things like built-in furniture, light fixtures, or unique design elements.")
                                ])
                                
                                TipSectionView(title: "Quality", tips: [
                                    Tip(icon: "📵", title: "Turn off flash—", description: "It can cause glare and harsh shadows, especially on reflective surfaces."),
                                    Tip(icon: "🔄", title: "Keep your hands steady—", description: "Use both hands or lean on something stable to avoid blurry shots."),
                                    Tip(icon: "🚫", title: "Avoid filters or edits—", description: "Stick to raw, unaltered photos to preserve accuracy.")
                                ])
                            } else {
                                // Issue tips sections
                                TipSectionView(title: "General", tips: [
                                    Tip(icon: "🖼️", title: "Walls—", description: "Look for cracks, scuff marks, peeling paint, or damp patches."),
                                    Tip(icon: "✔️", title: "Ceiling—", description: "Check for leaks, cracks, peeling paint, or water stains."),
                                    Tip(icon: "✔️", title: "Flooring—", description: "Inspect for scratches, stains, frayed carpet, or loose tiles."),
                                    Tip(icon: "🚪", title: "Doors—", description: "Test locks, handles, and look for dents, scuffs, or misaligned tiles."),
                                    Tip(icon: "🪟", title: "Windows—", description: "Check for drafts, cracked panes, stuck frames, or poor seals.")
                                ])
                                
                            }
                        }
                        .padding(.bottom, 15)
                    }
                    
                    // Got it button
                    BottomButtonView(
                        text: "Got it",
                        action: {
                            isShowing = false
                        },
                        showArrow: false
                    )
                }
                .frame(height: geometry.size.height) // 90% of screen height
                .background(Color.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                .offset(y: isShowing ? 0 : geometry.size.height)
                .animation(.spring(response: 0.3, dampingFraction: 0.8), value: isShowing)
            }
        }
    }
}

// New enum to define the type of tips sheet
enum TipsSheetType {
    case photo
    case issue
    
    var title: String {
        switch self {
        case .photo:
            return "Get the best shots: Top tips for snapping your space"
        case .issue:
            return "Find issues in your space like a pro"
        }
    }
}

// Helper structs (unchanged)
struct Tip: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
    let description: String
}

struct TipSectionView: View {
    let title: String
    let tips: [Tip]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("SofiaSans-Bold", size: 18))
                .padding(.top, 12)
                .padding(.bottom, 4)
                .padding(.horizontal, 16)
            
            ForEach(0..<tips.count, id: \.self) { index in
                let tip = tips[index]
                VStack(spacing: 0) {
                    HStack(alignment: .center, spacing: 16) {
                        // Custom icons based on what's in the screenshot
                        Group {
                            if tip.title.starts(with: "Walls") {
                                Image(systemName: "photo.on.rectangle")
                                    .font(.system(size: 16))
                                    .foregroundColor(.green)
                            } else if tip.title.starts(with: "Ceiling") {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            } else if tip.title.starts(with: "Flooring") {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 16))
                                    .foregroundColor(.gray)
                            } else if tip.title.starts(with: "Doors") {
                                Image(systemName: "door.left.hand.closed")
                                    .font(.system(size: 16))
                                    .foregroundColor(.brown)
                            } else if tip.title.starts(with: "Windows") {
                                Image(systemName: "square.grid.2x2")
                                    .font(.system(size: 16))
                                    .foregroundColor(.brown)
                            } else {
                                Text(tip.icon)
                                    .font(.system(size: 16))
                            }
                        }
                        .frame(width: 24, height: 24)
                        .background(Color.clear)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(tip.title)
                                .font(.custom("SofiaSans-Bold", size: 18))
                                + Text(tip.description)
                                .font(.custom("SofiaSans-Regular", size: 18))
                        }
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 16)
                    
                    // Add divider if not the last item
                    if index < tips.count - 1 {
                        Divider()
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 1)
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
    }
}
