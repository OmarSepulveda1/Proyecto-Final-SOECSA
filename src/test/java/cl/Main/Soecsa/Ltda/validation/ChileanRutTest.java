package cl.Main.Soecsa.Ltda.validation;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import org.junit.jupiter.api.Test;

class ChileanRutTest {

    @Test
    void normalizesValidRutWithDotsAndLowercaseCheckDigit() {
        assertEquals("12345678-5", ChileanRut.normalize("12.345.678-5"));
        assertEquals("11111112-K", ChileanRut.normalize("11.111.112-k"));
    }

    @Test
    void rejectsInvalidCheckDigitsAndMalformedValues() {
        assertNull(ChileanRut.normalize("12.345.678-4"));
        assertNull(ChileanRut.normalize("12345678X5"));
        assertNull(ChileanRut.normalize(null));
    }
}
