import { motion } from "motion/react";

const logos = [
  "Logo 1",
  "Logo 2",
  "Logo 3",
  "Logo 4",
  "Logo 5",
];

export default function LogoScroller() {
  return (
    <div className="h-64 overflow-hidden relative border border-gray-300 rounded-lg p-4">
      <motion.div
        className="flex flex-col gap-4"
        animate={{ y: ["0%", "-50%"] }}
        transition={{
          duration: 10,
          ease: "linear",
          repeat: Infinity,
        }}
      >
        {[...logos, ...logos].map((logo, index) => (
          <div key={index} className="h-16 flex items-center justify-center bg-gray-200 rounded font-bold">
            {logo}
          </div>
        ))}
      </motion.div>
    </div>
  );
}
