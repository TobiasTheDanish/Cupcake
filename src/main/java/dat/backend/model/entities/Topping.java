package dat.backend.model.entities;

public class Topping {
    private int id;
    private String flavor;
    private float price;

    public Topping(String flavor, float price) {
        this.flavor = flavor;
        this.price = price;
    }

    public Topping(int id, String flavor, float price) {
        this.id = id;
        this.flavor = flavor;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public String getFlavor() {
        return flavor;
    }

    public float getPrice() {
        return price;
    }
}
