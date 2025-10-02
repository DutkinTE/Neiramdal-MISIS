import React from 'react';
import './MissionsTab.css';
import TitleTab from '../../Atoms/TitleTab/TitleTab.tsx';
import MissionComponent from '../../Atoms/MissionComponent/MissionComponent.tsx';

const MissionsTab = () => {
  const missions = [
    { index: 1, missionName: "Первая миссия" },
    { index: 2, missionName: "Вторая миссия" },
    { index: 3, missionName: "Третья миссия" },
    { index: 4, missionName: "Четвертая миссия" },
    { index: 5, missionName: "Пятая миссия" },
    { index: 6, missionName: "Шестая миссия" }
  ];

  return (
    <div className='MissionsTab-container'>
      <TitleTab/>
      <div className='MissionsTab-contentBlock'>
        {missions.map(mission => (
          <MissionComponent
            key={mission.index}
            index={mission.index}
            missionName={mission.missionName}
          />
        ))}
      </div>
    </div>
  );
}

export default MissionsTab;