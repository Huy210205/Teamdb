package DuAn2.user;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit.jupiter.SpringJUnitExtension;
import org.springframework.test.web.servlet.MockMvc;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(SpringJUnitExtension.class)
@WebMvcTest(PageController.class)
public class BlogControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testBlogPage_ShouldReturnBlogView() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(view().name("blog"))
                .andExpect(model().attributeExists("pageContext"));
    }

    @Test
    public void testBlogSinglePage_ShouldReturnBlogSingleView() throws Exception {
        mockMvc.perform(get("/blog-single"))
                .andExpect(status().isOk())
                .andExpect(view().name("blog-single"));
    }

    @Test
    public void testBlogPage_ShouldContainExpectedContent() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Blog Posts")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("How to make best holiday with your family")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Natural relaxation - Hotel SPA & Wellness")));
    }

    @Test
    public void testBlogPage_ShouldHaveCorrectLinks() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("href=\"blog-single\"")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("href=\"/home\"")));
    }

    @Test
    public void testBlogPage_ShouldHavePagination() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("pagination")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Previous")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Next")));
    }
} 