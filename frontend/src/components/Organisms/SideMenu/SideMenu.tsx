import { useState } from 'react';
import "./SideMenu.css";
import MenuChoose from '../../Atoms/MenuChoose/MenuChoose.tsx';
import SureLogeOut from '../../Molecules/SureLogeOut/SureLogeOut.tsx';

const SideMenu = () => {

    const [showLogoutModal, setShowLogoutModal] = useState(false);

    const handleLogoutClick = (e: React.MouseEvent) => {
      e.preventDefault(); 
      setShowLogoutModal(true);
    };
  
    const closeModal = () => {
      setShowLogoutModal(false);
    };

  return (
    <div className='SideMenu'>
        <div className='SideMenu_upper'>
            <img alt='logo' className='logoAlabuga' src='/assets/logo.svg'></img>

            <div className='SideMenu_monitoring SideMenu_bloc-nav'>
            <h4>Мониторинг</h4>
            <div className='SideMenu-nav'>
                <MenuChoose 
                srcIcon="/assets/dashboardThin.svg"
                activeIcon="/assets/dashboardHeavy.svg" 
                alt="Icon"
                title="Дашборд"
                to="/dashboard" 
                />
                <MenuChoose 
                srcIcon="/assets/documentThin.svg"
                activeIcon="/assets/documentHeavy.svg" 
                alt="Icon"
                title="Заявки"
                to="/applications" 
                badgeText="14" /// сюда бэк передайте с кол-вом заявок Андрей Тимур
                />
            </div>
            </div>

            <div className='SideMenu_control SideMenu_bloc-nav'>
                <h4 className='SideMenu-h4Titles'>Управление</h4>
                <div className='SideMenu-nav'>
                    <MenuChoose 
                        srcIcon="/assets/controlsThin.svg"
                        activeIcon="/assets/controlsHeavy.svg" 
                        alt="Icon"
                        title="Редактор"
                        to="/editor" 
                    />
                    <MenuChoose 
                        srcIcon="/assets/UsersThin.svg"
                        activeIcon="/assets/UsersHeavy.svg" 
                        alt="Icon"
                        title="Пользователи"
                        to="/users" 
                    />
                </div>
            </div>

            <div className='SideMenu_line'></div>

            <div className='SideMenu_account SideMenu_bloc-nav'>
                <h4>Аккаунт</h4>
                <div className='SideMenu-nav'>
                <MenuChoose 
                    srcIcon="/assets/settingsThin.svg"
                    activeIcon="/assets/settingsHeavy.svg" 
                    alt="Icon"
                    title="Настройки"
                    to="/settings" 
                />
                <div className='darkTheme'>
                <MenuChoose 
                    srcIcon="/assets/moonThin.svg"
                    activeIcon="/assets/moonThin.svg" 
                    alt="Icon"
                    title="Темная тема"
                    to="/darkTheme"  
                />
                </div>
                
                <div onClick={handleLogoutClick}>
                    <MenuChoose 
                        srcIcon="/assets/logOutThin.svg"
                        activeIcon="/assets/logOutHeavyRed.svg" 
                        alt="Icon"
                        title="Выйти"
                        to="#" 
                    />
                </div>
            </div>
                
            </div>
        </div>
        <div className='SideMenu_lower'>
            <MenuChoose 
                    srcIcon="/assets/questionThin.svg"
                    activeIcon="/assets/questionHeavy.svg" 
                    alt="Icon"
                    title="Помощь"
                    to="/help" 
                />
        </div>
        {showLogoutModal && <SureLogeOut onClose={closeModal} />}
    </div>
  );
}

export default SideMenu;