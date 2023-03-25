package dat.backend.model.persistence;

import dat.backend.model.entities.Bottom;
import dat.backend.model.entities.Order;
import dat.backend.model.entities.Topping;
import dat.backend.model.exceptions.DatabaseException;

import java.util.List;

public class OrderFacade {
    public static List<Order> getAllOrders(ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getAllOrders(connectionPool);
    }

    public static List<Order> getUserOrders(int user_id, ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getUserOrders(user_id, connectionPool);
    }

    public static Order createOrder(Order newOrder, ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.createOrder(newOrder, connectionPool);
    }

    public static Bottom getBottom(int bottomId, ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getBottom(bottomId, connectionPool);
    }

    public static Topping getTopping(int toppingId, ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getTopping(toppingId, connectionPool);
    }

    public static List<Bottom> getAllBottoms(ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getAllBottoms(connectionPool);
    }

    public static List<Topping> getAllToppings(ConnectionPool connectionPool) throws DatabaseException {
        return OrderMapper.getAllToppings(connectionPool);
    }
}
