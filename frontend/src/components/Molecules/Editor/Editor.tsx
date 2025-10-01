import React, { Component } from 'react';
import './Editor.css';

interface EditorProps {
  stages?: string[];
  branches?: string[];
  types?: string[];
}

interface EditorState {
  selectedStage: string;
  selectedBranch: string;
  missionName: string;
  missionDescription: string;
}

export class Editor extends Component<EditorProps, EditorState> {
  constructor(props: EditorProps) {
    super(props);
    this.state = {
      selectedStage: '',
      selectedBranch: '',
      missionName: '',
      missionDescription: ''
    };
  }

  handleStageChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ 
      selectedStage: event.target.value,
      selectedBranch: '' // сбрасываем ветку при смене этапа
    });
  };

  handleBranchChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ selectedBranch: event.target.value });
  };

  handleMissionNameChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ missionName: event.target.value });
  };

  handleDescriptionChange = (event: React.ChangeEvent<HTMLTextAreaElement>) => {
    this.setState({ missionDescription: event.target.value });
  };

  render() {
    const { stages = [], branches = [], types = [] } = this.props;
    const { selectedStage, selectedBranch, missionName, missionDescription } = this.state;

    return (
      <div className='editor'>
        <div className='editor-content'>
          <div className='editor-descriptions'>
            <div className='editor-field'>
              <h4 className='editor-label'>Название миссии</h4>
              <input 
                className='editor-input editor-input--text'
                type="text"
                value={missionName}
                onChange={this.handleMissionNameChange}
                placeholder="Текст"
              />
            </div>
            
            <div className='editor-field'>
              <h4 className='editor-label'>Описание миссии</h4>
              <textarea 
                className='editor-input editor-input--textarea'
                value={missionDescription}
                onChange={this.handleDescriptionChange}
                placeholder="Текст"
                rows={5}
              />
            </div>
          </div>
          
          <div className='editor-options'>
            <div className='editor-option'>
              <h4 className='editor-label'>Этап</h4>
              <select 
                className='editor-select'
                value={selectedStage} 
                onChange={this.handleStageChange}
              >
                <option value="">Выберите этап</option>
                {stages.map((stage, index) => (
                  <option key={index} value={stage}>{stage}</option>
                ))}
              </select>
            </div>
            
            <div className='editor-option'>
              <h4 className='editor-label'>Ветка</h4>
              <select 
                className='editor-select'
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
            
            <div className='editor-option'>
              <h4 className='editor-label'>Тип</h4>
              <select 
                className='editor-select'
                disabled={!selectedBranch}
              >
                <option value="">Выберите тип</option>
                {types.map((type, index) => (
                  <option key={index} value={type}>{type}</option>
                ))}
              </select>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default Editor;