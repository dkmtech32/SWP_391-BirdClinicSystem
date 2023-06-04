import * as React from 'react';
import { styled } from '@mui/material/styles';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell, { tableCellClasses } from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import rows from './AppointmentData';
import styles from './Appointment.module.css'

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: theme.palette.common.black,
    color: theme.palette.common.white,
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 18,
  },
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  '&:nth-of-type(odd)': {
    backgroundColor: theme.palette.action.hover,
  },
  // hide last border
  '&:last-child td, &:last-child th': {
    border: 0,
  },
}));

// function createData(name, calories, fat, carbs, protein) {
//     return { name, calories, fat, carbs, protein };
// }
  

export default function CustomizedTables() {
  return (
    <TableContainer sx={{borderRadius: 0}} component={Paper}>
      <Table sx={{ minWidth: 700 }} aria-label="customized table">
        <TableHead>
          <TableRow>
            <StyledTableCell sx={{fontSize: 18}} align="left">Docter Name</StyledTableCell>
            <StyledTableCell sx={{fontSize: 18}} align="center">Services</StyledTableCell>
            <StyledTableCell sx={{fontSize: 18}} align="center">Appointment Date</StyledTableCell>
            <StyledTableCell sx={{fontSize: 18}} align="center">Appointment Time</StyledTableCell>
            <StyledTableCell sx={{fontSize: 18}} align="center">Status</StyledTableCell>
            {/* <StyledTableCell sx={{fontSize: 18}} align="center">View</StyledTableCell> */}
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <StyledTableRow key={row.name}>
              <StyledTableCell component="th" scope="row" sx={{padding:"1.5rem 1rem", display:"flex"}}>
                <img src={row.doctorImage} alt='' className={styles["doctor-avatar"]}/>
                <div className={styles["doctor-name"]}>{row.name}</div>
              </StyledTableCell>
              <StyledTableCell align="center">{row.services}</StyledTableCell>
              <StyledTableCell align="center">{row.date}</StyledTableCell>
              <StyledTableCell align="center">{row.time}</StyledTableCell>
              <StyledTableCell align="center">{row.status}</StyledTableCell>
              {/* <StyledTableCell align="center"><a href={row.viewDetail} alt=''>View Detail</a></StyledTableCell> */}
            </StyledTableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

