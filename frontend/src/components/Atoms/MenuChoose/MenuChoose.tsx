import React from 'react';
import { Link, useLocation } from 'react-router-dom';
import './MenuChoose.css';

interface MenuChooseProps {
  srcIcon: string;       
  activeIcon: string;    
  alt: string;
  title: string;
  badgeText?: string;
  to: string; 
}

export const MenuChoose = ({ 
  srcIcon, 
  activeIcon,
  alt, 
  title, 
  badgeText,
  to 
}: MenuChooseProps) => {
  const location = useLocation();
  const isActive = location.pathname === to;

  return (
    <Link to={to} className={`MenuChoose ${isActive ? 'MenuChoose--active' : ''}`}>
      <img 
        src={isActive ? activeIcon : srcIcon} 
        alt={alt} 
        className='MenuChoose_icon' 
      />
      <h4 className='MenuChoose_title'>{title}</h4>
      {badgeText && (
        <div className='MenuChoose_badge'>
          {badgeText} 
        </div>
      )}
    </Link>
  );
};

export default MenuChoose;