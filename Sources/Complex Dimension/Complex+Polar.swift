public import Complex
public import Dimension
public import Numeric
public import Tagged

extension Tagged
where Tag == Complex.Number<Underlying>.Phase,
    Underlying: BinaryFloatingPoint & Numeric.Transcendental
{

    /// The complex phase expressed as a dimensioned radian value.
    @inlinable
    public var radians: Radian<Underlying> {
        Radian(_unchecked: underlying)
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
