import './App.css'
import SideMenu from "../src/components/Organisms/SideMenu/SideMenu";
import { Routes, Route, useLocation } from 'react-router-dom';
import MainPage from "./components/Pages/MainPage/MainPage"
import LogInPage from "./components/Pages/LogInPage/LogInPage"

function App() {
  const location = useLocation();
  const isLoginPage = location.pathname === '/logIn';

  return (
    <>
      {!isLoginPage && <SideMenu/>} 
      <Routes>
        <Route path="/mainPage" element={<MainPage />} />
        <Route path="/logIn" element={<LogInPage />} />
        <Route path="/" element={<MainPage />} />
      </Routes>
    </>
  )
}

export default App