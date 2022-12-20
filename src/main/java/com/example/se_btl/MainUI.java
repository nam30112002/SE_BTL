package com.example.se_btl;

import com.example.se_btl.App;
import com.example.se_btl.HoKhau;
//import com.example.se_btl.ListHoKhau;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Objects;
import java.util.ResourceBundle;

public class MainUI  {
    public MenuItem doiMatKhauMenuItem;
    @FXML
    private MenuItem dangXuat;
    @FXML
    private MenuBar mainMenuBar;
    @FXML
    private TableView<HoKhau> bangHoKhau;
    @FXML
    private TableColumn<HoKhau,String> soHoKhauCol;
    @FXML
    private TableColumn<HoKhau,String> khuVucCol;
    @FXML
    private TableColumn<HoKhau,String> diaChiCol;
    @FXML
    private TableColumn<HoKhau,String> ngayLapCol;
    @FXML
    private TableColumn<HoKhau,String> chuHoCol;
    @FXML
    private TextField soHoKhauTF;
    @FXML
    private TextField ngayLapTF;
    @FXML
    private TextField diaChiTF;
    @FXML
    private TextField khuvucTF;
    @FXML
    private TextField chuHoTF;
    @FXML
    private Button xacNhanTaoMoiB;
    @FXML
    private TextField soHoKhauTF1;
    @FXML
    private TextField soNhanKhauTF1;
    @FXML
    private Button xacNhanThemNhanKhauB;
    @FXML
    private Button kiemTraChuHoB;

    @FXML
    private TextField soHoKhauTF11;
    @FXML
    private TextField soNhanKhauTF11;
    @FXML
    private Button kiemTraChuHoB1;
    @FXML
    private Button xacNhanB1;
    @FXML
    private TextField hoKhauXoaTF;



    public void logOut(ActionEvent event) throws IOException, SQLException {
        System.out.println("da log out");

        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("LoginUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());

        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) mainMenuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đăng nhập");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void chuyenDoiMatKhauUI(ActionEvent event) throws IOException {
        System.out.println("chuyen doi mat khau");
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("DoiMatKhauUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        //Stage stage = (Stage)( (Node) event.getSource() ).getScene().getWindow(); //lay stage chua LoginUI
        //Stage stage = (Stage)dangXuat.getParentPopup().getOwnerWindow(); //menuitem khong phai la lop con cua Node
        Stage stage = (Stage) mainMenuBar.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý trao thưởng - Đổi mật khẩu");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }



    public void initialize() {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        try {
            Connection conn = DriverManager.getConnection(dbURL);
            Statement statement = conn.createStatement();
            String SQL = "select * from hokhau";
            ResultSet resultSet = statement.executeQuery(SQL);
            ObservableList<HoKhau> list = FXCollections.observableArrayList();

            while (resultSet.next()) {
                String soHoKhau = resultSet.getString(1);
                //System.out.println(soHoKhau);
                String khuVuc = resultSet.getString(2);
                String diaChi = resultSet.getString(3);
                String ngayLap = resultSet.getString(4);
                String chuHo = resultSet.getString(5);
                list.add(new HoKhau(soHoKhau,khuVuc,diaChi,ngayLap,chuHo));
            }
            //System.out.println(list.get(1));


            soHoKhauCol.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("soHoKhau"));
            khuVucCol.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("khuVuc"));
            diaChiCol.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("diaChi"));
            ngayLapCol.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("ngayLap"));
            chuHoCol.setCellValueFactory(new PropertyValueFactory<HoKhau,String>("chuHo"));

            //System.out.println(list);
            bangHoKhau.setItems(list);//loi
        } catch (SQLException e) {
            System.err.println("Cannot connect database, " + e);
        }
    }

    public void xacNhanTaoMoiSHK(ActionEvent event) throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String soHoKhau = soHoKhauTF.getText();
        String ngayLap = ngayLapTF.getText();
        String diaChi = diaChiTF.getText();
        String khuVuc = khuvucTF.getText();
        String chuHo = chuHoTF.getText();
        System.out.println(chuHo);
        if(Objects.equals(soHoKhau, "") || Objects.equals(ngayLap, "") || Objects.equals(diaChi, "") || Objects.equals(khuVuc, "") || Objects.equals(chuHo, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Tạo mới sổ hộ khẩu thất bại");
            alert.setContentText("Chưa nhập đủ thông tin");
            alert.showAndWait();
            return;
        }
        String SQL = "insert into hokhau(sohokhau, khuvuc, diachi, ngaylap, chuho) values (N'" + soHoKhau + "',N'" + khuVuc + "',N'" +
                diaChi +"',N'" + ngayLap + "',N'" + chuHo + "');";
        System.out.println(SQL);
        statement.executeUpdate(SQL);
        this.initialize();
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Tạo mới thành công");
        alert.setContentText("Chúc mừng bạn đã tạo mới thành công");
        alert.showAndWait();
    }

    public void kiemTraTenChuHo() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String SQL="select * from hokhau";
        String soHoKhau = soHoKhauTF1.getText();
        String soNhanKhau = soNhanKhauTF1.getText();
        ResultSet resultSet = statement.executeQuery(SQL);
        int count = 0;
        if (Objects.equals(soHoKhau, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Bạn chưa nhập số hộ khẩu!");
            alert.showAndWait();
            return;
        }
        while (resultSet.next()) {
            String soHoKhauCheck = resultSet.getString(1);
            //System.out.println(soHoKhauCheck);
            //System.out.println(soHoKhau);
            //System.out.println(soHoKhauCheck.compareTo(soHoKhau));
            if (soHoKhauCheck.compareTo(soHoKhau)==0) {
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Thông báo");
                alert.setHeaderText("Kiểm tra thành công");
                alert.setContentText("Tên chủ hộ là: " + resultSet.getString(5));
                alert.showAndWait();
                count++;
                return;
            }
        }
        if (count == 0) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại");
            alert.showAndWait();
        }

    }

    public void xacNhanThemNhanKhau() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String soHoKhau = soHoKhauTF1.getText();
        String soNhanKhau = soNhanKhauTF1.getText();
        if(Objects.equals(soNhanKhau, "") || Objects.equals(soHoKhau, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa nhập đủ thông tin");
            alert.showAndWait();
            return;
        }
        if (!check(soHoKhau)){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại!");
            alert.showAndWait();
            return;
        }

        String SQL = "insert into nhankhau(sohokhau, cccd) values ('" + soHoKhau + "','" + soNhanKhau + "');" ;
        //System.out.println(SQL);
        statement.executeUpdate(SQL);
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thêm nhân khẩu thành công");
        alert.setContentText("Chúc mừng bạn đã thêm nhân khẩu thành công!");
        alert.showAndWait();
    }
    public boolean check(String soHoKhau) throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String SQL="select * from hokhau";
        ResultSet resultSet = statement.executeQuery(SQL);

        while (resultSet.next()) {
            String soHoKhauCheck = resultSet.getString(1);
            if (soHoKhauCheck.compareTo(soHoKhau)==0) {
                return true;
            }
        }
        return false;
    }

    public void xacNhanTTChuHo() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String soHoKhau = soHoKhauTF11.getText();
        String soNhanKhau = soNhanKhauTF11.getText();
        if(Objects.equals(soNhanKhau, "") || Objects.equals(soHoKhau, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa nhập đủ thông tin");
            alert.showAndWait();
            return;
        }
        if (!check(soHoKhau)){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại!");
            alert.showAndWait();
            return;
        }

        String SQL = "update hokhau set cccdchuho = '" + soNhanKhau + "' where sohokhau = '" + soHoKhau + "';" ;
        System.out.println(SQL);
        statement.executeUpdate(SQL);

        String SQL1 = "insert into nhankhau(sohokhau, cccd) values ('" + soHoKhau + "','" + soNhanKhau + "');" ;
        statement.executeUpdate(SQL1);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Chúc mừng bạn đã xác nhận thông tin chủ hộ thành công!");
        alert.showAndWait();
    }

    public void kiemTraTenChuHo1() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String SQL="select * from hokhau";
        String soHoKhau = soHoKhauTF11.getText();
        ResultSet resultSet = statement.executeQuery(SQL);
        int count = 0;
        if (Objects.equals(soHoKhau, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Bạn chưa nhập số hộ khẩu!");
            alert.showAndWait();
            return;
        }
        while (resultSet.next()) {
            String soHoKhauCheck = resultSet.getString(1);
            //System.out.println(soHoKhauCheck);
            //System.out.println(soHoKhau);
            //System.out.println(soHoKhauCheck.compareTo(soHoKhau));
            if (soHoKhauCheck.compareTo(soHoKhau)==0) {
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Thông báo");
                alert.setHeaderText("Kiểm tra thành công");
                alert.setContentText("Tên chủ hộ là: " + resultSet.getString(5));
                alert.showAndWait();
                count++;
                return;
            }
        }
        if (count == 0) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại");
            alert.showAndWait();
        }
    }

    public void kiemTraTenChuHo2() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String SQL="select * from hokhau";
        String soHoKhau = hoKhauXoaTF.getText();
        ResultSet resultSet = statement.executeQuery(SQL);
        int count = 0;
        if (Objects.equals(soHoKhau, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Bạn chưa nhập số hộ khẩu!");
            alert.showAndWait();
            return;
        }
        while (resultSet.next()) {
            String soHoKhauCheck = resultSet.getString(1);
            if (soHoKhauCheck.compareTo(soHoKhau)==0) {
                Alert alert = new Alert(Alert.AlertType.INFORMATION);
                alert.setTitle("Thông báo");
                alert.setHeaderText("Kiểm tra thành công");
                alert.setContentText("Tên chủ hộ là: " + resultSet.getString(5));
                alert.showAndWait();
                count++;
                return;
            }
        }
        if (count == 0) {
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Kiểm tra thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại");
            alert.showAndWait();
        }
    }
    public void xoaB() throws SQLException {
        String dbURL = "jdbc:sqlserver://localhost\\NAM30112002;database=user_of_QLNK;encrypt=false;user=nam;password=nam30112002";
        Connection conn = DriverManager.getConnection(dbURL);
        Statement statement = conn.createStatement();
        String hoKhauXoa = hoKhauXoaTF.getText();
        if (!check(hoKhauXoa)){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Xóa thất bại");
            alert.setContentText("Số hộ khẩu không tồn tại");
            alert.showAndWait();
            return;
        }
        if (Objects.equals(hoKhauXoa, "")){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Xóa thất bại");
            alert.setContentText("Chưa nhập đủ thông tin");
            alert.showAndWait();
            return;
        }
        String SQL = "delete from nhankhau where sohokhau = '" + hoKhauXoa + "';" ;
        statement.executeUpdate(SQL);
        String SQL1 = "delete from hokhau where sohokhau = '" + hoKhauXoa + "';" ;
        statement.executeUpdate(SQL1);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Chúc mừng bạn đã xóa hộ khẩu thành công!");
        alert.showAndWait();
    }


}
