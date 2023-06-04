import React from "react";
import styles from "./Header.module.css";
import HeaderLogoData from "./HeaderLogoData";

const HeaderBarDiv = ({logos}) => {
  return (
    <div className={styles["header-bar-div"]}>
      <div>
        <nav>
          <ul className={styles["header-bar-contact-information"]}>
            <li>
              <a href="#FAQs">FAQs</a>
            </li>
            <li>
              <a href="#Help">Help</a>
            </li>
            <li>
              <a href="#Support">Support</a>
            </li>
          </ul>
        </nav>
      </div>
      <div className={styles["header-social-plaform-logo"]}>
        {HeaderLogoData.map((logos) => (
            <a target={"blank"} href="#logos.imageLink" alt="" className={styles["imageLogo"]}>
              {logos.imageLogo}
            </a>
        ))}
      </div>
    </div>
  );
};
export default HeaderBarDiv;
