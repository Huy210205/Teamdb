package DuAn2.Controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringJUnitExtension;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;
import static org.mockito.Mockito.*;

/**
 * Unit Test cho HomePageController - Trang chủ
 */
@ExtendWith(SpringJUnitExtension.class)
@SpringBootTest
public class HomePageControllerTest {

    private MockMvc mockMvc;

    @Mock
    private WebApplicationContext webApplicationContext;

    @InjectMocks
    private HomePageController homePageController;

    @BeforeEach
    void setUp() {
        mockMvc = MockMvcBuilders.standaloneSetup(homePageController).build();
    }

    /**
     * Test hiển thị trang chủ thành công
     */
    @Test
    void testHomePage_ShouldReturnHomeView() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/home"))
                .andExpect(model().attributeExists("rooms"))
                .andExpect(model().attributeExists("services"));
    }

    /**
     * Test hiển thị trang chủ với dữ liệu phòng
     */
    @Test
    void testHomePage_WithRoomsData() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/home"))
                .andExpect(model().attributeExists("rooms"))
                .andExpect(model().attributeExists("roomTypes"));
    }

    /**
     * Test form tìm kiếm phòng trống
     */
    @Test
    void testSearchAvailableRooms_WithValidData() throws Exception {
        mockMvc.perform(post("/search-available")
                .param("checkInDate", "2024-01-15")
                .param("checkOutDate", "2024-01-17")
                .param("typeRoom", "VIP")
                .param("maxPrice", "100"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/listroom"))
                .andExpect(model().attributeExists("availableRooms"));
    }

    /**
     * Test form tìm kiếm với dữ liệu không hợp lệ
     */
    @Test
    void testSearchAvailableRooms_WithInvalidData() throws Exception {
        mockMvc.perform(post("/search-available")
                .param("checkInDate", "")
                .param("checkOutDate", "")
                .param("typeRoom", "")
                .param("maxPrice", "-1"))
                .andExpect(status().isBadRequest())
                .andExpect(view().name("user/home"))
                .andExpect(model().hasErrors());
    }

    /**
     * Test tìm kiếm với ngày check-in sau ngày check-out
     */
    @Test
    void testSearchAvailableRooms_WithInvalidDateRange() throws Exception {
        mockMvc.perform(post("/search-available")
                .param("checkInDate", "2024-01-17")
                .param("checkOutDate", "2024-01-15")
                .param("typeRoom", "Normal")
                .param("maxPrice", "50"))
                .andExpect(status().isBadRequest())
                .andExpect(model().hasErrors());
    }

    /**
     * Test hiển thị trang About từ trang chủ
     */
    @Test
    void testAboutPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/about"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/about"));
    }

    /**
     * Test hiển thị trang Services từ trang chủ
     */
    @Test
    void testServicesPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/service"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/service"));
    }

    /**
     * Test hiển thị trang Contact từ trang chủ
     */
    @Test
    void testContactPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/contact"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/contact"));
    }

    /**
     * Test hiển thị trang Booking từ trang chủ
     */
    @Test
    void testBookingPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/booking"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/booking"));
    }

    /**
     * Test hiển thị danh sách phòng từ trang chủ
     */
    @Test
    void testListRoomsPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/listroom"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/listroom"))
                .andExpect(model().attributeExists("rooms"));
    }

    /**
     * Test hiển thị chi tiết phòng từ trang chủ
     */
    @Test
    void testRoomDetailPage_FromHomePage() throws Exception {
        mockMvc.perform(get("/room")
                .param("id", "1"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/room"))
                .andExpect(model().attributeExists("room"));
    }

    /**
     * Test hiển thị trang chủ với dữ liệu rỗng
     */
    @Test
    void testHomePage_WithEmptyData() throws Exception {
        mockMvc.perform(get("/"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/home"))
                .andExpect(model().attributeExists("rooms"))
                .andExpect(model().attributeExists("services"));
    }

    /**
     * Test hiển thị trang chủ với lỗi server
     */
    @Test
    void testHomePage_WithServerError() throws Exception {
        // Simulate server error
        when(homePageController.home(any())).thenThrow(new RuntimeException("Server error"));
        
        mockMvc.perform(get("/"))
                .andExpect(status().isInternalServerError());
    }

    /**
     * Test form tìm kiếm với giá trị null
     */
    @Test
    void testSearchAvailableRooms_WithNullValues() throws Exception {
        mockMvc.perform(post("/search-available")
                .param("checkInDate", "")
                .param("checkOutDate", "")
                .param("typeRoom", "")
                .param("maxPrice", ""))
                .andExpect(status().isBadRequest())
                .andExpect(model().hasErrors());
    }

    /**
     * Test hiển thị trang chủ với tham số không hợp lệ
     */
    @Test
    void testHomePage_WithInvalidParameters() throws Exception {
        mockMvc.perform(get("/")
                .param("invalid", "value"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/home"));
    }
} 