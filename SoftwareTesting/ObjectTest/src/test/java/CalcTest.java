import org.junit.*;
import static org.junit.Assert.*;

public class CalcTest {
    @Test public void testAdd(){
        Calc calc = new Calc();
        assertTrue("Calc sum is incorrect", 5 == calc.add(2, 3));
    }

    @Test public void testAnotherAdd(){
        Calc calc = new Calc();
        assertTrue("Calc sum is incorrect", 8 == calc.add(1, 7));
    }

    //sub-1: First failing test for subtraction
    //sub-2: Make first test pass
    @Test public void testSubtract(){
        Calc calc = new Calc();
        assertTrue("Calc sub is incorrect", 2 == calc.sub(4, 2));
    }

    //sub-3: Triangulate with another value
    @Test public void testAnotherSubtract(){
        Calc calc = new Calc();
        assertTrue("Calc sub is incorrect", 1 == calc.sub(3, 2));
    }

    //mul-1: first failing test for multiply
    //mul-2: make first test pass
    @Test public void testMultiply(){
        Calc calc = new Calc();
        assertTrue("Multiply is incorrect", 8 == calc.mul(2, 4));
    }

    //mul-3: Triangulate with another value
    @Test public void testAnotherMul(){
        Calc calc = new Calc();
        assertTrue("Calc mul is incorrect", 12 == calc.mul(3, 4));
    }

    //div-1: first failing test
    //div-2: make first test pass
    @Test public void testDiv() throws Exception{
        Calc calc = new Calc();
        assertTrue("Div is incorrect", 2 == calc.div(8, 4));
    }

    //div-3: triangulate with another value
    @Test public void testAnotherSub() throws Exception{
        Calc calc = new Calc();
        assertTrue("Div is incorrect", 3 == calc.div(9, 3));
    }

    //div-4: triangulate with another data type
    @Test public void testAnotherTypeDiv () throws Exception{
        Calc calc = new Calc();
        assertTrue("Div is incorrect", 2.5 == calc.div(5, 2));
    }

    //div-5: triangulate with an div by 0 exception
    @Test(expected = Exception.class)
    public void testException() throws Exception{
        Calc calc = new Calc();
        calc.div(5, 0);
    }

}