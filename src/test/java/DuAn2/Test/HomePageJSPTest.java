package DuAn2.Test;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.test.context.junit.jupiter.SpringJUnitExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

/**
 * Unit Test cho JSP Template trang chủ
 */
@ExtendWith(SpringJUnitExtension.class)
public class HomePageJSPTest {

    private MockMvc mockMvc;

    /**
     * Test kiểm tra file JSP tồn tại
     */
    @Test
    void testHomeJSPFileExists() {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        File jspFile = new File(jspPath);
        
        assertTrue(jspFile.exists(), "File home.jsp should exist");
        assertTrue(jspFile.isFile(), "home.jsp should be a file");
        assertTrue(jspFile.length() > 0, "home.jsp should not be empty");
    }

    /**
     * Test kiểm tra nội dung JSP có đúng cấu trúc
     */
    @Test
    void testHomeJSPContentStructure() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra các thành phần cơ bản
        assertTrue(content.contains("<%@ page"), "Should contain JSP directive");
        assertTrue(content.contains("<%@ taglib"), "Should contain taglib directive");
        assertTrue(content.contains("<section"), "Should contain section elements");
        assertTrue(content.contains("form:form"), "Should contain Spring form");
        assertTrue(content.contains("Check Availability"), "Should contain availability form");
        assertTrue(content.contains("Best Rooms"), "Should contain rooms section");
    }

    /**
     * Test kiểm tra form tìm kiếm phòng
     */
    @Test
    void testHomeJSPAvailabilityForm() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra form elements
        assertTrue(content.contains("checkInDate"), "Should contain check-in date field");
        assertTrue(content.contains("checkOutDate"), "Should contain check-out date field");
        assertTrue(content.contains("typeRoom"), "Should contain room type field");
        assertTrue(content.contains("maxPrice"), "Should contain max price field");
        assertTrue(content.contains("VIP"), "Should contain VIP option");
        assertTrue(content.contains("Normal"), "Should contain Normal option");
        assertTrue(content.contains("Homestay"), "Should contain Homestay option");
    }

    /**
     * Test kiểm tra slider section
     */
    @Test
    void testHomeJSPSliderSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra slider elements
        assertTrue(content.contains("w3l-main-slider"), "Should contain main slider class");
        assertTrue(content.contains("owl-carousel"), "Should contain carousel class");
        assertTrue(content.contains("banner-view"), "Should contain banner view class");
        assertTrue(content.contains("Our Services"), "Should contain services link");
    }

    /**
     * Test kiểm tra rooms section
     */
    @Test
    void testHomeJSPRoomsSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra rooms elements
        assertTrue(content.contains("best-rooms"), "Should contain best rooms class");
        assertTrue(content.contains("room1.jpg"), "Should contain room1 image");
        assertTrue(content.contains("room2.jpg"), "Should contain room2 image");
        assertTrue(content.contains("room3.jpg"), "Should contain room3 image");
        assertTrue(content.contains("room4.jpg"), "Should contain room4 image");
        assertTrue(content.contains("room5.jpg"), "Should contain room5 image");
        assertTrue(content.contains("Book Now"), "Should contain book now button");
    }

    /**
     * Test kiểm tra about section
     */
    @Test
    void testHomeJSPAboutSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra about elements
        assertTrue(content.contains("w3l-about"), "Should contain about section class");
        assertTrue(content.contains("Relax in our Resort"), "Should contain resort title");
        assertTrue(content.contains("Learn About Us"), "Should contain about us link");
        assertTrue(content.contains("top.jpg"), "Should contain top image");
        assertTrue(content.contains("bottom.jpg"), "Should contain bottom image");
    }

    /**
     * Test kiểm tra experience section
     */
    @Test
    void testHomeJSPExperienceSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra experience elements
        assertTrue(content.contains("w3l-index3"), "Should contain index3 section class");
        assertTrue(content.contains("1 Years of Hotels"), "Should contain experience text");
        assertTrue(content.contains("fa-check"), "Should contain check icons");
        assertTrue(content.contains("Check all packages"), "Should contain packages link");
    }

    /**
     * Test kiểm tra quotation section
     */
    @Test
    void testHomeJSPQuotationSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra quotation elements
        assertTrue(content.contains("quotation"), "Should contain quotation class");
        assertTrue(content.contains("Enjoy a Luxury experience"), "Should contain luxury text");
        assertTrue(content.contains("Contact Us"), "Should contain contact us link");
    }

    /**
     * Test kiểm tra logos section
     */
    @Test
    void testHomeJSPLogosSection() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra logos elements
        assertTrue(content.contains("w3l-logos"), "Should contain logos section class");
        assertTrue(content.contains("logo1.jpg"), "Should contain logo1 image");
        assertTrue(content.contains("logo2.jpg"), "Should contain logo2 image");
        assertTrue(content.contains("logo3.jpg"), "Should contain logo3 image");
        assertTrue(content.contains("logo4.jpg"), "Should contain logo4 image");
    }

    /**
     * Test kiểm tra responsive design
     */
    @Test
    void testHomeJSPResponsiveDesign() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra responsive classes
        assertTrue(content.contains("col-lg-"), "Should contain large column classes");
        assertTrue(content.contains("col-md-"), "Should contain medium column classes");
        assertTrue(content.contains("col-sm-"), "Should contain small column classes");
        assertTrue(content.contains("mt-"), "Should contain margin top classes");
        assertTrue(content.contains("py-"), "Should contain padding classes");
    }

    /**
     * Test kiểm tra accessibility
     */
    @Test
    void testHomeJSPAccessibility() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra accessibility elements
        assertTrue(content.contains("alt="), "Should contain alt attributes for images");
        assertTrue(content.contains("aria-hidden"), "Should contain aria-hidden attributes");
        assertTrue(content.contains("label"), "Should contain label elements for forms");
    }

    /**
     * Test kiểm tra SEO elements
     */
    @Test
    void testHomeJSPSEOElements() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra SEO elements
        assertTrue(content.contains("h3"), "Should contain h3 headings");
        assertTrue(content.contains("h4"), "Should contain h4 headings");
        assertTrue(content.contains("h5"), "Should contain h5 headings");
        assertTrue(content.contains("h6"), "Should contain h6 headings");
    }

    /**
     * Test kiểm tra form validation
     */
    @Test
    void testHomeJSPFormValidation() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra form validation
        assertTrue(content.contains("required"), "Should contain required attributes");
        assertTrue(content.contains("type="), "Should contain input types");
        assertTrue(content.contains("placeholder="), "Should contain placeholders");
    }

    /**
     * Test kiểm tra navigation links
     */
    @Test
    void testHomeJSPNavigationLinks() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra navigation links
        assertTrue(content.contains("href="), "Should contain href attributes");
        assertTrue(content.contains("service"), "Should contain service link");
        assertTrue(content.contains("about"), "Should contain about link");
        assertTrue(content.contains("booking"), "Should contain booking link");
        assertTrue(content.contains("contact"), "Should contain contact link");
    }

    /**
     * Test kiểm tra image optimization
     */
    @Test
    void testHomeJSPImageOptimization() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra image optimization
        assertTrue(content.contains("img-fluid"), "Should contain img-fluid class for responsive images");
        assertTrue(content.contains("src="), "Should contain src attributes");
        assertTrue(content.contains(".jpg"), "Should contain jpg images");
    }

    /**
     * Test kiểm tra CSS classes consistency
     */
    @Test
    void testHomeJSPCSSClassesConsistency() throws Exception {
        String jspPath = "src/main/webapp/WEB-INF/user/home.jsp";
        String content = new String(Files.readAllBytes(Paths.get(jspPath)));

        // Kiểm tra CSS classes consistency
        assertTrue(content.contains("btn"), "Should contain button classes");
        assertTrue(content.contains("container"), "Should contain container classes");
        assertTrue(content.contains("row"), "Should contain row classes");
        assertTrue(content.contains("col-"), "Should contain column classes");
    }
} 