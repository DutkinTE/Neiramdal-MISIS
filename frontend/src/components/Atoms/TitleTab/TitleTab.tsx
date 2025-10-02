import React, { useState } from 'react';
import './TitleTab.css';

interface TabItem {
  id: string;
  name: string;
  iconThin: string;
  iconHeavy: string;
}

const TitleTab: React.FC = () => {
  const [activeTab, setActiveTab] = useState('missions');
  const [hoverTab, setHoverTab] = useState<string | null>(null);

  const tabs: TabItem[] = [
    {
      id: 'missions',
      name: 'Миссии',
      iconThin: '/assets/missionOrderThin.svg',
      iconHeavy: '/assets/missionOrderHeavy.svg'
    },
    {
      id: 'ranks', 
      name: 'Ранги',
      iconThin: '/assets/billThin.svg',
      iconHeavy: '/assets/billHeavy.svg'
    },
    {
      id: 'artifacts',
      name: 'Артефакты', 
      iconThin: '/assets/dimondThin.svg',
      iconHeavy: '/assets/dimondHeavy.svg'
    },
    {
      id: 'shop',
      name: 'Магазин',
      iconThin: '/assets/shopBagThin.svg',
      iconHeavy: '/assets/shopBagHeavy.svg'
    }
  ];

  const getIconSrc = (tab: TabItem) => {
    if (activeTab === tab.id) return tab.iconHeavy;
    if (hoverTab === tab.id) return tab.iconHeavy;
    return tab.iconThin;
  };

  return (
    <div className='TitleTab-block'>
      <h2>Вкладки</h2>
      <div className='TitleTab-block_menu'>
        <div className='TitleTab-block_tabs'>
          {tabs.map((tab) => (
            <div
              key={tab.id}
              className={`TitleTab-block_tab ${
                activeTab === tab.id ? 'TitleTab-block_tab--active' : ''
              }`}
              onClick={() => setActiveTab(tab.id)}
              onMouseEnter={() => setHoverTab(tab.id)}
              onMouseLeave={() => setHoverTab(null)}
            >
              <img src={getIconSrc(tab)} alt="icon" />
              <h4>{tab.name}</h4>
              <div className='TitleTab-block_tabLine'></div>
            </div>
          ))}
        </div>
        
        <div className='TitleTab-block_underLine'></div>
      </div>
    </div>
  );
}

export default TitleTab;