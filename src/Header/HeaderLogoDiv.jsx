import React from "react";
import styles from "./Header.module.css";
import HeaderContactData from "./HeaderContactData";

const HeaderLogoDiv = (relevant) => {
  return (
    <div className={styles["under-footer"]}>
      <div className={styles["main-logo"]}>
        <a href="#homepage" alt="">
          <img src="images/MainLogo.png" alt="" className={styles["main-logo-image"]}/>
        </a>
      </div>
      <div className={styles["page-contact"]}>
        {HeaderContactData.map((relevant) => (
          <ul className={styles["information-categories"]}>
            <li className={styles["information"]}>
                {relevant.information}
            </li>
            <li className={styles["information-content"]}>
                {relevant.informationContent}
            </li>
          </ul>
        ))}
      </div>
    </div>
  );
};
export default HeaderLogoDiv;
