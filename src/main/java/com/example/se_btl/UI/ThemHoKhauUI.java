package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.service.SQLConnection;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ThemHoKhauUI {
    @FXML
    private Button checkB;
    @FXML
    private TextField ngaySinhTF;
    @FXML
    private TextField chuHoTF;
    @FXML
    private TextField cCCDTF;
    @FXML
    private TextField diaChiTF;
    @FXML
    private TextField maKhuVucTF;
    @FXML
    private TextField maHoKhauTF;
    @FXML
    private Button backB;

    public void back() throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backB.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lí trao thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
    public void them() throws SQLException {
        String maHoKhau = maHoKhauTF.getText();
        String maKhuVuc = maKhuVucTF.getText();
        String diaChi = diaChiTF.getText();
        String cCCD = cCCDTF.getText();
        int idChuHo;

        String sql1 = "select count(ID) from nhan_khau where CCCD = N'" + cCCD + "';";
        ResultSet resultSet1 = SQLConnection.statement.executeQuery(sql1);
        if (resultSet1.next()){
            System.out.println(resultSet1.getInt(1));
            if(resultSet1.getInt(1)==0){
                Alert alert = new Alert(Alert.AlertType.ERROR);
                alert.setTitle("Error");
                alert.setHeaderText("Thêm thất bại");
                alert.setContentText("CCCD không tồn tại trong danh sách nhân khẩu");
                alert.showAndWait();
                return;
            }
        }

        String sql2 = "select * from nhan_khau where CCCD = N'" + cCCD + "';";
        ResultSet resultSet2 = SQLConnection.statement.executeQuery(sql2);
        Boolean x = resultSet2.next();
        System.out.println(x);
        idChuHo = resultSet2.getInt("ID");
        System.out.println(idChuHo);


        String sql = "insert into ho_khau(maHoKhau, maKhuVuc, diaChi, idChuHo, ngayLap) values (N'" + maHoKhau
                + "',N'" + maKhuVuc + "',N'" + diaChi + "'," + idChuHo + ", convert(date,getdate()))";
        System.out.println(sql);
        SQLConnection.statement.executeUpdate(sql);

        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Thành công");
        alert.setHeaderText("Thêm hộ khẩu thành công");
        alert.setContentText("Chúc mừng bạn đã thêm hộ khẩu thành công");
        alert.showAndWait();
        return;

    }
    public void check() throws SQLException {
        String cCCD = cCCDTF.getText();
        String sql1 = "select count(ID) from nhan_khau where CCCD = N'" + cCCD + "';";
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
        String sql = "select * from nhan_khau where CCCD = N'" + cCCD + "';";
        ResultSet resultSet = SQLConnection.statement.executeQuery(sql);
        while (resultSet.next()){
            chuHoTF.setText(resultSet.getString("hoTen"));
            ngaySinhTF.setText(resultSet.getString("namSinh"));
        }
    }

}
