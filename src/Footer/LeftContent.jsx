import React from 'react';
import styles from './Footer.module.css';
import LeftContentData from './LeftContentData';

const LeftContent = () =>{
    return(
        <div className={styles["left-content-container"]}>
            {LeftContentData.map((footerList) => (
            <div className={styles["left-footer-column"]}>
                <h3 className={styles.title}>{footerList.introduction}</h3>
                <ul>
                    {footerList.subMenuConTact.map((subContent) => (
                        <li>
                            <a href={subContent.link}>
                                <div className={styles.imageIcon}>
                                    {subContent.imageIcon}
                                </div>
                                {subContent.content}
                            </a>
                        </li>
                    ))}
                </ul>
            </div>
            ))}
        </div>
    );
}
export default LeftContent;