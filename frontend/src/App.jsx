import React from 'react';
import { Route,Routes,BrowserRouter } from 'react-router-dom';
import Home from './Components/Home';
import Login from './Components/Login';
import DashBoard from './Components/DashBoard';
import Products from './Components/Products';

const App = () => {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="/login" element={<Login/>} />
        <Route path="/dashboard" element={<DashBoard/>} />
        <Route path='/products' element={<Products/>}/>
      </Routes>
    </BrowserRouter>
  );
}

export default App;