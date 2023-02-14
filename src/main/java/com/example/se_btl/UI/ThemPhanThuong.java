package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.entity.PhanThuong;
import com.example.se_btl.service.SQLConnection;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
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

public class ThemPhanThuong {
    public TableView table_ds;
    public TableColumn mapt_col;
    public TableColumn dongia_col;
    public TableColumn tenpt_col;
    public TextField tenQuaTF;
    public TextField maQuaTF;
    public TextField donGiaTF;
    public Button backBtn;

    ObservableList<PhanThuong> list_pt = FXCollections.observableArrayList();
    public void initialize() throws SQLException {
        this.table_ds.getItems().clear();
        String sql = "select * from phan_thuong";
        ResultSet rs = SQLConnection.statement.executeQuery(sql);
        while (rs.next()){
            String maPT = rs.getString("maphanthuong");
            String tenPT = rs.getString("tenphanthuong");
            int dongia = rs.getInt("dongia");
            list_pt.add(new PhanThuong(maPT, tenPT, dongia));
        }
        mapt_col.setCellValueFactory(new PropertyValueFactory<PhanThuong, String>("maPT"));
        tenpt_col.setCellValueFactory(new PropertyValueFactory<PhanThuong, String>("tenPT"));
        dongia_col.setCellValueFactory(new PropertyValueFactory<PhanThuong, Integer>("dongia"));
        table_ds.setItems(list_pt);
    }

    public void backHome(ActionEvent actionEvent) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) backBtn.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lí trao thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }

    public void themPhanThuong(ActionEvent actionEvent) throws SQLException {
        String maPt = maQuaTF.getText();
        String tenPt = tenQuaTF.getText();
        int dongia = Integer.parseInt(donGiaTF.getText());
        String sql = String.format("insert into phan_thuong(maphanthuong, tenphanthuong, dongia) values (N'%s', N'%s', '%d');", maPt, tenPt, dongia);
        SQLConnection.statement.executeUpdate(sql);
        this.initialize();
    }
    public void xoaPhanThuong(ActionEvent actionEvent) throws SQLException {
        PhanThuong selectedPT = (PhanThuong) this.table_ds.getSelectionModel().getSelectedItem();
        String sql = String.format("delete from phan_thuong where maphanthuong = N'%s'", selectedPT.getMaPT());
        try {
            SQLConnection.statement.executeUpdate(sql);
        }catch (SQLException e){
            Alert alert = new Alert(Alert.AlertType.ERROR);
            alert.setTitle("Error");
            alert.setHeaderText("Xoá thất bại");
            alert.setContentText("Không thể xoá phần thưởng đã trao");
            alert.showAndWait();
            return;
        }
        this.initialize();
    }
}
