import org.junit.*;

import java.util.Arrays;
import java.util.Comparator;

import static org.junit.Assert.*;

public class ObjectsTest {
    /**
     * test for constructor {@code Objects}
     */
    @Test
    public void testObjects0() {
        int desiredValue = 1;
        Objects objects = new Objects(1);
        assertEquals("Construtor", desiredValue, objects.foo);
    }

    /**
     *  Test for {@code equals}
     */
    @Test
    public void testEquals0() {
        String a = "abc";
        String b = a;
        assertTrue("equals", Objects.equals(a, b));
    }

    @Test
    public void testEquals1() {
        Foo foo = new Foo(1, "hello");
        Foo foo1 = new Foo(1, "world");
        assertTrue("equals", Objects.equals(foo, foo1));

    }

    @Test
    public void testEquals3() {
        String a = "123";
        String b = "abc";
        assertFalse("equals", Objects.equals(a, b));
    }

    @Test
    public void testEquals4() {
        Object a = null;
        Object b = null;
        assertTrue("equals", Objects.equals(a, b));
    }

    @Test
    public void testEquals5() {
        String a = null;
        String b = "abc";
        assertFalse(Objects.equals(a, b));
    }

    @Test
    public void testEquals6() {
        Foo foo = new Foo(1, "hello");
        Foo foo1 = new Foo(2, "world");
        assertFalse("equals", Objects.equals(foo, foo1));
    }

    /**
     * Test for {@code deepEquals}
     */
    @Test
    public void testDeepEquals0() {
        Object a = null;
        Object b = null;
        assertTrue("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals1() {
        Foo foo = new Foo(1, "abc");
        Foo foo1 = null;
        assertFalse("deep equals", Objects.deepEquals(foo, foo1));
    }

    @Test
    public void testDeepEquals2() {
        Foo foo1 = new Foo(1, "abc");
        Foo foo = null;
        assertFalse("deep equals", Objects.deepEquals(foo, foo1));
    }

    @Test
    public void testDeepEquals3() {
        Foo foo = new Foo(1, "abc");
        Foo foo1 = foo;
        assertTrue("deep equals", Objects.deepEquals(foo, foo1));
    }

    @Test
    public void testDeepEquals4() {
        Object[] a = {"abc", "cde"};
        Object[] b = {"abc", "cde"};
        assertTrue("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals5() {
        Object[] a = {"abc", "cde"};
        Object[] b = {"abc"};
        assertFalse("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals6() {
        Object[] a = {"abc", "cde"};
        Object[] b = {"abc", "xyz"};
        assertFalse("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals7() {
        byte[] a = {0, 1, 2};
        byte[] b = {0, 1, 2};
        assertTrue("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals8() {
        byte[] a = {0, 1, 2};
        byte[] b = {0, 1};
        assertFalse("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals9() {
        byte[] a = {0, 1, 2};
        byte[] b = {0, 2, 3};
        assertFalse("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals10() {
        Object[] a = {"abc", "edf"};
        byte[] b = {0, 1, 2};
        assertFalse("deep equals", Objects.deepEquals(a, b));
    }

    @Test
    public void testDeepEquals11() {
        Object[] a = {"abc", "edf"};
        byte[] b = {0, 1, 2};
        assertFalse("deep equals", Objects.deepEquals(b, a));
    }

    /**
     * test for {@code hashCode}
     */
    @Test
    public void testHashCode0() {
        Object a = null;
        assertEquals(0, Objects.hashCode(a));
    }

    @Test
    public void testHashCode1() {
        String a = "abc";
        String b = a;
        assertEquals(Objects.hashCode(a), Objects.hashCode(b));
    }

    /**
     * test for {@code hash}
     */
    @Test
    public void testHash0() {
        Foo foo = new Foo(1, "abc");
        Object[] a = {1, "abc"};
        assertEquals("hash", Arrays.hashCode(a), Objects.hash(foo.a, foo.b));
    }

    /**
     * test for {@code toString}
     */
    @Test
    public void testToString0_0() {
        String a = null;
        assertEquals("toString()", "null", Objects.toString(a));
    }

    @Test
    public void testToString0_1() {
        String a = "abc";
        assertEquals("toString()", "abc", Objects.toString(a));
    }

    @Test
    public void testToString0_2() {
        Foo foo = new Foo(1, "abc");
        assertEquals("toString()", "1abc", Objects.toString(foo));
    }

    /**
     * test for {@code toString} with nullDefault
     */
    @Test
    public void testToString1_0() {
        String a = null;
        assertEquals("toString()", "null default", Objects.toString(a, "null default"));
    }

    @Test
    public void testToString1_1() {
        String a = "abc";
        assertEquals("toString()", "abc", Objects.toString(a, "null default"));
    }

    @Test
    public void testToString1_2() {
        Foo foo = new Foo(1, "abc");
        assertEquals("toString()", "1abc", Objects.toString(foo, "null default"));
    }

    /**
     * test for {@code compare}
     */
    @Test
    public void testCompare0() {
        String a = null;
        String b = null;
        assertEquals("compare", 0, Objects.compare(a, b, new StringComparator()));
    }

    @Test
    public void testCompare1() {
        String a = null;
        String b = "abc";
        assertEquals("compare", -b.length(), Objects.compare(a, b, new StringComparator()));
    }

    @Test
    public void testCompare2() {
        String a = "abc";
        String b = null;
        assertEquals("compare", a.length(), Objects.compare(a, b, new StringComparator()));
    }

    @Test
    public void testCompare3() {
        String a = "abc";
        String b = "abcdef";
        assertEquals("compare", a.length() - b.length(), Objects.compare(a, b, new StringComparator()));
    }

    /**
     * test for {@code requireNonNull}
     */
    @Test(expected = NullPointerException.class)
    public void testRequireNonNull0_0() {
        Foo foo = null;
        Objects.requireNonNull(foo);
    }

    @Test
    public void testRequireNonNull0_1() {
        Foo foo = new Foo(1, "abc");
        assertEquals("requireNonNull", Objects.requireNonNull(foo), foo);
    }

    /**
     * test for {@code requireNonNull} with message
     */
    @Test(expected = NullPointerException.class)
    public void testRequireNonNull1_0() {
        try {
            Foo foo = null;
            Objects.requireNonNull(foo, "foo is null");
        } catch (NullPointerException ex) {
            final String msg = "foo is null";
            assertEquals(msg, ex.getMessage());
            throw ex;
        }
        fail("exception did not throw!");
    }

    @Test
    public void testRequireNonNull1_1() {
        Foo foo = new Foo(1, "abc");
        assertEquals(foo, Objects.requireNonNull(foo, "foo is null"));
    }
}

class StringComparator implements Comparator<String> {

    @Override
    public int compare(String o1, String o2) {
        if (o1 == null)
            return -o2.length();
        if (o2 == null)
            return o1.length();
        return o1.length() - o2.length();
    }
}