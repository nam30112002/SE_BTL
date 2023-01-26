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
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThayDoiHoKhauUI {
    @FXML
    private Button suaB;
    @FXML
    private TableView<ThanhVienGiaDinh> bangThanhVien;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> hoTenCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> ngaySinhCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> quanHeCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, Integer> idCol;
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
            ThanhVienGiaDinh.idChuHoCuTarget = resultSet1.getInt("idChuHo");
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
            int id = resultSet.getInt("idNhanKhau");
            String hoTen = resultSet.getString("hoTen");
            String ngaySinh = String.valueOf(resultSet.getDate("namSinh"));
            String quanHe = resultSet.getString("quanHeVoiChuHo");
            list.add(new ThanhVienGiaDinh(id,hoTen,ngaySinh,quanHe));
        }
        idCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,Integer>("idNhanKhau"));
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

    public void xoaThanhVien() throws SQLException {
        if(bangThanhVien.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        ThanhVienGiaDinh.idNhanKhauTarget = bangThanhVien.getSelectionModel().getSelectedItem().getIdNhanKhau();
        String sql = "delete from thanh_vien_cua_ho where idNhanKhau = " + ThanhVienGiaDinh.idNhanKhauTarget + ";";
        SQLConnection.statement.executeUpdate(sql);
        this.initialize();
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Xóa thành công!");
        alert.showAndWait();
    }

    public void suaQuanHeVoiChuHo() throws SQLException, IOException {
        if(bangThanhVien.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        ThanhVienGiaDinh.idNhanKhauTarget = bangThanhVien.getSelectionModel().getSelectedItem().getIdNhanKhau();

        Stage stage1 = new Stage();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("SuaQuanHeUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        stage1.setTitle("Sửa quan hệ với chủ hộ");
        stage1.setScene(scene);
        stage1.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage1.setX(x);
        stage1.setY(y);

    }

    public void doiChuHo() throws SQLException {
        if(bangThanhVien.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn chủ hộ mới trong bảng, vui lòng click vào chủ hộ mới trong bảng thành viên!");
            alert.showAndWait();
            return;
        }
        ThanhVienGiaDinh.idNhanKhauTarget = bangThanhVien.getSelectionModel().getSelectedItem().getIdNhanKhau();
        int idChuHoMoi = ThanhVienGiaDinh.idNhanKhauTarget;
        String sql = "UPDATE ho_khau "
                + "SET idChuHo = " + idChuHoMoi + " WHERE maHoKhau = N'" + ThanhVienGiaDinh.maHoKhauTarget + "';";
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        String sql1 = "update thanh_vien_cua_ho set idNhanKhau =" + ThanhVienGiaDinh.idChuHoCuTarget
                + " where idNhanKhau = " + idChuHoMoi + ";";
        System.out.println(sql1);
        SQLConnection.statement.executeUpdate(sql1);
        this.initialize();
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Đổi chủ hộ thành công!");
        alert.showAndWait();
    }
}
