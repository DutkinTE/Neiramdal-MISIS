import React from 'react';
import './EmptyState.css';

export const EmptyState: React.FC = () => {
  return (
    <div className='emptyState'>
      <h2>Выберите миссию из списка или создайте новую</h2>
    </div>
  );
};

export default EmptyState;