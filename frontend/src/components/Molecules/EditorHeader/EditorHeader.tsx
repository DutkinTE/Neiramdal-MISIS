import React from 'react';
import './EditorHeader.css';

interface EditorHeaderProps {
  activeTab: string;
  onTabChange: (tab: string) => void;
}

export const EditorHeader: React.FC<EditorHeaderProps> = ({
  activeTab,
  onTabChange
}) => {
  const tabs = [
    { id: 'info', label: 'Основная информация', icon: '/assets/order.svg' },
    { id: 'requirements', label: 'Требования' },
    { id: 'reward', label: 'Награда' }
  ];

  return (
    <div className='editorHeader'>
      <h1 className='editorHeader-title'>Редактор миссий</h1>
      
      <nav className='editorHeader-nav'>
        {tabs.map(tab => (
          <button
            key={tab.id}
            className={`editorHeader-tab ${activeTab === tab.id ? 'editorHeader-tab--active' : ''}`}
            onClick={() => onTabChange(tab.id)}
          >
            {tab.icon && <img src={tab.icon} alt="" className='editorHeader-icon' />}
            <span className='editorHeader-label'>{tab.label}</span>
          </button>
        ))}
      </nav>
    </div>
  );
};

export default EditorHeader;