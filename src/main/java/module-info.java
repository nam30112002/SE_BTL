module com.example.se_btl {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.se_btl to javafx.fxml;
    exports com.example.se_btl;
}