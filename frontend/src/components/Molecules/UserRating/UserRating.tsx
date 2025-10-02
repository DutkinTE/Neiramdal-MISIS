import React from 'react';
import UserLine from '../../Atoms/UserLine/UserLine.tsx';
import './UserRating.css';

const UserRating = () => {
 
    const users = [
            { index: 1, lastName: "Иванов", firstName: "Алексей", xp: 890, avatarUrl: "" },
            { index: 2, lastName: "Петрова", firstName: "Мария", xp: 745 },
            { index: 3, lastName: "Сидоров", firstName: "Дмитрий", xp: 632 },
            { index: 4, lastName: "Кузнецова", firstName: "Анна", xp: 587 },
            { index: 5, lastName: "Смирнов", firstName: "Михаил", xp: 521 },
            { index: 6, lastName: "Попов", firstName: "Артем", xp: 498 },
            { index: 7, lastName: "Васильева", firstName: "Елена", xp: 456 },
            { index: 8, lastName: "Новиков", firstName: "Сергей", xp: 423 },
            { index: 9, lastName: "Федорова", firstName: "Ольга", xp: 398 },
            { index: 10, lastName: "Морозов", firstName: "Иван", xp: 367 },
            { index: 11, lastName: "Волкова", firstName: "Наталья", xp: 345 },
            { index: 12, lastName: "Алексеев", firstName: "Павел", xp: 321 },
            { index: 13, lastName: "Лебедева", firstName: "Светлана", xp: 298 },
            { index: 14, lastName: "Семенов", firstName: "Андрей", xp: 276 },
            { index: 15, lastName: "Егорова", firstName: "Татьяна", xp: 254 },
            { index: 16, lastName: "Павлов", firstName: "Роман", xp: 231 },
            { index: 17, lastName: "Ковалева", firstName: "Юлия", xp: 215 },
            { index: 18, lastName: "Орлов", firstName: "Владимир", xp: 198 },
            { index: 19, lastName: "Андреева", firstName: "Ирина", xp: 187 },
            { index: 20, lastName: "Захаров", firstName: "Никита", xp: 165 }
        ];


    return (
        <div>
            <div className='UserRating-block'>
                <h2>Рейтинг за последний месяц</h2>
                <div className='UserRating-block_users'>
                {users.map(user => (
                    <UserLine
                    key={user.index}
                    index={user.index}
                    lastName={user.lastName}
                    firstName={user.firstName}
                    xp={user.xp}
                    />
                ))}
                </div>
            </div>
        </div>
    );
}

export default UserRating;
