// Introduction to Software Testing
// Authors: Paul Ammann & Jeff Offutt
// Chapter 6; page ??
// JUnit for java.util.Iterator interface

import static org.junit.Assert.*;
import org.junit.*;
import java.util.*;

/**
 * This class contains 13 JUnit tests for the Iterator interface. The tests are derived from an
 * IDM (input domain modeling) based on the JavaDoc API for Iterator.
 * The three methods tested are: hasNext(), next(), remove()
 * The following characteristics have been identified and are used to generate tests for the methods: 
 * C1: iterator has more values 
 * C2: iterator returns a non-null object reference 
 * C3: remove() is supported
 * C4: remove() precondition is satisfied
 * C5: collection in consistent state while iterator in use 
 * Each characteristic has a boolean partition
 */

public class IteratorTest {

    private List<String> list;          // test fixture
    private Iterator<String> itr;       // test fixture

    @Before public void setUp()         // set up test fixture
    {
        list = new ArrayList<String>();
        list.add ("cat");
        list.add ("dog");
        itr = list.iterator();
    }

    // 3 Tests for Iterator method hasNext()
    //  The 2 characteristics associated with hasNext() are: C1, C5

    // Test 1 of hasNext(): testHasNext_BaseCase():  C1-T, C5-T
    @Test public void testHasNext_BaseCase()
    {
        assertTrue (itr.hasNext());
    }

    // Test 2 of hasNext(): testHasNext_C1(): C1-F, C5-T
    @Test public void testHasNext_C1()
    {
        itr.next(); itr.next();        // consume the cat and the dog
        assertFalse (itr.hasNext());    // now empty
    }

    // Test 3 of hasNext(): testHasNext_C5(): C1-T, C5-F
    // This test fails!
    // The reason is that standard Java implementations of the Iterator
    // interface are not consistent in their use of ConcurrentModificationException.
    @Test(expected=ConcurrentModificationException.class)
    public void testHasNext_C5()
    {
        list.add ("elephant");
        itr.hasNext();
    }


    // 4 Tests for Iterator method next()
    // The 3 characteristics associated with next() are: C1, C2, C5

    // Test 1 of next(): testNext_BaseCase(): C1-T, C2-T, C5-T
    @Test public void testNext_BaseCase()
    {
        assertEquals ("cat", itr.next());
    }

    // Test 2 of next(): testNext_C1(): C1-F, C2-F, C5-T
    @Test(expected=NoSuchElementException.class)
    public void testNext_C1()
    {
        itr.next(); itr.next();        // consume the cat and the dog
        itr.next();                    // now empty
    }

    // Test 3 of next(): testNext_C2(): C1-T, C2-F, C5-T
    @Test public void testNext_C2()
    {
        list = new ArrayList<String>();
        list.add (null);
        itr = list.iterator();
        assertNull (itr.next());
    }

    // Test 4 of next(): testNext_C5(): C1-T, C2-F, C5-F
    @Test(expected=ConcurrentModificationException.class)
    public void testNext_C5()
    {
        list.add ("elephant");
        itr.next();
    }


    // 6 Tests for Iterator method remove()
    // The 5 characteristics associated with remove() are: C1, C2, C3, C4, C5, C6

    // Test 1 of remove(): testRemove_BaseCase(): C1-T, C2-T, C3-T, C4-T, C5-T, C6-T
    @Test public void testRemove_BaseCase()
    {
        itr.next();
        itr.remove();
        assertFalse (list.contains ("cat"));
    }

    // Test 2 of remove(): testRemove_C1(): C1-F, C2-F, C3-T, C4-T, C5-T, C6-T
    @Test public void testRemove_C1()
    {
        itr.next(); itr.next();        // consume the cat and the dog
        itr.remove();                  // remove dog from list.
        assertFalse (list.contains ("dog"));
    }

    // Test 3 of remove(): testRemove_C2(): C1-T, C2-F, C3-T, C4-T, C5-T, C6-T
    @Test public void testRemove_C2()
    {
        list.add (null);
        list.add ("elephant");
        itr = list.iterator();
        itr.next(); itr.next();        // consume the cat and the dog
        itr.next();        // consume null; iterator not empty
        itr.remove();      // remove null from list
        assertFalse (list.contains (null));
    }

    // Test 4 of remove(): testRemove_C3(): C1-T, C2-T, C3-F, C4-T, C5-T, C6-T
    @Test(expected=UnsupportedOperationException.class)
    public void testRemove_C3()
    {
        list = Collections.unmodifiableList (list);
        itr = list.iterator();
        itr.next();   // consume first element to make C4 true
        itr.remove();
    }

    // Test 5 of remove(): testRemove_C4(): C1-T, C2-T, C3-T, C4-F, C5-T, C6-T
    @Test (expected=IllegalStateException.class)
    public void testRemove_C4()
    {
        itr.remove();
    }


    // Test 6 of next(): testRemove_C5(): C1-T, C2-T, C3-T, C4-T, C5-F, C6-T
    @Test (expected=ConcurrentModificationException.class)
    public void testRemove_C5()
    {
        itr.next();
        list.add ("elephant");
        itr.remove();
    }

    // Test 7 of next(): testRemove_C6(): C1-T, C2-T, C3-T, C4-T, C5-T, C6-F
    @Test (expected = IllegalStateException.class)
    public void testRemove_C6()
    {
        itr.next();
        itr.next();
        itr.remove();
        itr.remove();
    }
}