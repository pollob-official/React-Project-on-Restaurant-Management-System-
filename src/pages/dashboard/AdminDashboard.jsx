import React, { useEffect, useState } from 'react';
import api from '../../api/axios';

const AdminDashboard = () => {
    const [stats, setStats] = useState({
        total_orders: 0,
        total_customers: 0,
        total_menu_items: 0,
        total_revenue: 0
    });
    const [recentOrders, setRecentOrders] = useState([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchData = async () => {
            try {
                // Use /dashboard/index which maps to DashboardApi class in backend via api.php logic
                const response = await api.get('/dashboard/index');
                if (response.data.success) {
                    setStats(response.data.stats);
                    setRecentOrders(response.data.recent_orders);
                } else {
                    console.error("API Error:", response.data.message);
                }
            } catch (error) {
                console.error("Error fetching dashboard data:", error);
            } finally {
                setLoading(false);
            }
        };

        fetchData();
    }, []);

    if (loading) return <div className="p-4">Loading dashboard data...</div>;

    return (
        <div className="container-fluid">
            <div className="row">
                <div className="col-xl-3 col-lg-6 col-sm-6">
                    <div className="widget-stat card">
                        <div className="card-body p-4">
                            <div className="media ai-icon">
                                <span className="me-3 bgl-primary text-primary">
                                    <i className="fa-solid fa-cart-shopping"></i>
                                </span>
                                <div className="media-body">
                                    <p className="mb-1">Total Orders</p>
                                    <h4 className="mb-0">{stats.total_orders}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-xl-3 col-lg-6 col-sm-6">
                    <div className="widget-stat card">
                        <div className="card-body p-4">
                            <div className="media ai-icon">
                                <span className="me-3 bgl-warning text-warning">
                                    <i className="fa-solid fa-users"></i>
                                </span>
                                <div className="media-body">
                                    <p className="mb-1">Total Customers</p>
                                    <h4 className="mb-0">{stats.total_customers}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-xl-3 col-lg-6 col-sm-6">
                    <div className="widget-stat card">
                        <div className="card-body p-4">
                            <div className="media ai-icon">
                                <span className="me-3 bgl-danger text-danger">
                                    <i className="fa-solid fa-utensils"></i>
                                </span>
                                <div className="media-body">
                                    <p className="mb-1">Menu Items</p>
                                    <h4 className="mb-0">{stats.total_menu_items}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div className="col-xl-3 col-lg-6 col-sm-6">
                    <div className="widget-stat card">
                        <div className="card-body p-4">
                            <div className="media ai-icon">
                                <span className="me-3 bgl-success text-success">
                                    <i className="fa-solid fa-sack-dollar"></i>
                                </span>
                                <div className="media-body">
                                    <p className="mb-1">Total Revenue</p>
                                    <h4 className="mb-0">${stats.total_revenue}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div className="row">
                <div className="col-12">
                    <div className="card">
                        <div className="card-header">
                            <h4 className="card-title">Recent Orders</h4>
                        </div>
                        <div className="card-body">
                            <div className="table-responsive">
                                <table className="table table-responsive-md">
                                    <thead>
                                        <tr>
                                            <th><strong>Order ID</strong></th>
                                            <th><strong>Customer</strong></th>
                                            <th><strong>Date</strong></th>
                                            <th><strong>Amount</strong></th>
                                            <th><strong>Status</strong></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        {recentOrders.length > 0 ? (
                                            recentOrders.map((order) => (
                                                <tr key={order.id}>
                                                    <td><strong>#{order.id}</strong></td>
                                                    <td>{order.customer_name}</td>
                                                    <td>{new Date(order.created_at).toLocaleDateString()}</td>
                                                    <td>${order.total_amount}</td>
                                                    <td>
                                                        <span className={`badge light badge-${
                                                            (order.status || '').toLowerCase() === 'delivered' ? 'success' :
                                                            (order.status || '').toLowerCase() === 'pending' ? 'warning' : 
                                                            (order.status || '').toLowerCase() === 'cancelled' ? 'danger' : 'primary'
                                                        }`}>
                                                            {order.status}
                                                        </span>
                                                    </td>
                                                </tr>
                                            ))
                                        ) : (
                                            <tr>
                                                <td colSpan="5" className="text-center">No recent orders found.</td>
                                            </tr>
                                        )}
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default AdminDashboard;
