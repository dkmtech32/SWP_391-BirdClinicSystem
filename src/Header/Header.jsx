import React from "react";
import styles from './Header.module.css';
import HeaderBarDiv from './HeaderBarDiv';
import HeaderLogoDiv from './HeaderLogoDiv';

const Header = () =>{
    return(
        <div className={styles.header}>
            <HeaderBarDiv/>
            <HeaderLogoDiv/>
        </div>
    );
}
export default Header;