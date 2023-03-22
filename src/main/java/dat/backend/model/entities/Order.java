package dat.backend.model.entities;

import java.util.List;

public class Order {
    private int id;
    private User customer;
    private List<Product> products;

    public Order(User customer) {
        this.customer = customer;
    }

    public Order(User customer, List<Product> products) {
        this.customer = customer;
        this.products = products;
    }

    public Order(int id, User customer, List<Product> products) {
        this.id = id;
        this.customer = customer;
        this.products = products;
    }

    public int getId() {
        return id;
    }

    public User getCustomer() {
        return customer;
    }

    public List<Product> getProducts() {
        return products;
    }
}
