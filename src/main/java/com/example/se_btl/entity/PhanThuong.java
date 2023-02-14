package com.example.se_btl.entity;

public class PhanThuong {
    String maPT;
    String tenPT;
    int dongia;
    public PhanThuong(String maPt, String tenPT, int dongia){
        this.maPT = maPt;
        this.tenPT = tenPT;
        this.dongia = dongia;

    }
    public int getDongia() {
        return dongia;
    }

    public String getMaPT() {
        return maPT;
    }

    public String getTenPT() {
        return tenPT;
    }

}
