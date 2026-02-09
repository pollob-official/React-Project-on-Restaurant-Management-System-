import React, { useState } from "react";
import axios from "axios";
import { Link, Navigate, useNavigate } from "react-router-dom";

const Login = () => {
  const [isLogin, setIsLogin] = useState(true);
  const baseUrl = import.meta.env.VITE_API_BASE_URL;
    const navigate = useNavigate();
  const [loginData, setLoginData] = useState({
    username: "",
    password: "",
  });

  const [registerData, setRegisterData] = useState({
    username: "",
    email: "",
    phone: "",
    password: "",
  });

  const [error, setError] = useState("");

  const quickLogin = (username, password) => {
    setLoginData({ username, password });
    setIsLogin(true);
  };

  // -------------------------
  // LOGIN SUBMIT
  // -------------------------
  const handleLogin = async (e) => {
    e.preventDefault();
    console.log(loginData);
    
    try {
      const res = await axios.post(
        (`${baseUrl}/auth/login`), loginData
      );
      console.log(res.data);
      
      if (res.data.success) {
        localStorage.setItem("token", res.data.token);
        // navigate("/");
        window.location.href = "/";
     
      } else {
        setError("Invalid username or password");
      }
    } catch (err) {
      console.error(err);
      setError(err.response?.data?.message || err.message || "Server error");
    }
  };

  // -------------------------
  // REGISTER SUBMIT
  // -------------------------
  const handleRegister = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post(
        (`${baseUrl}/auth/register`),
        registerData
      );

      if (res.data.success) {
        setIsLogin(true);
        setError("Registration successful! Please login.");
      } else {
        setError(res.data.message || "Registration failed");
      }
    } catch (err) {
      console.error(err);
      setError(err.response?.data?.message || err.message || "Server error");
    }
  };

  return (
    <div className="container-fluid p-4">
      <div className="row justify-content-center">

        <div className="col-xl-10">
          <div className="row login-bx">

            {/* LEFT IMAGE */}
            <div className="col-xl-7 col-lg-6 col-md-6 sign text-center">
              <img
                src="../react/assets/images/login-img/pic-5.jpg"
                className="img-fluid"
                style={{ borderRadius: "15px", width: "100%" }}
              />
            </div>

            {/* RIGHT FORM */}
            <div className="col-xl-5 col-lg-6 col-md-6 d-flex align-items-center">
              <div className="sign-in-your w-100 px-4">

                {/* LOGO + TITLE */}
                <div className="text-center mb-3">
                  <img src="../react/assets/images/logo-full.png" className="mb-3" alt="" />
                  <h4 className="fs-20 font-w800 text-black">
                    {isLogin ? "Sign in to your account" : "Create an Account"}
                  </h4>

                  {error && (
                    <span className="text-danger d-block mb-2">{error}</span>
                  )}
                </div>

                {/* ================= LOGIN FORM ================ */}
                {isLogin && (
                  <form onSubmit={handleLogin}>
                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Username or Email</strong>
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        placeholder="Username or Email"
                        value={loginData.username}
                        onChange={(e) =>
                          setLoginData({
                            ...loginData,
                            username: e.target.value,
                          })
                        }
                      />
                    </div>

                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Password</strong>
                      </label>
                      <input
                        type="password"
                        className="form-control"
                        placeholder="********"
                        value={loginData.password}
                        onChange={(e) =>
                          setLoginData({
                            ...loginData,
                            password: e.target.value,
                          })
                        }
                      />
                    </div>

                    <div className="row d-flex justify-content-between mt-3 mb-3">
                      <div className="form-check ms-2">
                        <input type="checkbox" className="form-check-input" id="basic_checkbox_1" />
                        <label className="form-check-label" htmlFor="basic_checkbox_1">
                          Remember my preference
                        </label>
                      </div>
                      <a href="#" className="text-primary">
                        Forgot Password?
                      </a>
                    </div>

                    <button type="submit" className="btn btn-primary btn-block shadow w-100">
                      Sign Me In
                    </button>
                  </form>
                )}

                {/* ================= REGISTER FORM ================ */}
                {!isLogin && (
                  <form onSubmit={handleRegister}>
                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Username</strong>
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        placeholder="username"
                        value={registerData.username}
                        onChange={(e) =>
                          setRegisterData({
                            ...registerData,
                            username: e.target.value,
                          })
                        }
                      />
                    </div>

                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Email</strong>
                      </label>
                      <input
                        type="email"
                        className="form-control"
                        placeholder="hello@example.com"
                        value={registerData.email}
                        onChange={(e) =>
                          setRegisterData({
                            ...registerData,
                            email: e.target.value,
                          })
                        }
                      />
                    </div>

                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Phone</strong>
                      </label>
                      <input
                        type="text"
                        className="form-control"
                        placeholder="01700000000"
                        value={registerData.phone}
                        onChange={(e) =>
                          setRegisterData({
                            ...registerData,
                            phone: e.target.value,
                          })
                        }
                      />
                    </div>

                    <div className="mb-3">
                      <label className="mb-1">
                        <strong>Password</strong>
                      </label>
                      <input
                        type="password"
                        className="form-control"
                        placeholder="********"
                        value={registerData.password}
                        onChange={(e) =>
                          setRegisterData({
                            ...registerData,
                            password: e.target.value,
                          })
                        }
                      />
                    </div>

                    <button type="submit" className="btn btn-primary btn-block shadow w-100">
                      Sign Me Up
                    </button>
                  </form>
                )}

                {/* SOCIAL LOGIN */}
                <div className="text-center my-4">
                  <span className="dlab-sign-up style-1">Continue With</span>
                </div>

                <div className="d-flex justify-content-between mb-4">
                  <button className="btn btn-outline-light w-100 me-2">
                    <i className="fab fa-facebook me-2"></i> Facebook
                  </button>
                  <button className="btn btn-outline-light w-100 me-2">
                    <i className="fab fa-google me-2"></i> Google
                  </button>
                  <button className="btn btn-outline-light w-100">
                    <i className="fab fa-linkedin me-2"></i> LinkedIn
                  </button>
                </div>

                {/* TOGGLE */}
                <div className="text-center">
                  {isLogin ? (
                    <span>
                      Don’t have an account?
                      <span
                        className="text-primary"
                        style={{ cursor: "pointer" }}
                        onClick={() => setIsLogin(false)}
                      >
                        {" "}
                        Register
                      </span>
                    </span>
                  ) : (
                    <span>
                      Already have an account?
                      <span
                        className="text-primary"
                        style={{ cursor: "pointer" }}
                        onClick={() => setIsLogin(true)}
                      >
                        {" "}
                        Sign In
                      </span>
                    </span>
                  )}
                </div>

                {/* Quick Login Buttons */}
                <div className="mt-4">
                  <h6 className="text-center text-muted mb-3">Quick Login (Demo)</h6>
                  <select 
                     className="form-control default-select form-control-sm" 
                     onChange={(e) => {
                       const role = e.target.value;
                       if(role === 'admin') quickLogin("admin@foodapp.com", "12345");
                       else if(role === 'restaurant') quickLogin("restaurant@foodapp.com", "12345");
                       else if(role === 'rider') quickLogin("rider@foodapp.com", "12345");
                       else if(role === 'customer') quickLogin("customer@foodapp.com", "12345");
                     }}
                     defaultValue=""
                   >
                    <option value="" disabled>Select Demo Account</option>
                    <option value="admin">Admin</option>
                    <option value="restaurant">Restaurant</option>
                    <option value="rider">Rider</option>
                    <option value="customer">Customer</option>
                  </select>
                </div>

              </div>
            </div>

          </div>
        </div>

      </div>
    </div>
  );
};

export default Login;
