package com.example.se_btl.entity;

public class NhanKhau {
    private int id;
    private String hoTen;
    private String ngaysinh;
    private String gioiTinh;
    private String diaChi;
    public static int idTarget;
    public static String tenTimKiem;

    public NhanKhau(int id, String hoTen, String ngaysinh,String gioiTinh, String diaChi){
        this.id = id;
        this.hoTen = hoTen;
        this.ngaysinh = ngaysinh;
        this.gioiTinh = gioiTinh;
        this.diaChi = diaChi;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(String ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }
}
