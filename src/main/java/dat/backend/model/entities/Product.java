package dat.backend.model.entities;

public class Product {
    private Bottom bottom;
    private Topping topping;

    public Product(Bottom bottom, Topping topping) {
        this.bottom = bottom;
        this.topping = topping;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public Topping getTopping() {
        return topping;
    }

    public float getPrice() {
        return bottom.getPrice() + topping.getPrice();
    }
}
