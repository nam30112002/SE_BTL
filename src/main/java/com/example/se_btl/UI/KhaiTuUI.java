package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.UserController;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.DatePicker;
import javafx.scene.control.TextField;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KhaiTuUI {

    @FXML
    private TextField lyDoTF;
    @FXML
    private DatePicker ngayMatTF;
    @FXML
    private TextField soKhaiTuTF;
    @FXML
    private Button backB;
    @FXML
    private TextField cccdTF;
    @FXML
    private TextField tenTF;


    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backB.getScene().getWindow();
        stage.setTitle("Quản lý trao thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
    public void check() throws SQLException {
        UserController.count1 = 0;
        String cccd = cccdTF.getText();
        String sql1 = "select count(ID) from nhan_khau where CCCD = N'" + cccd + "';";
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql1);
        if (resultSet1.next()){
            System.out.println(resultSet1.getInt(1));
            if(resultSet1.getInt(1)==0){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Kiểm tra thất bại");
                alert.setContentText("CCCD không tồn tại trong danh sách nhân khẩu");
                alert.showAndWait();
                return;
            }
        }
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Check thành công");
        alert.showAndWait();
        String sql3 = "select * from nhan_khau where CCCD = N'" + cccd + "';";
        ResultSet resultSet3 = SQLConnection.statement.executeQuery(sql3);
        String ten = null;
        if(resultSet3.next()){
            ten = resultSet3.getString("hoTen");
        }
        tenTF.setText(ten);
        UserController.count1 = 1;
    }
    public void xacNhan() throws SQLException, IOException {
        String lyDo = lyDoTF.getText();
        String soKhaiTu = soKhaiTuTF.getText();
        String cccd = cccdTF.getText();
        java.util.Date thoigian=new java.util.Date();
        int idNguoiKhai = 0;
        int idNguoiMat = NhanKhau.idTarget;
        //System.out.println(ngayMat);


        if(UserController.count1 == 0){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Bạn chưa check CCCD hoặc check CCCD chưa thành công, vui lòng check lại!");
            alert.showAndWait();
            return;
        }
        if(lyDo.length() == 0 || soKhaiTu.length() == 0 || ngayMatTF.getValue() == null){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Bạn chưa nhập đủ thông tin!");
            alert.showAndWait();
            return;
        }
        String ngayMat = ngayMatTF.getValue().toString();
        String sql3 = "select * from nhan_khau where CCCD = N'" + cccd + "';";
        ResultSet resultSet3 = SQLConnection.statement.executeQuery(sql3);
        if(resultSet3.next()){
            idNguoiKhai = resultSet3.getInt("ID");
        }
        String sql5="select *from nhan_khau where ID ="+idNguoiMat+";";
        ResultSet resultSet5 = SQLConnection.statement.executeQuery(sql5);
        String hoten=null;
        if(resultSet5.next()){
            hoten = resultSet5.getString("hoten");
        }
        String sql = "insert into khai_tu(soGiayKhaiTu, idNguoiKhai, idNguoiChet, ngayKhai, ngayChet, lyDoChet) " +
                "values (N'" + soKhaiTu + "'," + idNguoiKhai + "," + idNguoiMat + ", CAST( GETDATE() AS Date ), '" + ngayMat
                 + "', N'" + lyDo + "');";
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        String sql9 = "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigian.toString())+ "',N'" + String.format("Khai tử nhân khẩu: %s", hoten) + "');";
        System.out.println(sql9);
        SQLConnection.statement.executeUpdate(sql9);
        String sql1 = "delete from nhan_khau where ID = " + NhanKhau.idTarget + ";";
        System.out.println(sql1);
        SQLConnection.statement.executeUpdate(sql1);
        UserController.count1 = 0;
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Khai tử thành công!\nBạn sẽ được trở về trang chủ");
        alert.showAndWait();
        this.back();


    }
}
