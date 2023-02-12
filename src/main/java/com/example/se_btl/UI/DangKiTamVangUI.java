package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.entity.NhanKhau;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class DangKiTamVangUI {

    @FXML
    private TextField maGiayTamVangTF;
    @FXML
    private TextArea liDoTA;
    @FXML
    private DatePicker tuNgayCB;
    @FXML
    private DatePicker denNgayCB;
    @FXML
    private Button backB;
    @FXML
    private TextField CCCDTF;
    @FXML
    private TextField hoTenTF;
    @FXML
    private TextField noiTamVangTF;



    public void initialize() throws SQLException, IOException {
        int idOrigin = NhanKhau.idTarget;
        String sql = "SELECT * FROM nhan_khau WHERE ID = " + idOrigin + ";";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        while (resultSet.next()){
            String hoTen = resultSet.getString("hoTen");
            hoTenTF.setText(hoTen);
            String CCCD = resultSet.getString("CCCD");
            CCCDTF.setText(CCCD);
        }
    }

    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backB.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lý phần thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void xacNhan() throws SQLException {
        String maTamVang = maGiayTamVangTF.getText();

        String tuNgay = tuNgayCB.getValue().toString();
        String denNgay = denNgayCB.getValue().toString();
        String liDo = liDoTA.getText();
        String noiTamVang = noiTamVangTF.getText();
        Date thoigiantamvang=new Date();
        int idOrigin1 = NhanKhau.idTarget;
        if(maTamVang.length()==0||tuNgay.length()==0||denNgay.length()==0||liDo.length()==0||noiTamVang.length()==0){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Thất bại");
            alert.setContentText("Chưa nhập đủ thông tin cần thiết");
            alert.showAndWait();
            return;
        }
        String sql = "insert into tam_vang(idNhanKhau, maGiayTamVang, noiTamTru, tuNgay, denNgay, lyDo) values ("
                + NhanKhau.idTarget + ", N'" + maTamVang + "',N'" + noiTamVang + "','" + tuNgay + "','" + denNgay + "',N'"
                + liDo + "')" ;
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);
        String sql5 = "SELECT * FROM nhan_khau WHERE ID = " + idOrigin1 + ";";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql5);
        String hoTen=null;
        while (resultSet.next()){
            hoTen = resultSet.getString("hoTen");
        }
        System.out.print(hoTen);
        String sql2= "insert into lich_su(thoigian,noidung)" + "values(N'" + String.format("%s",thoigiantamvang.toString())+ "',N'" + String.format("Nhân khẩu đăng ký tạm vắng: %s", hoTen) + "');";
        SQLConnection.statement.executeUpdate(sql2);
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thông báo");
        alert.setHeaderText("Thành công");
        alert.setContentText("Chúc mừng bạn đã đăng kí tạm vắng thành công!");
        alert.showAndWait();
    }


}
