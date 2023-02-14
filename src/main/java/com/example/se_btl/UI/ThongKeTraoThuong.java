package com.example.se_btl.UI;

import com.example.se_btl.App;
import com.example.se_btl.entity.TreEm;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.geometry.Rectangle2D;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.stage.Screen;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.SQLException;

public class ThongKeTraoThuong {

    public TableView table_thongke;
    public TableColumn nameCol;
    public TableColumn thanhtichCol;
    public TableColumn pt_tt_col;
    public TableColumn pt_te_col;
    public Button back_btn;
    public Label tongTeLabel;
    public Label tongTtLabel;
    public Label tongTienLabel;
    ObservableList<TreEm> list_tre_em = MainUI.list_tre_em;

    int tongTE = 0;
    int tongTT = 0;
    int tongTien = 0;
    public void initialize(){
//        System.out.println(list_tre_em.size());
        nameCol.setCellValueFactory(new PropertyValueFactory<TreEm, String>("hoten"));
        thanhtichCol.setCellValueFactory(new PropertyValueFactory<TreEm, String>("thanh_tich"));
        pt_tt_col.setCellValueFactory(new PropertyValueFactory<TreEm, String>("thong_ke_pt_tt"));
        pt_te_col.setCellValueFactory(new PropertyValueFactory<TreEm, String>("thong_ke_pt_te"));
        table_thongke.setItems(list_tre_em);
        this.tongTE = list_tre_em.size();
        for (TreEm te: list_tre_em){
            if (te.getSl_pt_thanh_tich() > 0){
                this.tongTT += 1;
            }
            this.tongTien += te.getTongTien();
        }
        this.tongTeLabel.setText(String.valueOf(this.tongTE));
        this.tongTienLabel.setText(String.valueOf(this.tongTien));
        this.tongTtLabel.setText(String.valueOf(this.tongTT));
    }
    public void returnHome(ActionEvent actionEvent) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource("MainUI.fxml"));
        Scene scene = new Scene(fxmlLoader.load());
        Stage stage = (Stage) back_btn.getScene().getWindow();//tranh loi NUllPointer
        stage.setTitle("Quản lí trao thưởng");
        stage.setScene(scene);
        stage.show();
        Rectangle2D bounds = Screen.getPrimary().getVisualBounds();
        double x = bounds.getMinX() + (bounds.getWidth() - scene.getWidth()) * 0.5;
        double y = bounds.getMinY() + (bounds.getHeight() - scene.getHeight()) * 0.5;
        stage.setX(x);
        stage.setY(y);
    }
}
