import Complex
import Complex_Dimension
import Angle
import Numeric
import Tagged
import Testing

@Suite
struct ComplexPolarTests {

    @Test
    func phase() {

        let z1 = Complex.Number(1.0, 1.0)
        let phase1 = z1.polar.phase
        #expect(abs(phase1.underlying - (Double.pi / 4)) < 1e-10)

        let z2 = Complex.Number(1.0, 0.0)
        let phase2 = z2.polar.phase
        #expect(abs(phase2.underlying - (0.0)) < 1e-15)

        let z3 = Complex.Number(0.0, 1.0)
        let phase3 = z3.polar.phase
        #expect(abs(phase3.underlying - (Double.pi / 2)) < 1e-10)
    }

    @Test
    func phaseStatic() {
        let z = Complex.Number(1.0, 1.0)
        let phase = Complex.Number.Polar.phase(of: z)
        #expect(abs(phase.underlying - (Double.pi / 4)) < 1e-10)
    }

    @Test
    func polarConstruction() {
        let length = Complex.Number<Double>.Modulus.Value(_unchecked: 5.0)
        let phase: Radian<Double> = .pi.quarter

        let z = Complex.Number(length: length, phase: phase)

        let expectedValue = 5.0 * Double.math.sqrt(2.0) / 2.0
        #expect(z.real.equals.approximate(expectedValue.real, tolerance: 1e-10))
        #expect(z.imaginary.equals.approximate(expectedValue.i, tolerance: 1e-10))
    }

    @Test
    func polarRoundTrip() {
        let original = Complex.Number(3.0, 4.0)
        let length = original.polar.length
        let phase = original.polar.phase

        let reconstructed = Complex.Number(length: length, phase: phase)
        #expect(reconstructed.real.equals.approximate(original.real, tolerance: 1e-10))
        #expect(reconstructed.imaginary.equals.approximate(original.imaginary, tolerance: 1e-10))
    }

}
