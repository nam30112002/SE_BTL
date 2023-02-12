package com.example.se_btl.UI;


import com.example.se_btl.App;
import com.example.se_btl.entity.HoKhau;
import com.example.se_btl.entity.LichSu;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.entity.ThanhVienGiaDinh;
import com.example.se_btl.entity.TreEm;
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
import javafx.scene.input.MouseDragEvent;
import javafx.scene.layout.Pane;
import javafx.scene.layout.StackPane;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.*;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

public class MainUI  {
    public TableView table_lichsu;
    public TableColumn thoigian_ls_cl;
    public TableColumn noidung_ls_cl;
    public TableColumn cccd_tre_em;
    public TableColumn hoten_tre_em;
    public TableColumn ngaysinh_tre_em;
    public TableView bang_tre_em;
    public Button trao_thuong_btn;
    public TextField thanhtichTF;
    public ChoiceBox ptThanhTichTF;
    public TextField slThanhTichTF;
    public ChoiceBox ptTreEmTF;
    public TextField slPhanThuongTE;
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
    private Map phanthuong = new HashMap<String, String>();
    private Map giaphanthuong = new HashMap<String, Integer>();
    private Map pt_mpt = new HashMap<String, String>();
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


        String sql7_2= "select * from phan_thuong";
        ResultSet resultSet7_2 = SQLConnection.statement.executeQuery(sql7_2);
        while (resultSet7_2.next()){
            String mpt = resultSet7_2.getString("maphanthuong");
            String tenpt = resultSet7_2.getString("tenphanthuong");
            int dongia = resultSet7_2.getInt("dongia");
            phanthuong.put(mpt, tenpt);
            giaphanthuong.put(mpt, dongia);
            pt_mpt.put(tenpt,mpt);
        }
        String sql7 = "select distinct * from nhan_khau nk, tre_em te where te.cccd = nk.cccd";
        ResultSet resultSet7 =  SQLConnection.statement.executeQuery(sql7);
        ObservableList<TreEm> list_tre_em = FXCollections.observableArrayList();
        while (resultSet7.next()){
            int id = resultSet7.getInt("id");
            String cccd = resultSet7.getString("cccd");
            System.out.println(cccd);
            String hoTen = resultSet7.getString("hoTen");
            String namSinh = resultSet7.getDate("namSinh").toString();
            String mpt_tre_em = resultSet7.getString("mpt_tre_em");
            String mpt_thanh_tich = resultSet7.getString("mpt_thanh_tich");
            int sl_pt_tre_em = resultSet7.getInt("sl_pt_tre_em");
            int sl_pt_thanh_tich = resultSet7.getInt("sl_pt_thanh_tich");
            String thanh_tich = resultSet7.getString("thanh_tich");
            list_tre_em.add(new TreEm(cccd, hoTen, namSinh, mpt_tre_em, mpt_thanh_tich, sl_pt_tre_em, sl_pt_thanh_tich, thanh_tich));
        }
        cccd_tre_em.setCellValueFactory(new PropertyValueFactory<TreEm, String>("cccd"));
        hoten_tre_em.setCellValueFactory(new PropertyValueFactory<TreEm, String>("hoten"));
        ngaysinh_tre_em.setCellValueFactory(new PropertyValueFactory<TreEm, String>("ngaysinh"));
        bang_tre_em.setItems(list_tre_em);
        // set cac loai phan thuong
        String sql8 = "select * from phan_thuong";
        ResultSet resultSet8 = SQLConnection.statement.executeQuery(sql8);
        ptTreEmTF.getItems().clear();
        ptThanhTichTF.getItems().clear();
        while (resultSet8.next()){
            String pt = resultSet8.getString("tenphanthuong");
            ptThanhTichTF.getItems().add(pt);
            ptTreEmTF.getItems().add(pt);
        }


        String sql20="select * from lich_su";
        ResultSet resultSet20=SQLConnection.statement.executeQuery(sql20);
        ObservableList<LichSu> list_lichsu = FXCollections.observableArrayList();
        while(resultSet20.next()){
            String thoigian=resultSet20.getString("thoigian");
            String noidung=resultSet20.getString("noidung");
            list_lichsu.add(new LichSu(noidung,thoigian));
        }
        thoigian_ls_cl.setCellValueFactory(new PropertyValueFactory<LichSu,String>("thoigian"));
        noidung_ls_cl.setCellValueFactory(new PropertyValueFactory<LichSu,String >("noidung"));
        table_lichsu.setItems(list_lichsu);
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
        Date thoigianxoa=new Date();
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        String sql3= "select hoTen from nhan_khau where ID=" + NhanKhau.idTarget + ";";
        ResultSet hoTen = SQLConnection.statement.executeQuery(sql3);
        String hoTenString=null;
        if (hoTen.next()) {
            hoTenString = hoTen.getString("hoTen");
        }
        String sql = "delete from nhan_khau where ID = " + NhanKhau.idTarget + ";";
        SQLConnection.statement.executeUpdate(sql);
        this.initialize();
        String sql2= "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigianxoa.toString())+ "',N'" + String.format("Xoá nhân khẩu: %s", hoTenString) + "');";
        SQLConnection.statement.executeUpdate(sql2);
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
    public void tachHoKhau() throws IOException {
        if(bangHoKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn hộ khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        HoKhau.maHoKhauTarget = bangHoKhau.getSelectionModel().getSelectedItem().getMaHoKhau();

        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("TachHoKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Tách hộ khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);

    }
    public void xoaHoKhau() throws SQLException {
        if(bangHoKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Xóa thất bại");
            alert.setContentText("Chưa chọn hộ khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        java.util.Date thoigianxoa= new java.util.Date();
        HoKhau.maHoKhauTarget = bangHoKhau.getSelectionModel().getSelectedItem().getMaHoKhau();
        String maHoKhauXoa = HoKhau.maHoKhauTarget;
        String sql1 = "select * from ho_khau where maHoKhau = N'" + maHoKhauXoa + "';";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql1);

        int idHoKhauXoa = -1;
        int idChuHo=0;
        if(resultSet.next()){
            idHoKhauXoa = resultSet.getInt("ID");
            idChuHo=resultSet.getInt("idChuHo");
        }
        String sql3= "select hoTen from nhan_khau where ID=" + idChuHo + ";";
        ResultSet hoTen = SQLConnection.statement.executeQuery(sql3);
        String hoTenString=null;
        if (hoTen.next()) {
            hoTenString = hoTen.getString("hoTen");
        }
        String sql5= "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigianxoa.toString())+ "',N'" + String.format("Xoá hộ khẩu của chủ hộ: %s", hoTenString) + "');";
        SQLConnection.statement.executeUpdate(sql5);
        String sql = "delete from thanh_vien_cua_ho where idHoKhau = " + idHoKhauXoa + ";";
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        String sql2 = "delete from ho_khau where maHoKhau = N'" + maHoKhauXoa + "'";
        System.out.println(sql2);
        SQLConnection.statement.executeUpdate(sql2);
        this.initialize();

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Xóa hộ khẩu thành công");
        alert.setContentText("Chúc mừng bạn đã xóa hộ khẩu thành công");
        alert.showAndWait();
    }
    public void chinhSuaDiaChiHoKhau() throws IOException {
        if(bangHoKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Chỉnh sửa thất bại");
            alert.setContentText("Chưa chọn hộ khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        HoKhau.maHoKhauTarget = bangHoKhau.getSelectionModel().getSelectedItem().getMaHoKhau();

        Stage stage1 = new Stage();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("ChinhSuaDiaChiHoKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        stage1.setTitle("Chỉnh sửa địa chỉ hộ khẩu");
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

    public void khaiTu() throws IOException {
        if(bangNhanKhau.getSelectionModel().getSelectedItem()==null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa chọn nhân khẩu trong bảng");
            alert.showAndWait();
            return;
        }
        NhanKhau.idTarget = bangNhanKhau.getSelectionModel().getSelectedItem().getId();
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("KhaiTuUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) menuBar.getScene().getWindow();
        stage.setTitle("Khai tử");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }


    public void traoThuong(ActionEvent actionEvent) throws SQLException {
        TreEm selectedTreEm = (TreEm) bang_tre_em.getSelectionModel().getSelectedItem();
        String thanhtich = thanhtichTF.getText();
        String ptThanhTich = (String) ptThanhTichTF.getValue();
        String ptTreEm = (String) ptTreEmTF.getValue();
        int sl_pt_thanh_tich = Integer.parseInt(slThanhTichTF.getText());
        int sl_pt_tre_em = Integer.parseInt(slPhanThuongTE.getText());
        String sql = String.format("UPDATE tre_em SET thanh_tich = '%s', mpt_tre_em = '%s', mpt_thanh_tich = '%s', sl_pt_tre_em = %d, sl_pt_thanh_tich=%d where cccd = '%s'", thanhtich, pt_mpt.get(ptThanhTich), pt_mpt.get(ptTreEm), sl_pt_tre_em, sl_pt_thanh_tich, selectedTreEm.getCccd());
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
    }

    public void setTraoThuong() {
//        System.out.println("1");
        TreEm selectedTreEm = (TreEm) bang_tre_em.getSelectionModel().getSelectedItem();
        thanhtichTF.setText(selectedTreEm.getThanh_tich());
        ptThanhTichTF.setValue(phanthuong.get(selectedTreEm.getMpt_thanh_tich()));
        ptTreEmTF.setValue(phanthuong.get(selectedTreEm.getMpt_tre_em()));
        slPhanThuongTE.setText(String.valueOf(selectedTreEm.getSl_pt_tre_em()));
        slThanhTichTF.setText(String.valueOf(selectedTreEm.getSl_pt_thanh_tich()));
    }
}
