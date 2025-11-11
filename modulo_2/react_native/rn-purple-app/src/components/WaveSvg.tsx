import React from "react";
import Svg, { Path } from "react-native-svg";

export default function WaveSvg({ opacity = 0.25 }: { opacity?: number }) {
  return (
    <Svg width="100%" height="220" viewBox="0 0 1440 320" style={{ position: "absolute", top: 0 }}>
      <Path
        fill="#ff2fd8"
        fillOpacity={opacity}
        d="M0,224L48,192C96,160,192,96,288,69.3C384,43,480,53,576,69.3C672,85,768,107,864,133.3C960,160,1056,192,1152,181.3C1248,171,1344,117,1392,90.7L1440,64L1440,0L1392,0C1344,0,1248,0,1152,0C1056,0,960,0,864,0C768,0,672,0,576,0C480,0,384,0,288,0C192,0,96,0,48,0L0,0Z"
      />
    </Svg>
  );
}