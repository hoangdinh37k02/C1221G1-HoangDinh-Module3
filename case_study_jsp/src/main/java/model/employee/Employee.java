package model.employee;

public class Employee {
    private int maNhanVien;
    private String hoTen;
    private String ngaySinh;
    private String soCMND;
    private double luong;
    private String soDT;
    private String email;
    private String diaChi;
    private int maTrinhDo;
    private int maBoPhan;
    private int maViTri;

    public Employee(String hoTen, String ngaySinh, String soCMND, double luong, String soDT, String email, String diaChi, int maTrinhDo, int maBoPhan, int maViTri) {
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.soCMND = soCMND;
        this.luong = luong;
        this.soDT = soDT;
        this.email = email;
        this.diaChi = diaChi;
        this.maTrinhDo = maTrinhDo;
        this.maBoPhan = maBoPhan;
        this.maViTri = maViTri;
    }

    public Employee(int maNhanVien, String hoTen, String ngaySinh, String soCMND, double luong, String soDT, String email, String diaChi, int maTrinhDo, int maBoPhan, int maViTri) {
        this.maNhanVien = maNhanVien;
        this.hoTen = hoTen;
        this.ngaySinh = ngaySinh;
        this.soCMND = soCMND;
        this.luong = luong;
        this.soDT = soDT;
        this.email = email;
        this.diaChi = diaChi;
        this.maTrinhDo = maTrinhDo;
        this.maBoPhan = maBoPhan;
        this.maViTri = maViTri;
    }

    public int getMaNhanVien() {
        return maNhanVien;
    }

    public void setMaNhanVien(int maNhanVien) {
        this.maNhanVien = maNhanVien;
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

    public String getSoCMND() {
        return soCMND;
    }

    public void setSoCMND(String soCMND) {
        this.soCMND = soCMND;
    }

    public double getLuong() {
        return luong;
    }

    public void setLuong(double luong) {
        this.luong = luong;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public int getMaTrinhDo() {
        return maTrinhDo;
    }

    public void setMaTrinhDo(int maTrinhDo) {
        this.maTrinhDo = maTrinhDo;
    }

    public int getMaBoPhan() {
        return maBoPhan;
    }

    public void setMaBoPhan(int maBoPhan) {
        this.maBoPhan = maBoPhan;
    }

    public int getMaViTri() {
        return maViTri;
    }

    public void setMaViTri(int maViTri) {
        this.maViTri = maViTri;
    }
}
