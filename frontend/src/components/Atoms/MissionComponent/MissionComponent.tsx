import React, { useState, useEffect } from 'react';
import './MissionComponent.css';

interface MissionComponentProps {
  index: number;
  missionName: string;
}

const MissionComponent: React.FC<MissionComponentProps> = ({ index, missionName }) => {
  const [showMenu, setShowMenu] = useState(false);

  useEffect(() => {
    if (showMenu) {
      const timer = setTimeout(() => {
        setShowMenu(false);
      }, 1500);

      return () => clearTimeout(timer);
    }
  }, [showMenu]);

  return (
    <div className='MissionComponent-block'>
      <div className='MissionComponent-textBlock'>
        <h4 className='MissionComponent-textBlock_index'>{index}</h4>
        <h4>{missionName}</h4>
      </div>
      
      <div className='MissionComponent-menuWrapper'>
        <button className='MissionComponent-dotsButton' onClick={() => setShowMenu(!showMenu)}>
          <img src="/assets/3dots.svg" alt="Меню" />
        </button>
        
        {showMenu && (
          <div className='MissionComponent-popupMenu'>
            <button className='MissionComponent-menuItem'>Редактировать</button>
            <button className='MissionComponent-menuItem'>Дублировать</button>
            <button className='MissionComponent-menuItem MissionComponent-menuItem--delete'>
              Удалить
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default MissionComponent;