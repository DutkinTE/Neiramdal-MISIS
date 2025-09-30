import './App.css'
import SideMenu from "./components/Organisms/SideMenu/SideMenu";
import { Routes, Route, useLocation } from 'react-router-dom';
import MainPage from "./components/Pages/MainPage/MainPage"
import LogInPage from "./components/Pages/LogInPage/LogInPage"
import Dashboard from "./components/Pages/Dashboard/Dashboard"

function App() {
  const location = useLocation();
  const isLoginPage = location.pathname === '/logIn';

  return (
    <div className={`App ${isLoginPage ? 'App--login' : ''}`}>
      {!isLoginPage && <SideMenu/>}
      
      <div className='App_content'>
        <Routes>
          <Route path="/mainPage" element={<MainPage />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/logIn" element={<LogInPage />} />
          <Route path="/" element={<MainPage />} />
        </Routes>
      </div>
    </div>
  )
}

export default App