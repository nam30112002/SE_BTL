package com.example.se_btl.UI;


import com.example.se_btl.App;
import com.example.se_btl.entity.HoKhau;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.service.SQLConnection;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
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
import java.util.Objects;

public class MainUI  {
    @FXML
    private Button thayDoiHKB;
    @FXML
    private TableColumn<NhanKhau,Integer> idThongKeC;
    @FXML
    private TableColumn<NhanKhau,String> hoTenThongKeC;
    @FXML
    private TableColumn<NhanKhau,String> ngaySinhThongKeC;
    @FXML
    private TableColumn<NhanKhau,String> gioiTinhThongKeC;
    @FXML
    private TableColumn<NhanKhau,String> diaChiThongKeC;
    @FXML
    private TableView<NhanKhau> bangThongKe;
    @FXML
    private ChoiceBox<String> gioiTinhThongKeCB;
    @FXML
    private ComboBox tuThongKeCB;
    @FXML
    private ComboBox denThongKeCB;
    @FXML
    private Button chinhSuaB1;
    @FXML
    private Button themHoKhauB;
    @FXML
    private Button tachHoKhauB;
    @FXML
    private Button chuyenDiB;
    @FXML
    private TableView<HoKhau> bangHoKhau;
    @FXML
    private TableColumn<HoKhau, String> maHoKhauC;
    @FXML
    private TableColumn<HoKhau, String> tenChuHoC;
    @FXML
    private TableColumn<HoKhau, String> diaChiC;
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
    @FXML
    private Button showB;


    public void logOut(ActionEvent event) throws IOException, SQLException {
        System.out.println("da log out");

        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("LoginUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());

        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đăng nhập");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }


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

        String sql6 = "select * from ho_khau inner join nhan_khau on ho_khau.idChuHo = nhan_khau.ID;";
        ResultSet resultSet6 = SQLConnection.statement.executeQuery(sql6);
        ObservableList<HoKhau> list1 = FXCollections.observableArrayList();


        while (resultSet6.next()) {
            String maHoKhau = resultSet6.getString("maHoKhau");
            String hoTenChuHo = resultSet6.getString("hoTen");
            String diaChi = resultSet6.getString("diaChi");
            list1.add(new HoKhau(maHoKhau,hoTenChuHo,diaChi));
        }
        maHoKhauC.setCellValueFactory(new PropertyValueFactory<HoKhau, String>("maHoKhau"));
        tenChuHoC.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("tenChuHo"));
        diaChiC.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("diaChi"));
        bangHoKhau.setItems(list1);

        gioiTinhThongKeCB.getItems().addAll("Tất cả","Nam", "Nữ", "Khác");
        gioiTinhThongKeCB.setValue("Tất cả");
        for(int i=0;i<100;i++) {
            tuThongKeCB.getItems().add(i);
            denThongKeCB.getItems().add(i);
        }
        denThongKeCB.getItems().add("Max");
        denThongKeCB.setValue("Max");
        tuThongKeCB.setValue(0);
    }

    public void themMoiNhanKhau() throws IOException {
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

    public void themHoKhau() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ThemHoKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Thêm hộ khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
    public void tachHoKhau(){

    }
    public void chuyenDi(){

    }
    public void chinhSua1(){

    }

    public void thayDoiHoKhau() throws IOException {
        if(bangHoKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Chỉnh sửa thất bại");
            alert.setContentText("Chưa chọn hộ khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        ThanhVienGiaDinh.maHoKhauTarget = bangHoKhau.getSelectionModel().getSelectedItem().getMaHoKhau();



        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ThayDoiHoKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Xem và thay đổi thành viên hộ khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void show() throws SQLException {
        String gioiTinh = gioiTinhThongKeCB.getValue();
        System.out.println(gioiTinh);
        String minTuoi = tuThongKeCB.getValue().toString();
        String maxTuoi = denThongKeCB.getValue().toString();
        //System.out.println(minTuoi + maxTuoi + gioiTinh);
        String sql = "";
        ObservableList<NhanKhau> list = FXCollections.observableArrayList();

        if(Objects.equals(gioiTinh, "Tất cả") && Objects.equals(maxTuoi, "Max")){
            sql = "select * from nhan_khau where (year(getdate()) - year(namsinh)) >= " + minTuoi;
        }
        if(Objects.equals(gioiTinh, "Tất cả") && !Objects.equals(maxTuoi, "Max")){
            sql = "select * from nhan_khau where (year(getdate()) - year(namsinh)) >= " + minTuoi
                + "and (year(getdate()) - year(namsinh)) <= " + maxTuoi;
        }
        if(gioiTinh!="Tất cả" && !Objects.equals(maxTuoi, "Max")){
            sql = "select * from nhan_khau where (year(getdate()) - year(namsinh)) >= " + minTuoi
                    + "and (year(getdate()) - year(namsinh)) <= " + maxTuoi + " and gioiTinh = N'" + gioiTinh
                    + "';";
            //System.out.println(sql);
        }
        if(gioiTinh!="Tất cả" && Objects.equals(maxTuoi, "Max")){
            sql = "select * from nhan_khau where (year(getdate()) - year(namsinh)) >= " + minTuoi
                     + " and gioiTinh = N'" + gioiTinh
                    + "';";
        }

        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        while (resultSet.next()){
            int id = resultSet.getInt(1);
            String hoTen = resultSet.getString(3);
            String ngaySinh = String.valueOf(resultSet.getDate(5));
            //System.out.println(ngaySinh);
            String gioiTinh1 = resultSet.getString(6);
            String diaChi = resultSet.getString("diaChiHienNay");
            list.add(new NhanKhau(id,hoTen,ngaySinh,gioiTinh1,diaChi));
        }
        idThongKeC.setCellValueFactory(new PropertyValueFactory<NhanKhau, Integer>("id"));
        hoTenThongKeC.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("hoTen"));
        ngaySinhThongKeC.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("ngaysinh"));
        gioiTinhThongKeC.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("gioiTinh"));
        diaChiThongKeC.setCellValueFactory(new PropertyValueFactory<NhanKhau,String>("diaChi"));

        bangThongKe.setItems(list);

    }

    public void chuyenDoiMatKhauUI(ActionEvent event) throws IOException {
        System.out.println("chuyen doi mat khau");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DoiMatKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đổi mật khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }


}
