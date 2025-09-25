import { useState } from 'react'
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import Card from "./Card"
// import {CardOutro} from "./Card"
import { AiFillHeart } from "react-icons/ai";

import './App.css'

function App() {
  const [count, setCount] = useState(0)
  
  return (
    <>
    <AiFillHeart />
    <h1>Tipos de som</h1>
    
    <div className="cards">
      <Card titulo="Som de Chuva" descricao="Essa sinfonia da natureza, ao não apresentar grandes variações ou ameaças, induz a um estado de tranquilidade, sendo interpretada como uma melodia reconfortante e hipnotizante. " img="/chuva.jpg"/>
      <Card titulo="Som de Vento" descricao="O vento leve que passa por folhas e galhos de árvores cria um som suave, o sussurro ou farfalhar, que são vibrações rápidas e irregulares." img="/vento.jpg"/>
      <Card titulo="Som de Floresta" descricao="é uma complexa 'sinfonia' de sons naturais provenientes de fontes diversas, como o vento a sussurrar nas folhas, o canto e ruídos de pássaros e insetos, o murmurar de córregos e a chuva, e o som de água a correr e a cair" img="/floresta.jpg"/>
    </div>
      
    </>
  )
}

export default App
