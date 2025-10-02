import './App.css'
import SideMenu from "./components/Organisms/SideMenu/SideMenu";
import { Routes, Route, useLocation } from 'react-router-dom';
import LogInPage from "./components/Pages/LogInPage/LogInPage"
import Dashboard from "./components/Pages/Dashboard/Dashboard"
import EditorPage from "./components/Pages/EditorPage/EditorPage"
import SettingPage from './components/Pages/SettingPage/SettingPage'
import HelpPage from './components/Pages/HelpPage/HelpPage';

function App() {
  const location = useLocation();
  const isLoginPage = location.pathname === '/logIn';

  return (
    <div className={`App ${isLoginPage ? 'App--login' : ''}`}>
      {!isLoginPage && <SideMenu/>}
      
      <div className='App_content'>
        <Routes>
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/logIn" element={<LogInPage />} />
          <Route path="/" element={<Dashboard />} />
          <Route path="/editor" element={<EditorPage />} />
          <Route path='/settings' element={<SettingPage/>}/>
          <Route path='/help' element={<HelpPage/>}/>
        </Routes>
      </div>
    </div>
  )
}

export default App