import React from "react";
import styles from "./Menu.module.css";
import menuOptions from './MenuOptions';

const MenuBar = () => {
  return (
    <div className={styles["menu-bar"]}>
      <nav>
        <ul className={styles["menu-options-list"]}>
          <li className={styles["menu-options"]}><a href="#home" alt="">Home</a></li>
          <li className={styles["menu-options"]}><a href="#about" alt="">About</a></li>
          <li className={styles["menu-options"]}><a href="#services" alt="">Services</a></li>
          <li className={styles["menu-options"]}><a href="#booking" alt="">Booking</a></li>
          <li className={styles["dropdown-button"]}><a href="#page" alt="" className={styles.hover}>Page</a>
            <ul className={styles["dropdown-menu"]}>
              {menuOptions.map((dropdown) => (
                <li>
                  <a href={dropdown.link} alt="" className={styles["dropdown-item"]}>{dropdown.name}</a>
                </li>
              ))}
            </ul>
          </li>
          <li className={styles["menu-options"]}><a href="#contact" alt="">Contact</a></li>
        </ul>
      </nav>
      <div>
        <button>
          <a href="#button" alt="">Get Quote</a>
        </button>
      </div>
    </div>
  );
};

export default MenuBar;
