import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <img src={reactLogo} className="logo" alt="Vite logo" />
      {/* é obrigatório a utilização do alt, se não da erro*/}
      <h1>Boa tarde, Turma 5!</h1>
      <p> Editando <code>src/App.jsx</code> e salvando para testar HMR</p>
      {/* O que é JSX? extensão de sintaxe JavaScript que permite escrever código semelhante a HTML */}
    </>
  )
}

export default App
