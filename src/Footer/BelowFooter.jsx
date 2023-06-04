import React from "react";
import styles from "./Footer.module.css";

const BelowFooter = () => {
  return (
    <div className={styles["below-footer-container"]}>
        <ul>
          <li>
            <a href="#privacy">Privacy</a>
          </li>
          <li>
            <a href="#term">Terms</a>
          </li>
          <li>
            <a href="#FAQs">FAQs</a>
          </li>
          <li>
            <a href="#help">Help</a>
          </li>
        </ul>
    </div>
  );
};
export default BelowFooter;
