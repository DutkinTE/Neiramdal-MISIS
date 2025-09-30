import React, { Component } from 'react';
import EditorHeader from '../../Molecules/EditorHeader/EditorHeader';
import EditorActions from '../../Molecules/EditorActions/EditorActions';
import EmptyState from '../../Atoms/EmptyState/EmptyState';
import Editor from '../../Molecules/Editor/Editor';
import RequirementsTab from '../../Molecules/RequirementsTab/RequirementsTab';
import RewardTab from "../../Molecules/RewardTab/RewardTab";
import './EditorPage.css';

interface EditorPageState {
  activeTab: string;
  hasSelectedMission: boolean;
}

class EditorPage extends Component<{}, EditorPageState> {
  constructor(props: {}) {
    super(props);
    this.state = {
      activeTab: 'info',
      hasSelectedMission: true // временно true для демонстрации
    };
  }

  handleTabChange = (tab: string) => {
    this.setState({ activeTab: tab });
  };

  handleDuplicate = () => {
    console.log('Дублировать миссию');
  };

  handleDelete = () => {
    console.log('Удалить миссию');
  };

  handleSave = () => {
    console.log('Сохранить миссию');
  };

  renderContent() {
    const { activeTab, hasSelectedMission } = this.state;

    if (!hasSelectedMission) {
      return <EmptyState />;
    }

    switch (activeTab) {
      case 'info':
        return <Editor 
          stages={["Этап 1", "Этап 2", "Этап 3", "Этап 4", "Этап 5"]}
          branches={["Техническая", "Гуманитарная", "Бизнес", "Творческая"]}
          types={["Индивидуальная", "Командная", "Соревновательная", "Обучающая"]}
        />;
      case 'requirements':
        return <RequirementsTab 
          missions={[
            "Знакомство с платформой",
            "Базовое тестирование", 
            "Продвинутые задачи",
            "Командный проект",
            "Финальный экзамен"
          ]}
          ranks={[
            "Новичок",
            "Искатель",
            "Исследователь", 
            "Мастер",
            "Эксперт"
          ]}
        />;
      case 'reward':
        return <RewardTab 
          competencies={[
            "JavaScript",
            "React", 
            "TypeScript",
            "CSS",
            "HTML",
            "Node.js",
            "Python",
            "UI/UX дизайн"
          ]}
        />;
      default:
        return <Editor />;
    }
  }

  render() {
    const { activeTab, hasSelectedMission } = this.state;

    return (
      <div className='editorPage'>
        <EditorHeader 
          activeTab={activeTab} 
          onTabChange={this.handleTabChange} 
        />
        
        <div className='editorPage-content'>
          {this.renderContent()}
        </div>
        
        <EditorActions
          onDuplicate={this.handleDuplicate}
          onDelete={this.handleDelete}
          onSave={this.handleSave}
          hasSelectedMission={hasSelectedMission}
        />
      </div>
    );
  }
}

export default EditorPage;