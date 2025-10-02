import React from 'react';
import './StatisticUpperDashboard.css';

interface StatisticUpperDashboardProps {
  h1Text: string;
  h4Text: string;
  percentage: number;
}

export const StatisticUpperDashboard: React.FC<StatisticUpperDashboardProps> = ({ 
  h1Text, 
  h4Text, 
  percentage 
}) => {
  const percentageClass = percentage > 0 ? 'StatisticUpperDashboard_percentage--green' : 'StatisticUpperDashboard_percentage--red';

  return (
    <div className='StatisticUpperDashboard'>
      <div className='StatisticUpperDashboard-text'>
        <h1 className='StatisticUpperDashboard_h1'>{h1Text}</h1>
        <h4 className='StatisticUpperDashboard_h4'>{h4Text}</h4>
      </div>
      <div className={`StatisticUpperDashboard_percentage ${percentageClass}`}>
        {percentage > 0 ? `+${percentage}%` : `${percentage}%`}
      </div>
    </div>
  );
};

export default StatisticUpperDashboard;
