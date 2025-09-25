import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

function App() {
  const [count, setCount] = useState(0)

  return (
    <>
      <h1>Olá, mundo</h1>
      <div className="card">
        Som de chuva
      </div>
      <div className="card">
        Som de Vento 
      </div>
      <div className="card">
        Som de Fogueira
      </div>
    </>
  )
}

export default App
