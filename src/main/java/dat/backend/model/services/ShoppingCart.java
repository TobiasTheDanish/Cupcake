package dat.backend.model.services;

import dat.backend.model.entities.Order;
import dat.backend.model.entities.OrderItem;
import dat.backend.model.entities.User;

import java.util.List;

public class ShoppingCart {
    private static Order currentOrder;

    public static void initCurrentOrder(User user) {
        currentOrder = new Order(user);
    }

    public static void addItem(OrderItem item) {
        currentOrder.addItem(item);
    }

    public static Order getOrder() {
        return currentOrder;
    }

    public static void clear() {
        currentOrder.getOrderItems().clear();
    }
}
