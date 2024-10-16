import React from 'react';
import biohazard from './biohazard.json';
import './loading.css'; // Import the CSS for the spinner
import Lottie from 'lottie-react';

const Loading: React.FC = () => {
  return (
    <div className="spinner-container">
      <div />
      <Lottie animationData={biohazard} />
    </div>
  );
};

export default Loading;