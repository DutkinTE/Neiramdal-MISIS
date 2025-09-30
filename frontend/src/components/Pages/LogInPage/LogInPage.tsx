import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import "./LogInPage.css";

const LogInPage: React.FC = () => {
    const [login, setLogin] = useState<string>('');
    const [password, setPassword] = useState<string>('');
    const navigate = useNavigate();

    const handleSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        
        if (login.trim() && password.trim()) {
            navigate('/dashboard');
        }
    };

    return (
        <div className='LogInPage'>

<img 
                src="../../../../public/assets/aklabugaSvgBackgroundIcon.svg" 
                alt="" 
                className='LogInPage_bgIcon LogInPage_bgIcon--topRight'
            />
            <img 
                src="../../../../public/assets/aklabugaSvgBackgroundIcon.svg" 
                alt="" 
                className='LogInPage_bgIcon LogInPage_bgIcon--bottomLeft'
            />
            <div className='LogInPage_block'>
                <div className='LogInPage_LeftSide'>
                    <div className='LogInPage_LeftSide-upper'>
                        <img src="/assets/logo.svg" alt="Логотип Алабуга" />
                        <h2>Добро пожаловать на HR-платформу!</h2>
                    </div>
                    <div className='LogInPage_LeftSide'>
                        <a href="#" className=''>Где получить доступ?</a>
                    </div>
                </div>

                <div className='LogInPage_RightSide'>
                    <h3>Введите логин и пароль</h3>
                    
                    <form onSubmit={handleSubmit} className='LogInPage_RightSide-form'>
                        <div className='LogInPage_RightSide-inputs'>
                            <div className='LogInPage_RightSide-input'>
                                <h4>Логин</h4>
                                <input 
                                    type="text" 
                                    placeholder='ivanov.ivan@alabuga.ru'
                                    value={login}
                                    onChange={(e) => setLogin(e.target.value)}
                                    required
                                />
                            </div>
                            
                            <div className='LogInPage_RightSide-input'>
                                <h4>Пароль</h4>
                                <input 
                                    type="password"
                                    placeholder='алабугалучшая2025'
                                    value={password}
                                    onChange={(e) => setPassword(e.target.value)}
                                    required
                                />
                            </div>
                        </div>
                        
                        <button 
                            type="submit" 
                            className='LogInPage_RightSide-button'
                            disabled={!login.trim() || !password.trim()}
                        >
                            Войти
                        </button>
                    </form>
                </div>
            </div>
        </div>
    );
};

export default LogInPage;