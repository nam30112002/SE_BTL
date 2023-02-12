package com.example.se_btl.entity;

public class LichSu {
    String noidung;
    String thoigian;

    public String getThoigian() {
        return thoigian;
    }

    public String getNoidung() {
        return noidung;
    }

    public LichSu(String noidung, String thoigian) {
        this.noidung = noidung;
        this.thoigian=thoigian;
    }
}
