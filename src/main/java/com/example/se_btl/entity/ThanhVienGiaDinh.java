package com.example.se_btl.entity;

public class ThanhVienGiaDinh {
    private int idNhanKhau;
    private int idHoKhau;
    private String quanHeVoiChuHo;
    private String hoTen;
    private String ngaySinh;
    public static String hoTenTarget;
    public static int idNhanKhauTarget;
    public static String maHoKhauTarget;
    public static int idChuHoCuTarget;


    public ThanhVienGiaDinh(String hoTen, String ngaySinh, String quanHeVoiChuHo) {
        this.quanHeVoiChuHo = quanHeVoiChuHo;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
    }

    public ThanhVienGiaDinh(int idNhanKhau, String hoTen, String ngaySinh, String quanHeVoiChuHo) {
        this.idNhanKhau = idNhanKhau;
        this.quanHeVoiChuHo = quanHeVoiChuHo;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
    }





    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getNgaySinh() {
        return ngaySinh;
    }

    public void setNgaySinh(String ngaySinh) {
        this.ngaySinh = ngaySinh;
    }

    public int getIdNhanKhau() {
        return idNhanKhau;
    }

    public void setIdNhanKhau(int idNhanKhau) {
        this.idNhanKhau = idNhanKhau;
    }

    public int getIdHoKhau() {
        return idHoKhau;
    }

    public void setIdHoKhau(int idHoKhau) {
        this.idHoKhau = idHoKhau;
    }

    public String getQuanHeVoiChuHo() {
        return quanHeVoiChuHo;
    }

    public void setQuanHeVoiChuHo(String quanHeVoiChuHo) {
        this.quanHeVoiChuHo = quanHeVoiChuHo;
    }
}
