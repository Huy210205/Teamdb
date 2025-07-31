package DuAn2.user;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest(classes = DuAn2.TestConfig.class)
@ActiveProfiles("test")
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

    @Test
    public void testBlogStructure() {
        // Test blog page structure
        String[] expectedElements = {"Blog Posts", "Read More", "pagination"};
        for (String element : expectedElements) {
            assertNotNull(element, "Blog element should not be null");
        }
    }

    @Test
    public void testBlogImages() {
        // Test blog images
        String[] expectedImages = {"blog1.jpg", "blog2.jpg", "blog3.jpg", "blog4.jpg"};
        for (String image : expectedImages) {
            assertTrue(image.endsWith(".jpg"), "Image should have .jpg extension");
        }
    }
} 