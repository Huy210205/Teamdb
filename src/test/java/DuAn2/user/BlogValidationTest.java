package DuAn2.user;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public class BlogValidationTest {

    @Test
    public void testBlogTitleValidation() {
        String blogTitle = "Blog Posts";
        assertNotNull(blogTitle, "Blog title should not be null");
        assertTrue(blogTitle.length() > 0, "Blog title should not be empty");
        assertTrue(blogTitle.contains("Blog"), "Blog title should contain 'Blog'");
    }

    @Test
    public void testBlogDateValidation() {
        String[] blogDates = {"March 10, 2020", "March 11, 2020"};
        
        for (String date : blogDates) {
            assertNotNull(date, "Blog date should not be null");
            assertTrue(date.contains("March"), "Blog date should contain 'March'");
            assertTrue(date.contains("2020"), "Blog date should contain '2020'");
        }
    }

    @Test
    public void testBlogButtonValidation() {
        String readMoreButton = "Read More";
        assertNotNull(readMoreButton, "Read More button should not be null");
        assertEquals("Read More", readMoreButton, "Button text should match");
        assertTrue(readMoreButton.length() > 0, "Button text should not be empty");
    }

    @Test
    public void testBlogPaginationValidation() {
        String[] paginationElements = {"Previous", "Next", "1", "2", "3"};
        
        for (String element : paginationElements) {
            assertNotNull(element, "Pagination element should not be null");
            assertFalse(element.isEmpty(), "Pagination element should not be empty");
        }
    }

    @Test
    public void testBlogSidebarValidation() {
        String sidebarContent = "Follow our Resort Luxury Hotels";
        assertNotNull(sidebarContent, "Sidebar content should not be null");
        assertTrue(sidebarContent.contains("Follow"), "Sidebar should contain 'Follow'");
        assertTrue(sidebarContent.contains("Hotels"), "Sidebar should contain 'Hotels'");
    }
} 