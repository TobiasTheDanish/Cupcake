package dat.backend.model.entities;

import java.util.ArrayList;
import java.util.List;

public class Order {
    private int id;
    private User customer;
    private List<OrderItem> orderItems;

    public Order(User customer) {
        this.customer = customer;
        id = 0;
        orderItems = new ArrayList<>();
    }

    public Order(User customer, List<OrderItem> orderItems) {
        this.customer = customer;
        this.orderItems = orderItems;
    }

    public Order(int id, User customer, List<OrderItem> orderItems) {
        this.id = id;
        this.customer = customer;
        this.orderItems = orderItems;
    }

    public int getId() {
        return id;
    }

    public User getCustomer() {
        return customer;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void addItem(OrderItem item){
        orderItems.add(item);
    }
}
