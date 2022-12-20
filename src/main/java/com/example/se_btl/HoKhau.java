package com.example.se_btl;

public class HoKhau {
    public String soHoKhau;
    public String khuVuc;
    public String diaChi;
    public String ngayLap;
    public String chuHo;

    public String getSoHoKhau() {
        return soHoKhau;
    }

    public void setSoHoKhau(String soHoKhau) {
        this.soHoKhau = soHoKhau;
    }

    public String getKhuVuc() {
        return khuVuc;
    }

    public void setKhuVuc(String khuVuc) {
        this.khuVuc = khuVuc;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getNgayLap() {
        return ngayLap;
    }

    public void setNgayLap(String ngayLap) {
        this.ngayLap = ngayLap;
    }

    public String getChuHo() {
        return chuHo;
    }

    public void setChuHo(String chuHo) {
        this.chuHo = chuHo;
    }
    public HoKhau(String soHoKhau, String khuVuc, String diaChi, String ngayLap, String chuHo){
        this.soHoKhau = soHoKhau;
        this.khuVuc = khuVuc;
        this.diaChi = diaChi;
        this.ngayLap = ngayLap;
        this.chuHo = chuHo;
    }
}
