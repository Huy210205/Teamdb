package DuAn2.user;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringJUnitExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@ExtendWith(SpringJUnitExtension.class)
@SpringBootTest
@AutoConfigureWebMvc
public class BlogIntegrationTest {

    @Autowired
    private WebApplicationContext webApplicationContext;

    private MockMvc mockMvc;

    @Test
    public void testBlogIntegration_CompleteFlow() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

        // Test blog page
        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(view().name("blog"))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Blog Posts")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("How to make best holiday with your family")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Read More")));

        // Test blog-single page
        mockMvc.perform(get("/blog-single"))
                .andExpect(status().isOk())
                .andExpect(view().name("blog-single"));
    }

    @Test
    public void testBlogNavigation_HomeLink() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("href=\"/home\"")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("Home")));
    }

    @Test
    public void testBlogContent_AllRequiredElements() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("w3l-breadcrumb")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("w3l-blog")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("grids5-info")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("pagination")));
    }

    @Test
    public void testBlogResponsive_AllImageSources() throws Exception {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();

        mockMvc.perform(get("/blog"))
                .andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog1.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog2.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog3.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/blog4.jpg")))
                .andExpect(content().string(org.hamcrest.Matchers.containsString("images/bottom.jpg")));
    }
} 