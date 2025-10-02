import React from 'react';
import './UserLine.css';

interface UserLineProps {
  index: number;
  avatarUrl?: string; 
  lastName: string;
  firstName: string;
  xp: number;
}

const UserLine: React.FC<UserLineProps> = ({ 
  index, 
  avatarUrl, 
  lastName, 
  firstName, 
  xp 
}) => {
  return (
    <div className='UserLine-block'>
      <div className='UserLine-block_leftSide'>
        <h4>{index}</h4>
        <div 
          className='UserLine-block_img'
          style={avatarUrl ? { backgroundImage: `url(${avatarUrl})` } : {}}
        >
          {!avatarUrl && (
            <div className='UserLine-block_placeholder'></div>
          )}
        </div>
        <div className='UserLine-block_nameLastname'> 
          <h4>{lastName}</h4>
          <h4>{firstName}</h4>
        </div>
      </div>
      <div className='UserLine-block_XP'>
        <h5>{xp}</h5> 
        <h5>XP</h5>
      </div>
    </div>
  );
}

export default UserLine;