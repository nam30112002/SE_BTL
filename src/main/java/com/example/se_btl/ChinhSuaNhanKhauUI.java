package com.example.se_btl;

import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Objects;

public class ChinhSuaNhanKhauUI {
    @FXML
    private TextField hocVanTF;
    @FXML
    private TextField hoTenTF;
    @FXML
    private TextField nguyenQuanTf;
    @FXML
    private TextField danTocTF;
    @FXML
    private TextField CCCDTF;
    @FXML
    private TextField noiThuongTruTF;
    @FXML
    private TextField ngoainguTF;
    @FXML
    private TextField chuyenMonTF;
    @FXML
    private DatePicker ngaySinhTF;
    @FXML
    private TextField bietDanhTF;
    @FXML
    private TextField tonGiaoTF;
    @FXML
    private TextField quocTichTF;
    @FXML
    private TextField hoChieuTF;
    @FXML
    private TextField diaChiHienTaiTF;
    @FXML
    private TextField ngheNghiepTF;
    @FXML
    private TextField tiengDanTocTF;
    @FXML
    private TextField noiLamViecTF;
    @FXML
    private Button themB;
    @FXML
    private Button newB;
    @FXML
    private ChoiceBox gioiTinhCB;

    @FXML
    private Button backB;

    public void initialize() throws SQLException, ParseException {
        System.out.println(1);
        int idOrigin = NhanKhau.idTarget;
        System.out.println(idOrigin);
        String sql = "SELECT * FROM nhan_khau WHERE ID = " + idOrigin + ";";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        while (resultSet.next()){
            String hoTen = resultSet.getString("hoTen");
            hoTenTF.setText(hoTen);

            String nguyenQuan = resultSet.getString("nguyenQuan");
            nguyenQuanTf.setText(nguyenQuan);

            String danToc = resultSet.getString("danToc");
            danTocTF.setText(danToc);

            String CCCD = resultSet.getString("CCCD");
            CCCDTF.setText(CCCD);

            String noiThuongTru = resultSet.getString("noiThuongTru");
            noiThuongTruTF.setText(noiThuongTru);

            String hocVan = resultSet.getString("trinhDoHocVan");
            hocVanTF.setText(hocVan);

            String ngoaiNgu = resultSet.getString("trinhDoNgoaiNgu");
            ngoainguTF.setText(ngoaiNgu);

            String chuyenMon = resultSet.getString("TrinhDoChuyenMon");
            chuyenMonTF.setText(chuyenMon);

            String bietDanh = resultSet.getString("bietDanh");
            bietDanhTF.setText(bietDanh);

            String tonGiao = resultSet.getString("tonGiao");
            tonGiaoTF.setText(tonGiao);

            String quocTich = resultSet.getString("quocTich");
            quocTichTF.setText(quocTich);

            String hoChieu = resultSet.getString("soHoChieu");
            hoChieuTF.setText(hoChieu);

            String diaChi = resultSet.getString("diaChiHienNay");
            diaChiHienTaiTF.setText(diaChi);

            String ngheNghiep = resultSet.getString("ngheNghiep");
            ngheNghiepTF.setText(ngheNghiep);

            String tiengDanToc = resultSet.getString("bietTiengDanToc");
            tiengDanTocTF.setText(tiengDanToc);

            String noiLamViec = resultSet.getString("noiLamViec");
            noiLamViecTF.setText(noiLamViec);

            String ngaySinh = resultSet.getString("namSinh");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            //convert String to LocalDate
            LocalDate localDate = LocalDate.parse(ngaySinh, formatter);
            ngaySinhTF.setValue(localDate);

            String gioiTinh = resultSet.getString("gioiTinh");
            gioiTinhCB.setValue(gioiTinh);
            gioiTinhCB.getItems().addAll("Nam", "Nữ", "Khác");
        }
    }

    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) themB.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý phần thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
    public void xacNhanChinhSua() throws SQLException {
        String hoTen = hoTenTF.getText();
        String ngaySinh = ngaySinhTF.getValue().toString();
        String nguyenQuan = nguyenQuanTf.getText();
        String danToc = danTocTF.getText();
        String CCCD = CCCDTF.getText();
        String noiThuongTru = noiThuongTruTF.getText();
        String hocVan = hocVanTF.getText();
        String ngoaiNgu = ngoainguTF.getText();
        String chuyenMon = chuyenMonTF.getText();
        String bietDanh = bietDanhTF.getText();
        String gioiTinh = (String) gioiTinhCB.getValue();
        String tonGiao = tonGiaoTF.getText();
        String quocTich = quocTichTF.getText();
        String hoChieu = hoChieuTF.getText();
        String diaChi = diaChiHienTaiTF.getText();
        String ngheNghiep = ngheNghiepTF.getText();
        String bietTiengDanToc = tiengDanTocTF.getText();
        String noiLamViec = noiLamViecTF.getText();
        if(Objects.equals(hoTen, "") || ngaySinh.equals("") || Objects.equals(nguyenQuan, "") || Objects.equals(danToc, "") ||
                Objects.equals(CCCD, "") || Objects.equals(noiThuongTru, "") || Objects.equals(gioiTinh, "") ||
                Objects.equals(diaChi, "") || Objects.equals(quocTich, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Sửa thất bại");
            alert.setContentText("Chưa nhập đủ thông tin cần thiết");
            alert.showAndWait();
            return;
        }

        String sql = "update nhan_khau set hoTen = N'" + hoTen + "', namSinh = '" + ngaySinh + "', nguyenQuan = N'" + nguyenQuan
                + "', danToc = N'" + danToc + "', CCCD = N'" + CCCD + "', noiThuongTru = N'" + noiThuongTru
                + "', gioiTinh = N'" + gioiTinh + "', diaChiHienNay = N'" + diaChi + "', quocTich = N'" + quocTich
                + "' where id = " + NhanKhau.idTarget ;
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);

        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET trinhDoHocVan = N'"+ hocVan + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET trinhDoNgoaiNgu = N'"+ ngoaiNgu + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET TrinhDoChuyenMon = N'"+ chuyenMon + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET bietDanh = N'"+ bietDanh + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET tonGiao = N'"+ tonGiao + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET soHoChieu = N'"+ hoChieu + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET ngheNghiep = N'"+ ngheNghiep + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET bietTiengDanToc = N'"+ bietTiengDanToc + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(true){
            String sql1 = "UPDATE nhan_khau " + "SET noiLamViec = N'"+ noiLamViec + "' WHERE id = '" + NhanKhau.idTarget + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Chỉnh sửa thành công");
        alert.setContentText("Chúc mừng bạn đã chỉnh sửa nhân khẩu thành công!");
        alert.showAndWait();
    }

}
