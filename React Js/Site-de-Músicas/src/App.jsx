import './App.css'
import Card from './Card'
import { useState, useRef } from "react";
import { IoPlay } from "react-icons/io5";
import { FaPause } from "react-icons/fa6";

export default function App() {
  const [cardStates, setCardStates] = useState({
    rain: false,
    wind: false,
    forest: false
  });

  const audioRefs = {
    rain: useRef(new Audio('/chuva.mp3')),
    wind: useRef(new Audio('/vento.mp3')),
    forest: useRef(new Audio('/floresta.mp3'))
  };

  const toggleCardState = (cardType) => {
    setCardStates(prev => {
      const isPlaying = prev[cardType];

      if (isPlaying) {
        audioRefs[cardType].current.pause();
        audioRefs[cardType].current.currentTime = 0;
      } else {
        audioRefs[cardType].current.play();
      }

      return {
        ...prev,
        [cardType]: !isPlaying
      };
    });
  };

  return (
    <>
      <div className="informacao">
        <h1>Sons da Natureza</h1>
        <p>Relaxe e concentre-se nos sons da natureza</p>
      </div>
      <div className="cards">
        <Card 
          titulo="Som de Vento" 
          descricao="Um sopro livre, ora leve e sussurrante, ora forte e imponente." 
          tempo="00:30" 
          img="/vento.jpg" 
          altImg="imagem de dois coqueiros sendo atingidos pelo vento"
          icone={cardStates.wind ? <FaPause /> : <IoPlay />}
          onClick={() => toggleCardState('wind')}
        />

        <Card 
          titulo="Som de Chuva" 
          descricao="Um som suave e constante, como pequenas batidas que trazem calma e aconchego." 
          tempo="01:56" 
          img="/chuva.png" 
          altImg="Plantinha sendo regada pela chuva"
          icone={cardStates.rain ? <FaPause /> : <IoPlay />}
          onClick={() => toggleCardState('rain')}
        />

        <Card 
          titulo="Som de Floresta" 
          descricao="Uma mistura de cantos de pássaros, farfalhar de folhas e vida pulsando em harmonia." 
          tempo="00:30" 
          img="/floresta.jpg" 
          altImg="floresta com um corrego no meio"
          icone={cardStates.forest ? <FaPause /> : <IoPlay />}
          onClick={() => toggleCardState('forest')}
        />
      </div>
    </>
  )
}
