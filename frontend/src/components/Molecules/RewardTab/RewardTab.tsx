import React, { Component } from 'react';
import './RewardTab.css';

interface Competency {
  id: number;
  skill: string;
  level: number;
}

interface RewardTabProps {
  competencies?: string[];
}

interface RewardTabState {
  experience: number;
  shards: number;
  competencies: Competency[];
}

export class RewardTab extends Component<RewardTabProps, RewardTabState> {
  private nextId = 0;

  constructor(props: RewardTabProps) {
    super(props);
    this.state = {
      experience: 0,
      shards: 0,
      competencies: []
    };
  }

  handleExperienceChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ experience: parseInt(event.target.value) || 0 });
  };

  handleShardsChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    this.setState({ shards: parseInt(event.target.value) || 0 });
  };

  handleCompetencyChange = (id: number, field: string, value: string | number) => {
    this.setState(prev => ({
      competencies: prev.competencies.map(comp =>
        comp.id === id ? { ...comp, [field]: value } : comp
      )
    }));
  };

  handleAddCompetency = () => {
    this.setState(prev => ({
      competencies: [
        ...prev.competencies,
        { id: this.nextId++, skill: '', level: 1 }
      ]
    }));
  };

  handleRemoveCompetency = (id: number) => {
    this.setState(prev => ({
      competencies: prev.competencies.filter(comp => comp.id !== id)
    }));
  };

  render() {
    const { competencies: availableCompetencies = [] } = this.props;
    const { experience, shards, competencies } = this.state;

    return (
      <div className='rewardTab'>
        <div className='rewardTab-main'>
          <div className='rewardTab-field'>
            <h4 className='rewardTab-label'>Опыт</h4>
            <input
              className='rewardTab-input'
              type="number"
              value={experience}
              onChange={this.handleExperienceChange}
              min="0"
            />
          </div>

          <div className='rewardTab-field'>
            <h4 className='rewardTab-label'>Осколки</h4>
            <input
              className='rewardTab-input'
              type="number"
              value={shards}
              onChange={this.handleShardsChange}
              min="0"
            />
          </div>
        </div>

        <div className='rewardTab-competencies'>
          <h3 className='rewardTab-title'>Уровень компетенций</h3>
          
          <div className='competencies-scrollable'>
            {competencies.map(comp => (
              <div key={comp.id} className='competency-row'>
                <select
                  className='competency-select'
                  value={comp.skill}
                  onChange={(e) => this.handleCompetencyChange(comp.id, 'skill', e.target.value)}
                >
                  <option value="">Выберите навык</option>
                  {availableCompetencies.map((skill, index) => (
                    <option key={index} value={skill}>{skill}</option>
                  ))}
                </select>
                
                <input
                  className='competency-level'
                  type="number"
                  value={comp.level}
                  onChange={(e) => this.handleCompetencyChange(comp.id, 'level', parseInt(e.target.value) || 1)}
                  min="1"
                  max="10"
                />
                
                <button 
                  className='competency-remove'
                  onClick={() => this.handleRemoveCompetency(comp.id)}
                >
                  <img src="/assets/crossDown.svg" alt="Удалить" />
                </button>
              </div>
            ))}
          </div>

          <button 
            className='add-competency-btn'
            onClick={this.handleAddCompetency}
          >
            Добавить компетенцию
          </button>
        </div>
      </div>
    );
  }
}

export default RewardTab;