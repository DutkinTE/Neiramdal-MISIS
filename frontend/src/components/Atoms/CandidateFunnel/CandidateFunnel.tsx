import React from 'react';
import './CandidateFunnel.css';

interface FunnelItem {
  value: number;
}

interface CandidateFunnelProps {
  title: string;
  data: FunnelItem[];
  maxValue?: number;
}

export const CandidateFunnel: React.FC<CandidateFunnelProps> = ({ 
  title, 
  data,
  maxValue 
}) => {
  const labels = [
    "Кандидатов",
    "Прошедших тестирование", 
    "Приглашенных на собеседование",
    "Полученных офферов",
    "Вышедших на работу"
  ];
 
  

  const calculatedMaxValue = maxValue || Math.max(...data.map(item => item.value));
  
  const calculateLineWidth = (value: number) => {
    const minWidth = 7 * 16; 
    const maxWidth = 45.8 * 16;
    const minValue = 200;
    
    if (value <= minValue) return minWidth;
    if (value >= calculatedMaxValue) return maxWidth;
    
    const percentage = (value - minValue) / (calculatedMaxValue - minValue);
    return minWidth + percentage * (maxWidth - minWidth);
};

  return (
    <div className='CandidateFunnel'>
      <h2 className='CandidateFunnel_title'>{title}</h2>
      
      <div className='CandidateFunnel_content'>
        {data.map((item, index) => (
          <div key={index} className='CandidateFunnel_item'>
            <div className='CandidateFunnel_label'>
              <h4>{labels[index]}</h4>
            </div>
            
            <div className='CandidateFunnel_stats'>
              <div 
                    className='CandidateFunnel_line'
                    style={{ width: `${calculateLineWidth(item.value)}px` }}
                >
                    <span className='CandidateFunnel_lineText'>
                    {item.value.toLocaleString()}
                    </span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
};

export default CandidateFunnel;