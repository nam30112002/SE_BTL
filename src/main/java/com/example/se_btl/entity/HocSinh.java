package com.example.se_btl.entity;

public class HocSinh {
    public int ID;
    public String danh_hieu;
    public String trang_thai;

    public HocSinh(int ID, String danh_hieu, String trang_thai){
        this.ID = ID;
        this.danh_hieu = danh_hieu;
        this.trang_thai = trang_thai;
    }

    public int getID() {
        return ID;
    }

    public String getDanh_hieu() {
        return danh_hieu;
    }

    public String getTrang_thai() {
        return trang_thai;
    }
}
