import React, { PureComponent } from 'react'
import { Link } from 'react-router-dom';
import "./Editor.css";

interface EditorProps {
  stages?: string[];
  branches?: string[];
  types?: string[];
  missions?: any[]; 
}

interface EditorState {
  selectedStage: string;
  selectedBranch: string;
  selectedMission: string;
}

export class Editor extends PureComponent<EditorProps, EditorState> {
  constructor(props: EditorProps) {
    super(props);
    this.state = {
      selectedStage: '',
      selectedBranch: '',
      selectedMission: ''
    };
  }

  handleStageChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ 
      selectedStage: event.target.value,
      selectedBranch: '' 
    });
  };

  handleBranchChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ selectedBranch: event.target.value });
  };

  handleMissionSelect = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ selectedMission: event.target.value });
    // Здесь можно добавить логику загрузки данных выбранной миссии
  };

  handleDuplicate = () => {
    // Логика создания дубликата миссии
    console.log('Дублируем миссию:', this.state.selectedMission);
  };

  handleDelete = () => {
    // Логика удаления миссии из бека
    console.log('Удаляем миссию:', this.state.selectedMission);
  };

  handleSave = () => {
    // Логика сохранения миссии
    console.log('Сохраняем миссию');
  };

  render() {
    const { stages = [], branches = [], types = [], missions = [] } = this.props;
    const { selectedStage, selectedBranch, selectedMission } = this.state;

    return (
      <div className='editorPage'>
        <h2>Редактор миссий</h2>

        <div className='editorPage-links'>
          <Link to="/editor/info">
            <img src="/assets/order.svg" alt="icon" />
            <h4>Основная информация</h4>
          </Link>
          <Link to="/editor/requirements">Требования</Link>
          <Link to="/editor/reward">Награда</Link>
        </div>

        <div className='editorPage-block'>
          <div className='editorPage-block__descriptions'>
            <div className='editorPage-block__description'>
              <h4>Название миссии</h4>
              <input className='input_missionName' type="text" />
            </div>
            <div className='editorPage-block__description'>
              <h4>Описание миссии</h4>
              <textarea className='input_descrMission' />
            </div>
          </div>
          
          <div className='editorPage-block__options'>
            <div className='editorPage-option'>
              <h4>Этап</h4>
              <select 
                value={selectedStage} 
                onChange={this.handleStageChange}
              >
                <option value="">Выберите этап</option>
                {stages.map((stage, index) => (
                  <option key={index} value={stage}>{stage}</option>
                ))}
              </select>
            </div>
            
            <div className='editorPage-option'>
              <h4>Ветка</h4>
              <select 
                value={selectedBranch} 
                onChange={this.handleBranchChange}
                disabled={!selectedStage}
              >
                <option value="">Выберите ветку</option>
                {branches.map((branch, index) => (
                  <option key={index} value={branch}>{branch}</option>
                ))}
              </select>
            </div>
            
            <div className='editorPage-option'>
              <h4>Тип</h4>
              <select disabled={!selectedBranch}>
                <option value="">Выберите тип</option>
                {types.map((type, index) => (
                  <option key={index} value={type}>{type}</option>
                ))}
              </select>
            </div>
          </div>
        </div>

        <div className='editorPage-actions'>
          <div className='editorPage-missionControls'>
            
            
            <div className='editorPage-buttons'>
              <button onClick={this.handleDuplicate} disabled={!selectedMission}>
                Сделать дубликат
              </button>
              <button onClick={this.handleDelete} disabled={!selectedMission}>
                Удалить
              </button>
            </div>
          </div>
          
          <button onClick={this.handleSave} className='save-button'>
            Сохранить
          </button>
        </div>
      </div>
    )
  }
}

export default Editor