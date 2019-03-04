import org.junit.*;
import static org.junit.Assert.*;

public class CalcTest {
    @Test public void testAdd(){
        assertTrue("Calc sum is incorrect", 5 == Calc.add(2, 3));
    }

    @Test public void testAnotherAdd(){
        assertTrue("Calc sum is incorrect", 8 == Calc.add(1, 7));
    }

    //sub-1: First failing test for subtraction
    //sub-2: Make first test pass
    @Test public void testSubtract(){
        assertTrue("Calc sub is incorrect", 2 == Calc.sub(4, 2));
    }

    //sub-3: Triangulate with another value
    @Test public void testAnotherSubtract(){
        assertTrue("Calc sub is incorrect", 1 == Calc.sub(3, 2));
    }

    //mul-1: first failing test for multiply
    //mul-2: make first test pass
    @Test public void testMultiply(){
        assertTrue("Multiply is incorrect", 8 == Calc.mul(2, 4));
    }

    //mul-3: Triangulate with another value
    @Test public void testAnotherMul(){
        assertTrue("Calc mul is incorrect", 12 == Calc.mul(3, 4));
    }

    //div-1: first failing test
    //div-2: make first test pass
    @Test public void testDiv() throws Exception{
        assertTrue("Div is incorrect", 2 == Calc.div(8, 4));
    }

    //div-3: triangulate with another value
    @Test public void testAnotherSub() throws Exception{
        assertTrue("Div is incorrect", 3 == Calc.div(9, 3));
    }

    //div-4: triangulate with another data type
    @Test public void testAnotherTypeDiv () throws Exception{
        assertTrue("Div is incorrect", 2.5 == Calc.div(5, 2));
    }

    //div-5: triangulate with an div by 0 exception
    @Test(expected = Exception.class)
    public void testException() throws Exception{
        Calc.div(5, 0);
    }

}