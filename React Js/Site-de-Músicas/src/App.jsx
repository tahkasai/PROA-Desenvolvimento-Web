import './App.css'
import Card from './Card'
import { useState } from "react";

export default function App() {
  // Esse estado manipula qual som está ativo no momento
  const [cardStates, setCardStates] = useState({
    rain: false,
    wind: false,
    forest: false
  });

  var [titulo, setTitulo] = useState("Sons da Vida!");

  // Função para alternar o estado do card clicado
  const toggleCardState = (cardType) => {
    
    setCardStates(previous => ({ // previous é o estado anterior de todos os cards
      ...previous, // Mantém os estados dos outros cards
      [cardType]: !previous[cardType] // Alterna o estado do card clicado
      // se rain for true, vira false
      // se rain for false, vira true
    }));
  };

  const playSound = (soundType) => {

    const audio = new Audio();

    switch (soundType) {
      case 'rain':
        // Using a nature sounds API or local file
        console.log('Tocar som de chuva...');
        audio.src = '/Chuva.mp3';
        audio.play();
        break;
      case 'wind':
        audio.src = '/vento.mp3';
        audio.play();
        break;
      case 'forest':
        audio.src = '/floresta.mp3';
        audio.play();
        break;
    }
  };

  return (
    <>
      <div className="informacao">
        <h1>Ruído Branco</h1>
        <p>Relaxe e concentre-se nos sons da natureza</p>
      </div>
      <div className="cards">
        <Card 
          titulo="Som de Vento" 
          descricao="Um sopro livre, ora leve e sussurrante, ora forte e imponente." 
          tempo="03:03" 
          img="/vento.jpg" 
          altImg="imagem de dois coqueiros sendo atingidos pelo vento"
          onClick={() => {
            playSound('wind');
            toggleCardState('wind');
            setTitulo("Som de Vento");
          }}
        />

        <Card 
          titulo="Som de Chuva" 
          descricao="Um som suave e constante, como pequenas batidas que trazem calma e aconchego." 
          tempo="04:56" 
          img="/chuva.png" 
          altImg="Plantinha sendo regada pela chuva"
          onClick={() => {
            playSound('rain');
            toggleCardState('rain');
            setTitulo("Som de Chuva");
          }}
        />

        <Card 
          titulo="Som de Floresta" 
          descricao="Uma mistura de cantos de pássaros, farfalhar de folhas e vida pulsando em harmonia." 
          tempo="02:45" 
          img="/floresta.jpg" 
          altImg="floresta com um corrego no meio"
          onClick={() => {
            playSound('forest');
            toggleCardState('forest');
            setTitulo("Som de Floresta");
          }}
        />
      </div>
    </>
  )
}

