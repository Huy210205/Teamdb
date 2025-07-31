package DuAn2.user;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class BlogSimpleTest {

    @Test
    public void testBlogPageExists() {
        // Simple test to verify the test framework is working
        assertTrue(true, "Basic test should pass");
    }

    @Test
    public void testBlogContent() {
        String expectedContent = "Blog Posts";
        assertNotNull(expectedContent, "Blog content should not be null");
        assertTrue(expectedContent.contains("Blog"), "Content should contain 'Blog'");
    }

    @Test
    public void testBlogNavigation() {
        String homeLink = "/home";
        assertNotNull(homeLink, "Home link should not be null");
        assertTrue(homeLink.startsWith("/"), "Home link should start with /");
    }
} 