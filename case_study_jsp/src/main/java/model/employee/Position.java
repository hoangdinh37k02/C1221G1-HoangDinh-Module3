package model.employee;

public class Position {
    private int maViTri;
    private String tenViTri;

    public Position(int maViTri, String tenViTri) {
        this.maViTri = maViTri;
        this.tenViTri = tenViTri;
    }

    public int getMaViTri() {
        return maViTri;
    }

    public void setMaViTri(int maViTri) {
        this.maViTri = maViTri;
    }

    public String getTenViTri() {
        return tenViTri;
    }

    public void setTenViTri(String tenViTri) {
        this.tenViTri = tenViTri;
    }
}
