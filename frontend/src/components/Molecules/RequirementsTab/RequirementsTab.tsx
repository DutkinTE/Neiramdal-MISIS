import React, { Component } from 'react';
import './RequirementsTab.css';

interface RequirementsTabProps {
  missions?: string[];
  ranks?: string[];
}

interface RequirementsTabState {
  selectedMissions: string[];
  selectedRank: string;
}

export class RequirementsTab extends Component<RequirementsTabProps, RequirementsTabState> {
  constructor(props: RequirementsTabProps) {
    super(props);
    this.state = {
      selectedMissions: ['', ''], 
      selectedRank: ''
    };
  }

  handleMissionChange = (index: number, value: string) => {
    this.setState(prev => {
      const newMissions = [...prev.selectedMissions];
      newMissions[index] = value;
      return { selectedMissions: newMissions };
    });
  };

  handleAddMission = () => {
    this.setState(prev => ({
      selectedMissions: [...prev.selectedMissions, '']
    }));
  };

  handleRemoveMission = (index: number) => {
    this.setState(prev => ({
      selectedMissions: prev.selectedMissions.filter((_, i) => i !== index)
    }));
  };

  handleRankChange = (event: React.ChangeEvent<HTMLSelectElement>) => {
    this.setState({ selectedRank: event.target.value });
  };

  render() {
    const { missions = [], ranks = [] } = this.props;
    const { selectedMissions, selectedRank } = this.state;

    return (
      <div className='requirementsTab'>
        <div className='requirementsTab-content'>
          <div className='requirementsTab-left'>
            <h3 className='requirementsTab-title'>Обязательные миссии</h3>
            
            <div className='missions-scrollable'>
              <div className='missions-list'>
                {selectedMissions.map((mission, index) => (
                  <div key={index} className='mission-select-wrapper'>
                    <select
                      className='mission-select'
                      value={mission}
                      onChange={(e) => this.handleMissionChange(index, e.target.value)}
                    >
                      <option value="">Выбрать</option>
                      {missions.map((missionOption, missionIndex) => (
                        <option key={missionIndex} value={missionOption}>
                          {missionOption}
                        </option>
                      ))}
                    </select>
                    <button 
                      className='mission-remove'
                      onClick={() => this.handleRemoveMission(index)}
                    >
                      <img src="/assets/cross.svg" alt="Удалить" />
                    </button>
                  </div>
                ))}
              </div>
            </div>

            <button 
              className='add-mission-btn'
              onClick={this.handleAddMission}
            >
              Добавить еще миссию
            </button>
          </div>

          <div className='requirementsTab-right'>
            <h3 className='requirementsTab-title'>Ранг</h3>
            
            <div className='rank-select-wrapper'>
              <select
                className='rank-select'
                value={selectedRank}
                onChange={this.handleRankChange}
              >
                <option value="">Выбрать</option>
                {ranks.map((rank, index) => (
                  <option key={index} value={rank}>
                    {rank}
                  </option>
                ))}
              </select>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

export default RequirementsTab;