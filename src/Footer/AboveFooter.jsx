import React from 'react';
import styles from './Footer.module.css';
import LeftContent from './LeftContent';

const AboveFooter = () =>{
    return(
        <div className={styles["above-footer-conatainer"]}>
            <div className={styles["description-column"]}>
                <div className={styles["description-intro"]}>
                    <h2 className={styles.bird}>Bird</h2>
                    <h2 className={styles.lover}>Lover</h2>
                </div>
                <p className={styles.description}>
                    blablablablablablablablablabla<br/>
                    blablablablablablablablablabla<br/>
                    blablablablablablablablablabla<br/>
                    blablablablablablablablablabla<br/> 
                    blablablablablablablablablabla<br/>
                    blablablablablablablablablabla<br/>
                </p>
            </div>
            <LeftContent></LeftContent>
        </div>
    );
}
export default AboveFooter;