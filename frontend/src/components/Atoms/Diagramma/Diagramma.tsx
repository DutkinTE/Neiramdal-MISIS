import React from 'react';
import "./Diagramma.css";

interface DiagramData {
  name: string;
  value: number;
  color: string;
}

interface DiagrammaProps {
  data?: DiagramData[]; 
}

const Diagramma: React.FC<DiagrammaProps> = ({ 
  data = [
    { name: "Соц. сети", value: 30, color: "#283E95" },
    { name: "HH.ru", value: 25, color: "#005DAC" },
    { name: "Реклама", value: 20, color: "#00AEEF" },
    { name: "Рекомендации друзей", value: 15, color: "#6ACFF6" },
    { name: "Другое", value: 10, color: "#B7E7FA" }
  ]
}) => {
  const total = data.reduce((sum, item) => sum + item.value, 0);
  
  const calculateDashArray = (values: number[]) => {
    const circumference = 2 * Math.PI * 70;
    const dashArray: string[] = [];

    values.forEach(value => {
      const percentage = value / total;
      const segmentLength = percentage * circumference;
      dashArray.push(`${segmentLength} ${circumference}`);
    });

    return dashArray;
  };

  const dashArrays = calculateDashArray(data.map(item => item.value));

  return (
    <div className="diagramma diagramma--light">
      <h2 className="diagramma__title">Источники трафика</h2>
      
      <div className="diagramma__content">
        <div className="diagramma__sources">
          {data.map((item, index) => (
            <div key={index} className="diagramma__source-item">
              <div 
                className="diagramma__color-square"
                style={{ backgroundColor: item.color }}
              />
              <h4 className="diagramma__source-name">{item.name}</h4>
            </div>
          ))}
        </div>

        <div className="diagramma__chart">
          <svg 
            width="164" 
            height="164" 
            viewBox="0 0 164 164"
            className="diagramma__pie"
          >
            <circle 
              cx="82" 
              cy="82" 
              r="70" 
              fill="none" 
              stroke="transparent" 
              strokeWidth="24"
            />
            
            {data.map((item, index) => (
              <circle
                key={index}
                cx="82"
                cy="82"
                r="70"
                fill="none"
                stroke={item.color}
                strokeWidth="24"
                strokeDasharray={dashArrays[index]}
                strokeDashoffset={index === 0 ? 0 : `-${data.slice(0, index).reduce((sum, d) => sum + (d.value/total) * (2 * Math.PI * 70), 0)}`}
                transform="rotate(-90 82 82)"
                className="diagramma__segment"
              />
            ))}
          </svg>
        </div>
      </div>
    </div>
  );
};

export default Diagramma;