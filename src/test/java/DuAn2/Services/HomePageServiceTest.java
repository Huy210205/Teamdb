package DuAn2.Services;

import DuAn2.Model.Phong;
import DuAn2.Model.LoaiPhong;
import DuAn2.Model.DichVu;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.test.context.junit.jupiter.SpringJUnitExtension;

import java.util.Arrays;
import java.util.List;
import java.util.Date;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

/**
 * Unit Test cho HomePageService - Logic nghiệp vụ trang chủ
 */
@ExtendWith(SpringJUnitExtension.class)
public class HomePageServiceTest {

    @Mock
    private PhongService phongService;

    @Mock
    private LoaiPhongService loaiPhongService;

    @Mock
    private DichVuService dichVuService;

    @InjectMocks
    private HomePageService homePageService;

    private Phong phong1;
    private Phong phong2;
    private LoaiPhong loaiPhongVIP;
    private LoaiPhong loaiPhongNormal;
    private DichVu dichVu1;
    private DichVu dichVu2;

    @BeforeEach
    void setUp() {
        // Setup test data
        loaiPhongVIP = new LoaiPhong();
        loaiPhongVIP.setId(1);
        loaiPhongVIP.setTenLoaiPhong("VIP");

        loaiPhongNormal = new LoaiPhong();
        loaiPhongNormal.setId(2);
        loaiPhongNormal.setTenLoaiPhong("Normal");

        phong1 = new Phong();
        phong1.setId(1);
        phong1.setSoPhong("101");
        phong1.setLoaiPhong(loaiPhongVIP);
        phong1.setGia(100.0);
        phong1.setTrangThai("Available");

        phong2 = new Phong();
        phong2.setId(2);
        phong2.setSoPhong("102");
        phong2.setLoaiPhong(loaiPhongNormal);
        phong2.setGia(50.0);
        phong2.setTrangThai("Available");

        dichVu1 = new DichVu();
        dichVu1.setId(1);
        dichVu1.setTenDichVu("WiFi");
        dichVu1.setGia(10.0);

        dichVu2 = new DichVu();
        dichVu2.setId(2);
        dichVu2.setTenDichVu("Breakfast");
        dichVu2.setGia(15.0);
    }

    /**
     * Test lấy danh sách phòng thành công
     */
    @Test
    void testGetAllRooms_Success() {
        // Given
        List<Phong> expectedRooms = Arrays.asList(phong1, phong2);
        when(phongService.getAllPhong()).thenReturn(expectedRooms);

        // When
        List<Phong> actualRooms = homePageService.getAllRooms();

        // Then
        assertNotNull(actualRooms);
        assertEquals(2, actualRooms.size());
        assertEquals("101", actualRooms.get(0).getSoPhong());
        assertEquals("102", actualRooms.get(1).getSoPhong());
        verify(phongService, times(1)).getAllPhong();
    }

    /**
     * Test lấy danh sách phòng trống
     */
    @Test
    void testGetAllRooms_EmptyList() {
        // Given
        when(phongService.getAllPhong()).thenReturn(Arrays.asList());

        // When
        List<Phong> actualRooms = homePageService.getAllRooms();

        // Then
        assertNotNull(actualRooms);
        assertTrue(actualRooms.isEmpty());
        verify(phongService, times(1)).getAllPhong();
    }

    /**
     * Test lấy danh sách loại phòng thành công
     */
    @Test
    void testGetAllRoomTypes_Success() {
        // Given
        List<LoaiPhong> expectedTypes = Arrays.asList(loaiPhongVIP, loaiPhongNormal);
        when(loaiPhongService.getAllLoaiPhong()).thenReturn(expectedTypes);

        // When
        List<LoaiPhong> actualTypes = homePageService.getAllRoomTypes();

        // Then
        assertNotNull(actualTypes);
        assertEquals(2, actualTypes.size());
        assertEquals("VIP", actualTypes.get(0).getTenLoaiPhong());
        assertEquals("Normal", actualTypes.get(1).getTenLoaiPhong());
        verify(loaiPhongService, times(1)).getAllLoaiPhong();
    }

    /**
     * Test lấy danh sách dịch vụ thành công
     */
    @Test
    void testGetAllServices_Success() {
        // Given
        List<DichVu> expectedServices = Arrays.asList(dichVu1, dichVu2);
        when(dichVuService.getAllDichVu()).thenReturn(expectedServices);

        // When
        List<DichVu> actualServices = homePageService.getAllServices();

        // Then
        assertNotNull(actualServices);
        assertEquals(2, actualServices.size());
        assertEquals("WiFi", actualServices.get(0).getTenDichVu());
        assertEquals("Breakfast", actualServices.get(1).getTenDichVu());
        verify(dichVuService, times(1)).getAllDichVu();
    }

    /**
     * Test tìm kiếm phòng trống với dữ liệu hợp lệ
     */
    @Test
    void testSearchAvailableRooms_WithValidData() {
        // Given
        Date checkInDate = new Date();
        Date checkOutDate = new Date();
        String typeRoom = "VIP";
        Double maxPrice = 100.0;

        List<Phong> expectedRooms = Arrays.asList(phong1);
        when(phongService.searchAvailableRooms(checkInDate, checkOutDate, typeRoom, maxPrice))
                .thenReturn(expectedRooms);

        // When
        List<Phong> actualRooms = homePageService.searchAvailableRooms(checkInDate, checkOutDate, typeRoom, maxPrice);

        // Then
        assertNotNull(actualRooms);
        assertEquals(1, actualRooms.size());
        assertEquals("VIP", actualRooms.get(0).getLoaiPhong().getTenLoaiPhong());
        verify(phongService, times(1)).searchAvailableRooms(checkInDate, checkOutDate, typeRoom, maxPrice);
    }

    /**
     * Test tìm kiếm phòng trống với giá trị null
     */
    @Test
    void testSearchAvailableRooms_WithNullValues() {
        // Given
        when(phongService.searchAvailableRooms(null, null, null, null))
                .thenReturn(Arrays.asList());

        // When
        List<Phong> actualRooms = homePageService.searchAvailableRooms(null, null, null, null);

        // Then
        assertNotNull(actualRooms);
        assertTrue(actualRooms.isEmpty());
        verify(phongService, times(1)).searchAvailableRooms(null, null, null, null);
    }

    /**
     * Test tìm kiếm phòng trống với ngày không hợp lệ
     */
    @Test
    void testSearchAvailableRooms_WithInvalidDates() {
        // Given
        Date checkInDate = new Date();
        Date checkOutDate = new Date(checkInDate.getTime() - 86400000); // 1 day before

        // When & Then
        assertThrows(IllegalArgumentException.class, () -> {
            homePageService.searchAvailableRooms(checkInDate, checkOutDate, "VIP", 100.0);
        });
    }

    /**
     * Test lấy phòng theo ID thành công
     */
    @Test
    void testGetRoomById_Success() {
        // Given
        Integer roomId = 1;
        when(phongService.getPhongById(roomId)).thenReturn(phong1);

        // When
        Phong actualRoom = homePageService.getRoomById(roomId);

        // Then
        assertNotNull(actualRoom);
        assertEquals(1, actualRoom.getId());
        assertEquals("101", actualRoom.getSoPhong());
        verify(phongService, times(1)).getPhongById(roomId);
    }

    /**
     * Test lấy phòng theo ID không tồn tại
     */
    @Test
    void testGetRoomById_NotFound() {
        // Given
        Integer roomId = 999;
        when(phongService.getPhongById(roomId)).thenReturn(null);

        // When
        Phong actualRoom = homePageService.getRoomById(roomId);

        // Then
        assertNull(actualRoom);
        verify(phongService, times(1)).getPhongById(roomId);
    }

    /**
     * Test lấy phòng theo loại phòng thành công
     */
    @Test
    void testGetRoomsByType_Success() {
        // Given
        String roomType = "VIP";
        List<Phong> expectedRooms = Arrays.asList(phong1);
        when(phongService.getPhongByLoaiPhong(roomType)).thenReturn(expectedRooms);

        // When
        List<Phong> actualRooms = homePageService.getRoomsByType(roomType);

        // Then
        assertNotNull(actualRooms);
        assertEquals(1, actualRooms.size());
        assertEquals("VIP", actualRooms.get(0).getLoaiPhong().getTenLoaiPhong());
        verify(phongService, times(1)).getPhongByLoaiPhong(roomType);
    }

    /**
     * Test lấy phòng theo giá thành công
     */
    @Test
    void testGetRoomsByPrice_Success() {
        // Given
        Double maxPrice = 100.0;
        List<Phong> expectedRooms = Arrays.asList(phong1, phong2);
        when(phongService.getPhongByGia(maxPrice)).thenReturn(expectedRooms);

        // When
        List<Phong> actualRooms = homePageService.getRoomsByPrice(maxPrice);

        // Then
        assertNotNull(actualRooms);
        assertEquals(2, actualRooms.size());
        verify(phongService, times(1)).getPhongByGia(maxPrice);
    }

    /**
     * Test lấy dịch vụ theo ID thành công
     */
    @Test
    void testGetServiceById_Success() {
        // Given
        Integer serviceId = 1;
        when(dichVuService.getDichVuById(serviceId)).thenReturn(dichVu1);

        // When
        DichVu actualService = homePageService.getServiceById(serviceId);

        // Then
        assertNotNull(actualService);
        assertEquals(1, actualService.getId());
        assertEquals("WiFi", actualService.getTenDichVu());
        verify(dichVuService, times(1)).getDichVuById(serviceId);
    }

    /**
     * Test lấy dịch vụ theo ID không tồn tại
     */
    @Test
    void testGetServiceById_NotFound() {
        // Given
        Integer serviceId = 999;
        when(dichVuService.getDichVuById(serviceId)).thenReturn(null);

        // When
        DichVu actualService = homePageService.getServiceById(serviceId);

        // Then
        assertNull(actualService);
        verify(dichVuService, times(1)).getDichVuById(serviceId);
    }

    /**
     * Test exception khi service layer gặp lỗi
     */
    @Test
    void testGetAllRooms_ServiceException() {
        // Given
        when(phongService.getAllPhong()).thenThrow(new RuntimeException("Database error"));

        // When & Then
        assertThrows(RuntimeException.class, () -> {
            homePageService.getAllRooms();
        });
    }
} 