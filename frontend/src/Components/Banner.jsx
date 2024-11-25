import React, { useState, useEffect, useRef } from "react";
import { colors } from "../Constants";
import { motion, AnimatePresence } from "framer-motion";

const bannerElements = [
  {
    title: "Realtek V51",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  },
  {
    title: "Realtek V52",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  },
  {
    title: "Realtek V53",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  },
  {
    title: "Realtek V54",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  },
  {
    title: "Realtek V55",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  },
  {
    title: "Realtek V56",
    description:
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ",
    link: "https://www.google.com",
    image:
      "https://firebasestorage.googleapis.com/v0/b/e-commerce-31af1.appspot.com/o/noiseCancellationHeadphones.png?alt=media&token=04dd5eef-220b-4a90-9d8f-3a7cc40e59c2"
  }
];



const Banner = ({ className = "" }) => {
  const references = bannerElements.map((value, key) => useRef(null));
  const buttons = bannerElements.map((value, key) => useRef(null));
  const value = bannerElements[0];

  

  const renderArray = bannerElements.map((value, key) => (
    <li key={key} className=" h-full">
      <motion.div
        ref={references[key]}
        className="border-2 border-blue-500 w-[110rem]  my-5 h-[30rem] bg-black rounded-[40px] px-[5%] py-[5%]"
        initial={{ opacity: 1, scale: 0.95 }}
        whileInView={{ opacity: 1, scale: 1 }}
        exit={{ opacity: 1, scale: 0.95 }}
      >
        <h1 className={`text-2xl font-bold text-white mb-5`}>{value.title}</h1>
        <p className="text-sm text-white">{value.description}</p>
        <button
          className={` mt-10 px-[5%] py-3 bg-[#29FFD8] text-black border-2 border-gray-700 hover:border-[#29FFD8] rounded-full`}
          onClick={(event) => handleScroll(event, key)}
        >
          Explore
        </button>
      </motion.div>
    </li>
  ));

  const banner = useRef(null);
  const [indices, setIndices] = useState([renderArray.length - 1, 0]);

  var current = [renderArray[renderArray.length - 1],renderArray[0]];

  var current = 0;
  var previousBanner = 0;

  // useEffect(() => {
  //   const interval = setInterval(() => {

  //     current = (current + 1) % bannerElements.length;
  //     handleScroll(null, current);

  //   }, 5000);
  //   return () => clearInterval(interval);
  // }, []);

  const handleScroll = (e, key) => {
    buttons[previousBanner].current.style.width = "15px";
    references[key].current?.scrollIntoView({
      behavior: "smooth",
      block: "center",
      inline: "center"
    });
    buttons[key].current.style.width = "30px";
    previousBanner = key;
  };

  return (
    <div>
      <div className={`flex justify-center items-center `}>
        {/* <div className="absolute left-0 w-[10rem] h-full bg-gradient-to-r from-[#FFFFFF55]"></div> */}
        <ul ref={banner} className="flex flex-row overflow-hidden gap-[5%] px-[2%]">
          {bannerElements.map((value, key) => (
            <li key={key} className=" h-full">
              <motion.div
                ref={references[key]}
                className="border-2 border-blue-500 w-[110rem]  my-5 h-[30rem] bg-black rounded-[40px] px-[5%] py-[5%]"
                initial={{ opacity: 1, scale: 0.95 }}
                whileInView={{ opacity: 1, scale: 1 }}
                exit={{ opacity: 1, scale: 0.95 }}
              >
                <h1 className={`text-2xl font-bold text-white mb-5`}>
                  {value.title}
                </h1>
                <p className="text-sm text-white">{value.description}</p>
                <button
                  className={` mt-10 px-[5%] py-3 bg-[#29FFD8] text-black border-2 border-gray-700 hover:border-[#29FFD8] rounded-full`}
                  onClick={(event) => handleScroll(event,indices[1])}
                >
                  Explore
                </button>
              </motion.div>
            </li>
          ))}
        </ul>
        {/* <div className="absolute right-0 w-[10rem] h-full bg-gradient-to-r from-transparent to-[#FFFFFF66] z-1"></div> */}
      </div>
      <div className="flex w-full justify-center items-center">
        {bannerElements.map((value, key) => (
          <button
            key={key}
            ref={buttons[key]}
            className="rounded-full w-[15px] h-[15px] bg-gray-700 mx-1"
          ></button>
        ))}
      </div>
    </div>
  );
};

export default Banner;
