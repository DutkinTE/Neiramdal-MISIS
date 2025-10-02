import React, { Component } from 'react';
import EditorHeader from '../../Molecules/EditorHeader/EditorHeader';
import EditorActions from '../../Molecules/EditorActions/EditorActions';
import EmptyState from '../../Atoms/EmptyState/EmptyState';
import Editor from '../../Molecules/Editor/Editor';
import RequirementsTab from '../../Molecules/RequirementsTab/RequirementsTab';
import RewardTab from "../../Molecules/RewardTab/RewardTab";
import MissionsTab from '../../Organisms/MissionsTab/MissionsTab.tsx';
import './EditorPage.css';

interface EditorPageState {
  activeTab: string;
  hasSelectedMission: boolean;
}

class EditorPage extends Component<EditorPageProps, EditorPageState> { 
  constructor(props: EditorPageProps) { 
    super(props);
    this.state = {
      activeTab: 'info',
      hasSelectedMission: true 
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
          stages={["Этап 1", "Этап 2", "Этап 3"]}
          branches={["Ветка 1", "Ветка 2", "Ветка 3", "Ветка 3"]}
          types={["Лекторий", "Командная", "Соревновательная", "Обучающая"]}
        />;
      case 'requirements':
        return <RequirementsTab 
          missions={[
            "Добро пожаловать на борт",
            "Звездная миссия",
            "Космическая миссия", 
            "Командное путешествие"
          ]}
          ranks={[
            "Звездный искатель",
            "Астронавт-новичок",
            "Космический пилот", 
            "Галактический навигатор",
            "Звездный маршал",
            "Защитник орбиты"
          ]}
        />;
      case 'reward':
        return <RewardTab 
          competencies={[
            "Вера в дело",
            "Стремление к большему", 
            "Общение",
            "Аналитика",
            "Командование",
            "Юриспруденция",
            "Трехмерное мышление",
            "Базовая экономика",
            "Основы аэронавигации"
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

            <div className='editorPage-leftBlock'>
                <MissionsTab/>
            </div>
            <div className='editorPage-rightBlock'>

                <div>
                    <EditorHeader 
                    activeTab={activeTab} 
                    onTabChange={this.handleTabChange} 
                    />
                    
                    <div className='editorPage-content'>
                    {this.renderContent()}
                    </div>
                </div>
                
                
                <EditorActions
                onDuplicate={this.handleDuplicate}
                onDelete={this.handleDelete}
                onSave={this.handleSave}
                hasSelectedMission={hasSelectedMission}
                />
            </div>
        </div>
      
    );
  }
}

export default EditorPage;