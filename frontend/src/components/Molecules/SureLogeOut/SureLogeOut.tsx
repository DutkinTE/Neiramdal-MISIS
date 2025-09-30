import React from 'react';
import { Link } from 'react-router-dom';
import "./SureLogeOut.css";

interface SureLogeOutProps {
  onClose: () => void;
}

const SureLogeOut: React.FC<SureLogeOutProps> = ({ onClose }) => {
    return (
        <div className="sureLogeOut">
            <div className="sureLogeOut_modal">
                
                <button className="sureLogeOut_close" onClick={onClose}>
                    <img src="/assets/cross.svg" alt="Закрыть" />
                </button>
                
                <h2 className="sureLogeOut_title">Точно выйти?</h2>
                
                <div className="sureLogeOut-buttons">
                    <Link 
                        to="/logIn" 
                        className="sureLogeOut-butn sureLogeOut-butn_exit"
                    >
                        Выйти
                    </Link>
                    <button 
                        className="sureLogeOut-butn sureLogeOut-butn_stay"
                        onClick={onClose}
                    >
                        Остаться
                    </button>
                </div>
            </div>
        </div>
    );
}

export default SureLogeOut;