module com.example.se_btl {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;

    exports com.example.se_btl;
    opens com.example.se_btl to javafx.fxml;


}