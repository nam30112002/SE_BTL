package com.example.se_btl.UI;


import com.example.se_btl.App;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.service.SQLConnection;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;

public class MainUI  {
    @FXML
    private Label nkTrenDiaBan;
    @FXML
    private Label hkTrenDiaBan;
    @FXML
    private Label nkTamTru;
    @FXML
    private Label nkTamVang;
    @FXML
    private TableView<NhanKhau> bangNhanKhau;
    @FXML
    private TableColumn<NhanKhau, Integer> idCol;
    @FXML
    private TableColumn<NhanKhau,String> hoTenCol;
    @FXML
    private TableColumn<NhanKhau,String> ngaySinhCol;
    @FXML
    private TableColumn<NhanKhau,String> gioiTinhCol;
    @FXML
    private TableColumn<NhanKhau,String> diaChiCol;

    @FXML
    private Button themMoiB;
    @FXML
    private MenuBar menuBar;
    @FXML
    private Button chinhSuaB;
    @FXML
    private Button dkiTamVangB;
    @FXML
    private Button dangKiTamTruB;
    @FXML
    private Button xoaNhanKhauB;




    public void initialize() throws SQLException {

        String sql = "select count(id) from nhan_khau;";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        int tongNhanKhau = 0;
        if(resultSet.next()){
            tongNhanKhau = resultSet.getInt(1);
        }

        String sql1 = "select count(id) from tam_vang;";
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql1);
        int vang = 0;
        if(resultSet1.next()){
            vang = resultSet1.getInt(1);
        }
        nkTrenDiaBan.setText("Nhân khẩu trên địa bàn: " + (tongNhanKhau - vang));


        String sql2 = "select count(id) from ho_khau;";
        ResultSet resultSet2 = SQLConnection.statement.executeQuery(sql2);
        int tongHoKhau = 0;
        if(resultSet2.next()){
            tongHoKhau = resultSet2.getInt(1);
        }
        hkTrenDiaBan.setText("Hộ khẩu trên địa bàn: " + tongHoKhau);

        String sql3 = "select count(id) from tam_tru;";
        ResultSet resultSet3 = SQLConnection.statement.executeQuery(sql3);
        int soTamTru = 0;
        if(resultSet3.next()){
            soTamTru = resultSet3.getInt(1);
        }
        nkTamTru.setText("Nhân khẩu tạm trú: " + soTamTru);

        String sql4 = "select count(id) from tam_vang;";
        ResultSet resultSet4 = SQLConnection.statement.executeQuery(sql4);
        int soTamVang = 0;
        if(resultSet4.next()){
            soTamVang = resultSet4.getInt(1);
        }
        nkTamVang.setText("Nhân khẩu tạm vắng: " + soTamVang);


        String SQL = "select * from nhan_khau";
        ResultSet resultSet5 = SQLConnection.statement.executeQuery(SQL);
        ObservableList<NhanKhau> list = FXCollections.observableArrayList();


        while (resultSet5.next()) {

            int id = resultSet5.getInt(1);
            String hoTen = resultSet5.getString(3);
            String ngaySinh = String.valueOf(resultSet5.getDate(5));
            //System.out.println(ngaySinh);
            String gioiTinh = resultSet5.getString(6);
            String diaChi = resultSet5.getString(14);
            list.add(new NhanKhau(id,hoTen,ngaySinh,gioiTinh,diaChi));
        }



        idCol.setCellValueFactory(new PropertyValueFactory<NhanKhau, Integer>("id"));
        hoTenCol.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("hoTen"));
        ngaySinhCol.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("ngaysinh"));
        gioiTinhCol.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("gioiTinh"));
        diaChiCol.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("diaChi"));


        bangNhanKhau.setItems(list);
//        bangNhanKhau.getSelectionModel().getSelectedItem();
//
//        chinhSuaB.setDisable(true);
    }

    public void themMoiNhanKhau() throws IOException {
        //System.out.println("alo");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ThemMoiNhanKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Thêm nhân khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void chinhSua() throws IOException {
        if(bangNhanKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Chỉnh sửa thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ChinhSuaNhanKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Chỉnh sửa nhân khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void dangKiTamVang() throws IOException {
        if(bangNhanKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DangKiTamVangUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Đăng kí tạm vắng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void dangKiTamTru() throws IOException {
        if(bangNhanKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DangKiTamTruUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Đăng kí tạm trú");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
    public void xoaNhanKhau() throws SQLException {
        if(bangNhanKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        String sql = "delete from nhan_khau where ID = " + NhanKhau.idTarget + ";";
        SQLConnection.statement.executeUpdate(sql);
        this.initialize();
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Xóa thành công!");
        alert.showAndWait();
    }
    

}
