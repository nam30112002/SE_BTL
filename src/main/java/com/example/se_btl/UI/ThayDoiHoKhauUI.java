package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThayDoiHoKhauUI {
    @FXML
    private TableView<ThanhVienGiaDinh> bangThanhVien;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> hoTenCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> ngaySinhCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> quanHeCol;
    @FXML
    private Button backB;
    @FXML
    private Label label1;



    public void initialize() throws SQLException {
        String sql1 = "select * from nhan_khau, ho_khau where nhan_khau.ID = ho_khau.idChuHo and ho_khau.maHoKhau = N'" +
                ThanhVienGiaDinh.maHoKhauTarget + "';";
        ResultSet resultSet1 =  SQLConnection.statement.executeQuery(sql1);
        String ten = null;
        if(resultSet1.next()){
            ten = resultSet1.getString("hoTen");
        }
        label1.setText("Danh sách thành viên của hộ khẩu " + ThanhVienGiaDinh.maHoKhauTarget + " có chủ hộ là: " + ten);
        ObservableList<ThanhVienGiaDinh> list = FXCollections.observableArrayList();
        String maHoKhau = ThanhVienGiaDinh.maHoKhauTarget;
        String sql= "select * from ho_khau, thanh_vien_cua_ho, nhan_khau" +
                " where [thanh_vien_cua_ho].idNhanKhau = [nhan_khau].ID and [ho_khau].ID = [thanh_vien_cua_ho].idHoKhau " +
                "and [ho_khau].maHoKhau = N'" + maHoKhau + "';";
        System.out.println(sql);
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        while (resultSet.next()){
            String hoTen = resultSet.getString("hoTen");
            String ngaySinh = String.valueOf(resultSet.getDate("namSinh"));
            String quanHe = resultSet.getString("quanHeVoiChuHo");
            list.add(new ThanhVienGiaDinh(hoTen,ngaySinh,quanHe));
        }
        hoTenCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,String>("hoTen"));
        ngaySinhCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,String>("ngaySinh"));
        quanHeCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,String>("quanHeVoiChuHo"));

        bangThanhVien.setItems(list);
    }

    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backB.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lí nhân khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void themThanhVien() throws IOException {
        Stage stage1 = new Stage();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ThemThanhVienHoKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        stage1.setTitle("Thêm thành viên");
        stage1.setScene(scene);
        stage1.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage1.setX(x);
        stage1.setY(y);
    }
    public void reset() throws SQLException {
        this.initialize();
    }

    public void xoaThanhVien(){

    }
}
