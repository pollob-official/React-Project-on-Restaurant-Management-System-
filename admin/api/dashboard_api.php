<?php
class DashboardApi {
    public function __construct() {}

    function index() {
        global $db, $tx;

        // Clear any previous output to ensure clean JSON
        if (ob_get_length()) ob_clean();

        // Ensure JSON response
        header('Content-Type: application/json');

        // Use raw SQL to avoid Model class issues and table naming conflicts
        // Table names are lowercase in the SQL dump

        // Total Orders
        $result = $db->query("select count(*) from orders");
        list($total_orders) = $result->fetch_row();

        // Total Customers
        $result = $db->query("select count(*) from customers");
        list($total_customers) = $result->fetch_row();

        // Total Menu Items
        $result = $db->query("select count(*) from menu_items");
        list($total_menu_items) = $result->fetch_row();

        // Total Revenue (calculated from orders table for immediate updates)
        // We sum up the total_amount of all orders
        $result = $db->query("select sum(total_amount) from orders");
        list($total_revenue) = $result->fetch_row();
        $total_revenue = $total_revenue ? $total_revenue : 0;

        // Recent Orders (Last 5)
        // Join with customers for name, trackings for status
        // Table `orders` has `customer_id`, `tracking_id`
        // Table `customers` has `name`
        // Table `trackings` has `name`
        $sql = "SELECT o.id, o.total_amount, o.payment_status, o.created_at, 
                       c.name as customer_name, 
                       t.name as status
                FROM orders o 
                LEFT JOIN customers c ON o.customer_id = c.id 
                LEFT JOIN trackings t ON o.tracking_id = t.id 
                ORDER BY o.id DESC LIMIT 5";
        
        $result = $db->query($sql);
        $recent_orders = [];
        if ($result) {
            while ($row = $result->fetch_object()) {
                $recent_orders[] = $row;
            }
        }

        echo json_encode([
            "success" => true,
            "stats" => [
                "total_orders" => $total_orders,
                "total_customers" => $total_customers,
                "total_menu_items" => $total_menu_items,
                "total_revenue" => $total_revenue
            ],
            "recent_orders" => $recent_orders
        ]);
    }
}