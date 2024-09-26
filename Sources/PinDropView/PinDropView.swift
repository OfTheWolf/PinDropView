//
//  PinDropView.swift
//  PinDropView
//
//  Created by Ugur Bozkurt on 26/09/2024.
//

import UIKit

@IBDesignable
public class PinDropView: UIView {

    @IBInspectable public var fillColor: UIColor = .link
    @IBInspectable public var borderColor: UIColor = .white
    @IBInspectable public var borderWidth: CGFloat = 4
    @IBInspectable public var icon: UIImage = UIImage(systemName: "mappin")!
    @IBInspectable public var iconColor: UIColor = .white

    public var didTapHandler: (() -> Void)?

    public var identifier: String? = nil

    @objc private func didTapPin() {
        didTapHandler?()
    }

    public override func draw(_ rect: CGRect) {

        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        ctx.saveGState()
        let offset = CGSize.zero
        let blur: CGFloat = 5.0
        let color = UIColor.black.withAlphaComponent(0.1)

        ctx.setShadow(offset: offset, blur: blur, color: color.cgColor)

        let rect = rect.insetBy(dx: blur/2, dy: blur/2)

        let ovalSize = rect.width > rect.height ? rect.height : rect.width

        let pinTailSize: CGFloat = ovalSize * 0.12

        let ovalBounds = CGRect(x: rect.midX - ovalSize / 2, y: rect.midY - (ovalSize + pinTailSize) / 2, width: ovalSize, height: ovalSize)
            .insetBy(dx: pinTailSize, dy: pinTailSize)

        fillColor.setFill()
        borderColor.setStroke()

        let borderPath = UIBezierPath()

        let tailPath = UIBezierPath()
        tailPath.move(to: .init(x: ovalBounds.minX + pinTailSize/2, y: ovalBounds.midY))
        tailPath.addLine(to: .init(x: ovalBounds.midX, y: ovalBounds.maxY + pinTailSize))
        tailPath.addLine(to: .init(x: ovalBounds.maxX-pinTailSize/2, y: ovalBounds.midY))
        tailPath.close()

        let oval = UIBezierPath(ovalIn: ovalBounds)
        oval.fill()
        oval.close()

        oval.append(tailPath)
        tailPath.fill()

        borderPath.append(tailPath)
        borderPath.append(oval)
        borderPath.lineWidth = borderWidth
        borderPath.stroke()
        borderPath.fill()

        ctx.restoreGState()

        let icon = icon
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: ovalBounds.width * 0.5))
            .withTintColor(iconColor)
        let iconPoint = CGPoint(x: ovalBounds.midX - icon.size.width/2, y: ovalBounds.midY-icon.size.height/2)
        icon.draw(at: iconPoint)
    }
}

