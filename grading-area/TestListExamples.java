import static org.junit.Assert.*;
import org.junit.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

class IsMoon implements StringChecker {
  public boolean checkString(String s) {
    return s.equalsIgnoreCase("moon");
  }
}

public class TestListExamples {
  @Test(timeout = 500)
  public void testMergeRightEnd() {
    List<String> left = Arrays.asList("a", "b", "c");
    List<String> right = Arrays.asList("a", "d");
    List<String> merged = ListExamples.merge(left, right);
    List<String> expected = Arrays.asList("a", "a", "b", "c", "d");
    assertEquals(expected, merged);
  }
   @Test
    public void testFilter() {
        List<String> input = new ArrayList<String> (Arrays.asList("MOON", "apple", "moon", "banana", "orange", "cat", "dog", "MoOn"));
        IsMoon sc = new IsMoon();
        List<String> expected = Arrays.asList("MOON", "moon", "MoOn");
        assertEquals(expected, ListExamples.filter(input, sc));
    }

    @Test(timeout = 500)
    public void testMerge() {
        List<String> input1 = new ArrayList<String> (Arrays.asList("a"));
        List<String> input2 = new ArrayList<String> (Arrays.asList("a", "b"));
        List<String> actual = ListExamples.merge(input1, input2);
        List<String> expected = Arrays.asList("a", "a", "b");
        assertEquals(expected, actual);

    }
}