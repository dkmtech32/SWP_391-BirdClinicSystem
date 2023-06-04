import React from 'react';
import styles from './Appointment.module.css';
import CustomizedTables from './AppointmentTable';
import HistoryIcon from '@mui/icons-material/History';


const AppointmentHistory = () => {
    return(
        <div className={styles["table-container"]}>
            <div className={styles["history-bar"]}>
                <HistoryIcon sx={{fontSize: 70, margin: 1.5}} />
                <h1>Appointment History</h1>
            </div>
            <CustomizedTables></CustomizedTables>
        </div>
    );
}
export default AppointmentHistory;