import './App.css'
import SideMenu from "../src/components/Organisms/SideMenu/SideMenu";
import { Routes, Route } from 'react-router-dom';
import MainPage from "./components/Pages/MainPage/MainPage.tsx"

// import logo from './assets/logo.svg';
// <img src={logo} alt="logo" />

function App() {

  return (
    <>
      <SideMenu/>
      <Routes>
        <Route path="/mainPage" element={<MainPage />} />
      </Routes>
    </>
  )
}

export default App


