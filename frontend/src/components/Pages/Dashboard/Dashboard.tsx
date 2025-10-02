import './Dashboard.css';
import StatisticUpperDashboard from "../../Atoms/StatisticUpperDashboard/StatisticUpperDashboard.tsx";
import CandidateFunnel from "../../Atoms/CandidateFunnel/CandidateFunnel.tsx";
import Diagramma from "../../Atoms/Diagramma/Diagramma.tsx";
import MockDashboardComponent from "../../Atoms/MockDashboardComponent/MockDashboardComponent.tsx"
import UserRating from '../../Molecules/UserRating/UserRating.tsx';


const Dashboard = () => {

    const funnelData = [
        { value: 3000 },
        { value: 1300 },
        { value: 800 },
        { value: 400 },
        { value: 300 }
    ];

    return (
      <div className='Dashboard'>
        <div className='Dashboard-block'>

            <div className='Dashboard-centerBlocks'>

                <div className='Dashboard-upperStatistics'>
                    <div className='Dashboard-upperStatistics__register'>
                        <StatisticUpperDashboard 
                            h1Text="5306"
                            h4Text="Пользователей зарегистрировано"
                            percentage={+10}
                        />
                    </div>
                    <div className='Dashboard-upperStatistics__newUser'>
                        <StatisticUpperDashboard 
                            h1Text="61"
                            h4Text="Новых пользователей"
                            percentage={+5}
                        />
                    </div>
                    <div className='Dashboard-upperStatistics__exitUser'>
                        <StatisticUpperDashboard 
                            h1Text="25"
                            h4Text="Ушедших пользователей"
                            percentage={-9}
                        />
                    </div>
                </div>

                <div className='Dashboard-candidateFunnel'>
                    <CandidateFunnel 
                        title="Воронка кандидатов"
                        data={funnelData}
                    />
                </div>

                <div className='Dashboard-lowerStatistic'>
                    <div className='Dashboatd-trafficSources'>
                    <Diagramma 
                    />
                    </div>
                    <div className='Dashboatd-bid'>
                    <MockDashboardComponent/>
                    </div>
                </div>
            </div>

            <div className='Dashboard-rating'>
                <UserRating/>
            </div>
        </div>
      </div>
    );
  }
  
  export default Dashboard;