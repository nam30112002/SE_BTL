package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.MonthDay;
import java.time.Year;
import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;

public class ThemMoiNhanKhauUI {
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

    public void initialize(){
        gioiTinhCB.getItems().addAll("Nam", "Nữ", "Khác");
    }

    public void themNhanKhau() throws SQLException {

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
        Date thoigiannhap=new Date();
        System.out.print(hoTen);
        if(Objects.equals(hoTen, "") || ngaySinh.equals("") || Objects.equals(nguyenQuan, "") || Objects.equals(danToc, "") ||
                Objects.equals(CCCD, "") || Objects.equals(noiThuongTru, "") || Objects.equals(gioiTinh, "") ||
                Objects.equals(diaChi, "") || Objects.equals(quocTich, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thêm thất bại");
            alert.setContentText("Chưa nhập đủ thông tin cần thiết");
            alert.showAndWait();
            return;
        }
        String sql = "insert into nhan_khau(hoTen, namSinh, nguyenQuan, danToc, CCCD, noiThuongTru, gioiTinh, diaChiHienNay, quocTich) "
                + "values (N'" + hoTen + "','" + ngaySinh + "',N'" +
                nguyenQuan +"',N'" + danToc + "',N'" + CCCD + "',N'" + noiThuongTru + "',N'" + gioiTinh
                + "',N'" + diaChi + "',N'" + quocTich + "');";
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);

        if(hocVan!=null){
            String sql1 = "UPDATE nhan_khau " + "SET trinhDoHocVan = N'"+ hocVan + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(ngoaiNgu!=null){
            String sql1 = "UPDATE nhan_khau " + "SET trinhDoNgoaiNgu = N'"+ ngoaiNgu + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(chuyenMon!=null){
            String sql1 = "UPDATE nhan_khau " + "SET TrinhDoChuyenMon = N'"+ chuyenMon + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(bietDanh!=null){
            String sql1 = "UPDATE nhan_khau " + "SET bietDanh = N'"+ bietDanh + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(tonGiao!=null){
            String sql1 = "UPDATE nhan_khau " + "SET tonGiao = N'"+ tonGiao + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(hoChieu!=null){
            String sql1 = "UPDATE nhan_khau " + "SET soHoChieu = N'"+ hoChieu + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(ngheNghiep!=null){
            String sql1 = "UPDATE nhan_khau " + "SET ngheNghiep = N'"+ ngheNghiep + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(bietTiengDanToc!=null){
            String sql1 = "UPDATE nhan_khau " + "SET bietTiengDanToc = N'"+ bietTiengDanToc + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
        if(noiLamViec!=null){
            String sql1 = "UPDATE nhan_khau " + "SET noiLamViec = N'"+ noiLamViec + "' WHERE CCCD = '" + CCCD + "';";
            SQLConnection.statement.executeUpdate(sql1);
        }
       String sql2= "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigiannhap.toString())+ "',N'" + String.format("Thêm nhân khẩu: %s", hoTen) + "');";
        SQLConnection.statement.executeUpdate(sql2);
        System.out.println(sql2);


        // Them nhan khau vao tre_em va hoc_sinh

        int age = Year.now().getValue() - ngaySinhTF.getValue().getYear();
        if (age <= 18 && age >= 0){
            String sql_tre_em = String.format("Insert into tre_em(CCCD) values(N'%s');", CCCD);
            SQLConnection.statement.executeUpdate(sql_tre_em);
        }
        if (ngheNghiep == "Học sinh"){
            String sql_hoc_sinh = String.format("Insert into hoc_sinh(CCCD) values(N'%s');", CCCD);
        }



        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thêm mới thành công");
        alert.setContentText("Chúc mừng bạn đã thêm nhân khẩu thành công!");
        alert.showAndWait();


    }
    public void reset(){
        hoTenTF.setText("");
        ngaySinhTF.setValue(null);
        nguyenQuanTf.setText(null);
        danTocTF.setText(null);
        CCCDTF.setText(null);
        noiThuongTruTF.setText(null);
        hocVanTF.setText(null);
        ngoainguTF.setText(null);
        chuyenMonTF.setText(null);
        bietDanhTF.setText(null);
        gioiTinhCB.setValue(null);
        tonGiaoTF.setText(null);
        quocTichTF.setText(null);
        hoChieuTF.setText(null);
        diaChiHienTaiTF.setText(null);
        ngheNghiepTF.setText(null);
        tiengDanTocTF.setText(null);
        noiLamViecTF.setText(null);
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



}
