package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.entity.HoKhau;
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



public class TachHoKhauUI {
    @FXML
    private TextField diaChiMoiTF;
    @FXML
    private TextField maKhuVucMoiTF;
    @FXML
    private TextField maHoKhauMoiTF;
    @FXML
    private Button backB;
    @FXML
    private Label chuHoCuLabel;
    @FXML
    private TableView<ThanhVienGiaDinh> thanhVienCuTable;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> hoTenCol;
    @FXML
    private TableColumn<ThanhVienGiaDinh, Integer> idCol;
    @FXML
    private TableView<ThanhVienGiaDinh> thanhVienMoiTable;
    @FXML
    private TableColumn<ThanhVienGiaDinh, String> hoTenCol1;
    @FXML
    private TableColumn<ThanhVienGiaDinh, Integer> idCol1;


    public ObservableList<ThanhVienGiaDinh> list = FXCollections.observableArrayList();
    public ObservableList<ThanhVienGiaDinh> list1 = FXCollections.observableArrayList();

    public void initialize() throws SQLException {
        String maHoKhauCu = HoKhau.maHoKhauTarget;
        String sql = "select * from ho_khau, nhan_khau where ho_khau.idChuHo = nhan_khau.ID and maHoKhau = N'" + maHoKhauCu + "';";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        String tenChuHoCu = "";
        if(resultSet.next()){
            tenChuHoCu = resultSet.getString("hoTen");
        }
        chuHoCuLabel.setText("Chủ hộ cũ là: " + tenChuHoCu);

        String sql1= "select * from ho_khau, thanh_vien_cua_ho, nhan_khau" +
                " where [thanh_vien_cua_ho].idNhanKhau = [nhan_khau].ID and [ho_khau].ID = [thanh_vien_cua_ho].idHoKhau " +
                "and [ho_khau].maHoKhau = N'" + maHoKhauCu + "';";
        System.out.println(sql);
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql1);
        while (resultSet1.next()){
            int id = resultSet1.getInt("idNhanKhau");
            String hoTen = resultSet1.getString("hoTen");
            list.add(new ThanhVienGiaDinh(id,hoTen));
        }
        idCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,Integer>("idNhanKhau"));
        hoTenCol.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,String>("hoTen"));
        thanhVienCuTable.setItems(list);
        list1.clear();
        idCol1.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,Integer>("idNhanKhau"));
        hoTenCol1.setCellValueFactory(new PropertyValueFactory<ThanhVienGiaDinh,String>("hoTen"));
        thanhVienMoiTable.setItems(list1);
        diaChiMoiTF.setText("");
        maKhuVucMoiTF.setText("");
        maHoKhauMoiTF.setText("");

    }

    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backB.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void chuyenMoi(){
        if(thanhVienCuTable.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        //TachHoKhauSupporter.idNhanKhauChuyenMoiTarget = thanhVienCuTable.getSelectionModel().getSelectedItem().getIdNhanKhau();
        ThanhVienGiaDinh thanhVienDuocChon = thanhVienCuTable.getSelectionModel().getSelectedItem();
        list1.add(thanhVienDuocChon);
        thanhVienMoiTable.setItems(list1);
        thanhVienCuTable.getItems().remove(thanhVienDuocChon);

    }
    public void chuyenCu(){
        if(thanhVienMoiTable.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        //TachHoKhauSupporter.idNhanKhauChuyenMoiTarget = thanhVienCuTable.getSelectionModel().getSelectedItem().getIdNhanKhau();
        ThanhVienGiaDinh thanhVienDuocChon = thanhVienMoiTable.getSelectionModel().getSelectedItem();
        list.add(thanhVienDuocChon);
        thanhVienCuTable.setItems(list);
        thanhVienMoiTable.getItems().remove(thanhVienDuocChon);
    }

    //dang lam do
    public void ok() throws SQLException {
        String maHoKhauCu = HoKhau.maHoKhauTarget;
        String sql9 = "select ho_khau.ID from ho_khau, nhan_khau where ho_khau.idChuHo = nhan_khau.ID and maHoKhau = N'" + maHoKhauCu + "';";
        ResultSet resultSet9 = SQLConnection.statement.executeQuery(sql9);
        int idHoKhauCu = 0;
        if(resultSet9.next()){
            idHoKhauCu = resultSet9.getInt("ID");
        }

        String maHoKhauMoi = maHoKhauMoiTF.getText();
        String diaChiMoi = diaChiMoiTF.getText();
        String maKhuVucMoi = maKhuVucMoiTF.getText();
        if(maHoKhauMoi == null || diaChiMoi == null || maKhuVucMoi == null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa nhập đủ thông tin về hộ mới trong bảng");
            alert.showAndWait();
            return;
        }
        if(list1.size()==0){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Hộ mới chưa có thành viên nào!");
            alert.showAndWait();
            return;
        }
        ThanhVienGiaDinh chuHo = list1.get(0);
        //System.out.println(chuHo.getHoTen());

        String sql = "insert into ho_khau(maHoKhau, maKhuVuc, diaChi, idChuHo, ngayLap) values (N'" + maHoKhauMoi
                + "',N'" + maKhuVucMoi + "',N'" + diaChiMoi + "'," + chuHo.getIdNhanKhau() + ", convert(date,getdate()))";
        //System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);

        String sql3 = "delete from thanh_vien_cua_ho where idNhanKhau = " + chuHo.getIdNhanKhau()
                + " and idHoKhau = " + idHoKhauCu + ";";
        SQLConnection.statement.executeUpdate(sql3);

        if(list1.size()==1) {
            Alert alert = new Alert(Alert.AlertType.INFORMATION);
            alert.setTitle("Thành công");
            alert.setHeaderText("Tách hộ khẩu thành công");
            alert.setContentText("Chúc mừng bạn đã tách hộ khẩu thành công");
            alert.showAndWait();
            return;
        }
        int idHoKhauMoi = 0;

        String sql4 = "select * from ho_khau where maHoKhau = N'" + maHoKhauMoi + "';";
        System.out.println(sql4);
        ResultSet resultSet4 = SQLConnection.statement.executeQuery(sql4);
        if(resultSet4.next()){
            idHoKhauMoi = resultSet4.getInt("ID");
        }

        for(int i = 1; i < list1.size(); i++){
            ThanhVienGiaDinh thanhVienGiaDinh = list1.get(i);
            String sql1 = "insert into thanh_vien_cua_ho(idNhanKhau, idHoKhau, quanHeVoiChuHo) values ("
                    + thanhVienGiaDinh.getIdNhanKhau() + "," + idHoKhauMoi + ",N'Chưa xác định');";
            System.out.println(sql1);
            SQLConnection.statement.executeUpdate(sql1);


            String sql2 = "delete from thanh_vien_cua_ho where idNhanKhau = " + thanhVienGiaDinh.getIdNhanKhau()
                    + " and idHoKhau = " + idHoKhauCu + ";";
            SQLConnection.statement.executeUpdate(sql2);
        }
        this.initialize();
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Tách hộ khẩu thành công");
        alert.setContentText("Chúc mừng bạn đã tách hộ khẩu thành công");
        alert.showAndWait();
    }
}
