public import Complex
public import Dimension
public import Real
public import Tagged

extension Complex.Number.Polar where Scalar: BinaryFloatingPoint & Numeric.Transcendental {

    @inlinable
    public static func phase(of z: Complex.Number<Scalar>) -> Radian<Scalar> {
        Radian(_unchecked: Scalar._atan2(z.imaginary._value, z.real._value))
    }

    @inlinable
    public var phase: Radian<Scalar> {
        Self.phase(of: complex)
    }
}

extension Complex.Number where Scalar: BinaryFloatingPoint & Numeric.Transcendental {

    @inlinable
    public init(length: Complex.Number<Scalar>.Modulus.Value, phase: Radian<Scalar>) {
        let r = length.underlying
        let theta = phase.underlying
        self.init(
            r * Scalar._cos(theta),
            r * Scalar._sin(theta)
        )
    }
}
