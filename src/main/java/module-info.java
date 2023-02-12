module com.example.se_btl {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;

    exports com.example.se_btl;
    opens com.example.se_btl to javafx.fxml;
    exports com.example.se_btl.entity;
    opens com.example.se_btl.entity to javafx.fxml;
    exports com.example.se_btl.UI;
    opens com.example.se_btl.UI to javafx.fxml;
    exports com.example.se_btl.service;
    opens com.example.se_btl.service to javafx.fxml;

}