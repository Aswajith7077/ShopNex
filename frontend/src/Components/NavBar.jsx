import React, { useState } from "react";
import { colors } from "../Constants";
import { ArrowRight } from "lucide-react";
import { color, motion } from "framer-motion";
import { useRef } from "react";
import { logo } from "../assets";
import { FaCartShopping } from "react-icons/fa6";
import { FaUserCircle } from "react-icons/fa";

const NavBar = ({searchBar = true,className = ''}) => {
  const reference = useRef(null);

  return (
    <header className={`flex py-3 items-center justify-between ${className}`}>
      <img src={logo} alt="" className="w-[13%] ml-10" />
      {searchBar && <div
          ref={reference}
          className={`flex flex-row w-[60%] md:w-[35%] bg-white rounded-full border-2 border-white`}
        >
          <input
            placeholder="Search new products"
            className="w-full px-[7%] md:px-[5%] py-3 outline-none rounded-full"
            onFocus={() => {
              reference.current.style.borderColor = "#29FFD8";
            }}
            onBlur={() => {
              reference.current.style.borderColor = "white";
            }}
          ></input>
          <motion.button
            className={`rounded-full bg-[#29FFD8] p-3 m-1`}
            whileHover={{
              scale: 1.15,
              transition: { duration: 0.2 }
            }}
            whileTap={{
              scale: 0.9,
              transition: { duration: 0.2 }
            }}
            onHoverStart={(event) => {}}
            onHoverEnd={(event) => {}}
          >
            <ArrowRight size={20} strokeWidth={2.75} absoluteStrokeWidth />
          </motion.button>
        </div>}

      <div className="flex flex-row justify-evenly">
        <FaCartShopping size={36} className="mx-10"/>
        <FaUserCircle size={36} className="mx-10"/>
      </div>
    </header>
  );
};

export default NavBar;
