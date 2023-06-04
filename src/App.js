import './App.css';
import Header from './Header/Header.jsx';
import MenuBar from './MenuBar/Menu';
import AppointmentHistory from './Appoinment/AppointmentHistory';
import Footer from './Footer/Footer'

function App() {
  return (
    <div className="HomePage">
      <Header></Header>
      <MenuBar></MenuBar>
      <AppointmentHistory></AppointmentHistory>
      <Footer></Footer>
    </div>
  );
}

export default App;
