package dat.backend.model.entities;

public class OrderItem {
    private Bottom bottom;
    private Topping topping;
    private int amount;

    public OrderItem(Bottom bottom, Topping topping, int amount) {
        this.bottom = bottom;
        this.topping = topping;
        this.amount = amount;
    }

    public Bottom getBottom() {
        return bottom;
    }

    public Topping getTopping() {
        return topping;
    }

    public int getAmount() {
        return amount;
    }

    public float getPrice() {
        return (bottom.getPrice() + topping.getPrice()) * amount;
    }
}
