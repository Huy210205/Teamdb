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
public class BlogJspTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    public void testBlogJsp_ShouldHaveCorrectStructure() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("<section class=\"w3l-breadcrumb\">")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("<section class=\"w3l-blog py-5\">")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("<div class=\"grids5-info\">")));
    }

    @Test
    public void testBlogJsp_ShouldHaveCorrectImages() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog1.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog2.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog3.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog4.jpg")));
    }

    @Test
    public void testBlogJsp_ShouldHaveCorrectDates() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("March 10, 2020")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("March 11, 2020")));
    }

    @Test
    public void testBlogJsp_ShouldHaveReadMoreButtons() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Read More")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("btn btn-news")));
    }

    @Test
    public void testBlogJsp_ShouldHaveSidebarContent() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Follow our")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Resort Luxury Hotels")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Family Rooms")));
    }

    @Test
    public void testBlogJsp_ShouldHaveCorrectBreadcrumb() throws Exception {
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Blog Posts")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Home")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Blog")));
    }
} 