import React from "react";
import styles from "./Footer.module.css";
import AboveFooter from './AboveFooter';
import BelowFooter from "./BelowFooter";

const Footer = () =>{
    return(
        <div className={styles["footer-container"]}>
            <AboveFooter></AboveFooter>
            <BelowFooter></BelowFooter>
        </div>
    );
}
export default Footer;